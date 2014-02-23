#include "sqliteupdate.h"
#include "sqlitequerytype.h"
#include "sqliteexpr.h"
#include "parser/statementtokenbuilder.h"
#include "global.h"
#include <QDebug>

SqliteUpdate::SqliteUpdate()
{
    queryType = SqliteQueryType::Update;
}

SqliteUpdate::SqliteUpdate(const SqliteUpdate& other) :
    SqliteQuery(other), onConflict(other.onConflict), database(other.database), table(other.table), indexedByKw(other.indexedByKw),
    notIndexedKw(other.notIndexedKw), indexedBy(other.indexedBy)
{
    // Special case of deep collection copy
    SqliteExpr* newExpr;
    foreach (const ColumnAndValue& keyValue, keyValueMap)
    {
        newExpr = new SqliteExpr(*keyValue.second);
        newExpr->setParent(this);
        keyValueMap << ColumnAndValue(keyValue.first, newExpr);
    }

    DEEP_COPY_FIELD(SqliteExpr, where);
}

SqliteUpdate::~SqliteUpdate()
{
}

SqliteUpdate::SqliteUpdate(SqliteConflictAlgo onConflict, const QString &name1, const QString &name2, bool notIndexedKw, const QString &indexedBy, const QList<QPair<QString,SqliteExpr*> > values, SqliteExpr *where)
    : SqliteUpdate()
{
    this->onConflict = onConflict;

    if (!name2.isNull())
    {
        database = name1;
        table = name2;
    }
    else
        table = name1;

    this->indexedBy = indexedBy;
    this->indexedByKw = !(indexedBy.isNull());
    this->notIndexedKw = notIndexedKw;
    keyValueMap = values;
    this->where = where;

    if (where)
        where->setParent(this);

    foreach (const ColumnAndValue& keyValue, keyValueMap)
        keyValue.second->setParent(this);
}

SqliteExpr* SqliteUpdate::getValueForColumnSet(const QString& column)
{
    foreach (const ColumnAndValue& keyValue, keyValueMap)
    {
        if (keyValue.first == column)
            return keyValue.second;
    }
    return nullptr;
}

QStringList SqliteUpdate::getColumnsInStatement()
{
    QStringList columns;
    foreach (const ColumnAndValue& keyValue, keyValueMap)
        columns += keyValue.first;

    return columns;
}

QStringList SqliteUpdate::getTablesInStatement()
{
    return getStrListFromValue(table);
}

QStringList SqliteUpdate::getDatabasesInStatement()
{
    return getStrListFromValue(database);
}

TokenList SqliteUpdate::getColumnTokensInStatement()
{
    // This case is not simple. We only have "setlist" in tokensMap
    // and it contains entire: col = expr, col = expr.
    // In order to extract 'col' token, we go through all 'expr',
    // for each 'expr' we get its first token, then locate it
    // in entire "setlist", get back 2 tokens to get what's before "=".
    TokenList list;
    TokenList setListTokens = getTokenListFromNamedKey("setlist");
    int setListTokensSize = setListTokens.size();
    int colNameTokenIdx;
    SqliteExpr* expr;
    foreach (const ColumnAndValue& keyValue, keyValueMap)
    {
        expr = keyValue.second;
        colNameTokenIdx = setListTokens.indexOf(expr->tokens[0]) - 2;
        if (colNameTokenIdx < 0 || colNameTokenIdx > setListTokensSize)
        {
            qCritical() << "Went out of bounds while looking for column tokens in SqliteUpdate::getColumnTokensInStatement().";
            continue;
        }
        list << setListTokens[colNameTokenIdx];
    }
    return list;
}

TokenList SqliteUpdate::getTableTokensInStatement()
{
    return getObjectTokenListFromFullname();
}

TokenList SqliteUpdate::getDatabaseTokensInStatement()
{
    return getDbTokenListFromFullname();
}

QList<SqliteStatement::FullObject> SqliteUpdate::getFullObjectsInStatement()
{
    QList<FullObject> result;

    // Table object
    FullObject fullObj = getFullObjectFromFullname(FullObject::TABLE);

    if (fullObj.isValid())
        result << fullObj;

    // Db object
    fullObj = getFirstDbFullObject();
    if (fullObj.isValid())
    {
        result << fullObj;
        dbTokenForFullObjects = fullObj.database;
    }

    return result;
}

TokenList SqliteUpdate::rebuildTokensFromContents()
{
    StatementTokenBuilder builder;

    builder.withKeyword("UPDATE").withSpace();
    if (onConflict != SqliteConflictAlgo::null)
        builder.withKeyword("OR").withSpace().withKeyword(sqliteConflictAlgo(onConflict)).withSpace();

    if (!database.isNull())
        builder.withOther(database, dialect).withSpace();

    builder.withOther(table, dialect).withSpace();

    if (indexedByKw)
        builder.withKeyword("INDEXED").withSpace().withKeyword("BY").withSpace().withOther(indexedBy, dialect).withSpace();
    else if (notIndexedKw)
        builder.withKeyword("NOT").withSpace().withKeyword("INDEXED").withSpace();

    builder.withKeyword("SET").withSpace();

    bool first = true;
    foreach (const ColumnAndValue& keyVal, keyValueMap)
    {
        if (!first)
            builder.withOperator(",").withSpace();

        builder.withOther(keyVal.first, dialect).withSpace().withOperator("=").withStatement(keyVal.second);
        first = false;
    }

    if (where)
        builder.withSpace().withKeyword("WHERE").withStatement(where);

    return builder.build();
}