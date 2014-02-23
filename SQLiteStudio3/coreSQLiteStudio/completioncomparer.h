#ifndef COMPLETIONCOMPARER_H
#define COMPLETIONCOMPARER_H

#include "expectedtoken.h"
#include "dialect.h"
#include "selectresolver.h"

class CompletionHelper;

class CompletionComparer
{
    public:
        explicit CompletionComparer(CompletionHelper* helper);

        bool operator()(const ExpectedTokenPtr& token1, const ExpectedTokenPtr& token2);

    private:
        CompletionHelper* helper;
        Dialect dialect;
        /**
         * @brief contextDatabases
         * Context objects are any names mentioned anywhere in the query at the same level as completion takes place.
         * The level means the sub-query level, for example in case of sub selects.
         */
        QStringList contextDatabases;
        QStringList contextTables;
        QStringList contextColumns;

        /**
         * @brief parentContextDatabases
         * Parent context objects are any names mentioned anywhere in the the query at all upper levels.
         */
        QStringList parentContextDatabases;
        QStringList parentContextTables;
        QStringList parentContextColumns;
        QList<SelectResolver::Column> resultColumns;

        /**
         * @brief availableTableNames
         * Names of all tables mentioned in FROM clause in the current and all parent select cores.
         */
        QStringList availableTableNames;

        void init();
        bool initSelect();
        bool compareColumns(const ExpectedTokenPtr& token1, const ExpectedTokenPtr& token2);
        bool compareColumnsForSelectResCol(const ExpectedTokenPtr& token1, const ExpectedTokenPtr& token2, bool* result);
        bool compareColumnsForUpdateCol(const ExpectedTokenPtr& token1, const ExpectedTokenPtr& token2, bool* result);
        bool compareColumnsForCreateTable(const ExpectedTokenPtr& token1, const ExpectedTokenPtr& token2, bool* result);
        bool compareTables(const ExpectedTokenPtr& token1, const ExpectedTokenPtr& token2);
        bool compareIndexes(const ExpectedTokenPtr& token1, const ExpectedTokenPtr& token2);
        bool compareTriggers(const ExpectedTokenPtr& token1, const ExpectedTokenPtr& token2);
        bool compareViews(const ExpectedTokenPtr& token1, const ExpectedTokenPtr& token2);
        bool compareDatabases(const ExpectedTokenPtr& token1, const ExpectedTokenPtr& token2);
        bool compareValues(const ExpectedTokenPtr& token1, const ExpectedTokenPtr& token2);
        bool compareValues(const QString& token1, const QString& token2);
        bool compareByContext(const QString &token1, const QString &token2,
                              const QStringList& contextValues);
        bool compareByContext(const QString &token1, const QString &token2,
                              const QStringList& contextValues, const QStringList& secondaryContextValues);
        bool compareByContextOnly(const QString &token1, const QString &token2,
                              const QStringList& contextValues, bool* ok);
        bool isTokenOnAvailableList(const ExpectedTokenPtr& token);
        bool isTokenOnParentAvailableList(const ExpectedTokenPtr& token);
        bool isTokenOnResultColumns(const ExpectedTokenPtr& token);
        static bool isTokenOnColumnList(const ExpectedTokenPtr& token, const QList<SelectResolver::Column>& columnList);
};

#endif // COMPLETIONCOMPARER_H