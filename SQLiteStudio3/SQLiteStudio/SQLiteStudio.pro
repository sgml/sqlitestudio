#-------------------------------------------------
#
# Project created by QtCreator 2013-02-28T23:22:10
#
#-------------------------------------------------

QT       += core gui uitools widgets

include($$PWD/../dirs.pri)
include($$PWD/../utils.pri)

OBJECTS_DIR = $$OBJECTS_DIR/SQLiteStudio
MOC_DIR = $$MOC_DIR/SQLiteStudio
UI_DIR = $$UI_DIR/SQLiteStudio

TARGET = SQLiteStudio
TEMPLATE = app

QMAKE_CXXFLAGS += -std=c++11 -pedantic

SOURCES += main.cpp\
        mainwindow.cpp \
    iconmanager.cpp \
    dbtree/dbtreemodel.cpp \
    dbtree/dbtreeitem.cpp \
    dbtree/dbtree.cpp \
    dbtree/dbtreeview.cpp \
    actionentry.cpp \
    dialogs/dbdialog.cpp \
    uiutils.cpp \
    dbtree/dbtreeitemdelegate.cpp \
    dbtree/dbtreeitemfactory.cpp \
    sqleditor.cpp \
    datagrid/sqlquerymodel.cpp \
    dblistmodel.cpp \
    mdiarea.cpp \
    statusfield.cpp \
    common/tablewidget.cpp \
    datagrid/sqlqueryitem.cpp \
    datagrid/sqlqueryview.cpp \
    datagrid/sqlquerymodelcolumn.cpp \
    datagrid/sqlqueryitemdelegate.cpp \
    common/extlineedit.cpp \
    common/intvalidator.cpp \
    common/widgetcover.cpp \
    mdiwindow.cpp \
    mdichild.cpp \
    taskbar.cpp \
    multieditor/multieditor.cpp \
    multieditor/multieditorwidget.cpp \
    widgetresizer.cpp \
    multieditor/multieditortext.cpp \
    multieditor/multieditornumeric.cpp \
    common/numericspinbox.cpp \
    multieditor/multieditordatetime.cpp \
    multieditor/multieditordate.cpp \
    multieditor/multieditortime.cpp \
    formview.cpp \
    multieditor/multieditorbool.cpp \
    multieditor/multieditorhex.cpp \
    qhexedit2/xbytearray.cpp \
    qhexedit2/qhexedit_p.cpp \
    qhexedit2/qhexedit.cpp \
    qhexedit2/commands.cpp \
    multieditor/multieditordialog.cpp \
    completer/completerwindow.cpp \
    completer/completermodel.cpp \
    completer/completeritemdelegate.cpp \
    completer/completerview.cpp \
    dialogs/searchtextdialog.cpp \
    searchtextlocator.cpp \
    windows/tablewindow.cpp \
    windows/editorwindow.cpp \
    datagrid/sqltablemodel.cpp \
    dataview.cpp \
    windows/tablestructuremodel.cpp \
    windows/tableconstraintsmodel.cpp \
    dialogs/columndialog.cpp \
    dialogs/columndialogconstraintsmodel.cpp \
    common/extactioncontainer.cpp \
    common/extaction.cpp \
    constraints/tableprimarykeypanel.cpp \
    constraints/constraintpanel.cpp \
    constraints/tableforeignkeypanel.cpp \
    constraints/tableuniquepanel.cpp \
    constraints/tablepkanduniquepanel.cpp \
    constraints/tablecheckpanel.cpp \
    constraints/columncheckpanel.cpp \
    constraints/constraintcheckpanel.cpp \
    constraints/columnforeignkeypanel.cpp \
    constraints/columnprimarykeypanel.cpp \
    constraints/columnuniquepanel.cpp \
    constraints/columnuniqueandnotnullpanel.cpp \
    constraints/columnnotnullpanel.cpp \
    constraints/columncollatepanel.cpp \
    constraints/columndefaultpanel.cpp \
    dialogs/constraintdialog.cpp \
    dialogs/newconstraintdialog.cpp \
    windows/constrainttabmodel.cpp \
    dialogs/messagelistdialog.cpp \
    windows/viewwindow.cpp \
    dialogs/configdialog.cpp \
    uiconfig.cpp \
    dialogs/indexdialog.cpp \
    sqlview.cpp \
    dialogs/triggerdialog.cpp \
    dialogs/triggercolumnsdialog.cpp \
    dbobjectdialogs.cpp \
    common/fontedit.cpp \
    configwidgets/styleconfigwidget.cpp \
    common/colorbutton.cpp \
    formmanager.cpp \
    configwidgets/combodatawidget.cpp \
    dialogs/ddlpreviewdialog.cpp \
    windows/ddlhistorywindow.cpp \
    common/userinputfilter.cpp \
    datagrid/sqlqueryrownummodel.cpp \
    windows/functionseditor.cpp \
    windows/functionseditormodel.cpp \
    sqlitesyntaxhighlighter.cpp

HEADERS  += mainwindow.h \
    iconmanager.h \
    dbtree/dbtreemodel.h \
    dbtree/dbtreeitem.h \
    dbtree/dbtree.h \
    dbtree/dbtreeview.h \
    actionentry.h \
    dialogs/dbdialog.h \
    uiutils.h \
    dbtree/dbtreeitemdelegate.h \
    dbtree/dbtreeitemfactory.h \
    sqleditor.h \
    datagrid/sqlquerymodel.h \
    dblistmodel.h \
    mdiarea.h \
    statusfield.h \
    common/tablewidget.h \
    datagrid/sqlqueryitem.h \
    datagrid/sqlqueryview.h \
    datagrid/sqlquerymodelcolumn.h \
    datagrid/sqlqueryitemdelegate.h \
    common/extlineedit.h \
    common/intvalidator.h \
    common/widgetcover.h \
    mdiwindow.h \
    mdichild.h \
    taskbar.h \
    multieditor/multieditor.h \
    multieditor/multieditorwidgetplugin.h \
    multieditor/multieditorwidget.h \
    widgetresizer.h \
    multieditor/multieditortext.h \
    multieditor/multieditornumeric.h \
    common/numericspinbox.h \
    multieditor/multieditordatetime.h \
    multieditor/multieditordate.h \
    multieditor/multieditortime.h \
    formview.h \
    multieditor/multieditorbool.h \
    multieditor/multieditorhex.h \
    qhexedit2/xbytearray.h \
    qhexedit2/qhexedit_p.h \
    qhexedit2/qhexedit.h \
    qhexedit2/commands.h \
    multieditor/multieditordialog.h \
    completer/completerwindow.h \
    completer/completermodel.h \
    completer/completeritemdelegate.h \
    completer/completerview.h \
    dialogs/searchtextdialog.h \
    searchtextlocator.h \
    windows/tablewindow.h \
    windows/editorwindow.h \
    datagrid/sqltablemodel.h \
    dataview.h \
    windows/tablestructuremodel.h \
    windows/tableconstraintsmodel.h \
    dialogs/columndialog.h \
    dialogs/columndialogconstraintsmodel.h \
    common/extaction.h \
    common/extactioncontainer.h \
    constraints/tableprimarykeypanel.h \
    constraints/constraintpanel.h \
    constraints/tableforeignkeypanel.h \
    constraints/tableuniquepanel.h \
    constraints/tablepkanduniquepanel.h \
    constraints/tablecheckpanel.h \
    constraints/columncheckpanel.h \
    constraints/constraintcheckpanel.h \
    constraints/columnforeignkeypanel.h \
    constraints/columnprimarykeypanel.h \
    constraints/columnuniquepanel.h \
    constraints/columnuniqueandnotnullpanel.h \
    constraints/columnnotnullpanel.h \
    constraints/columncollatepanel.h \
    constraints/columndefaultpanel.h \
    dialogs/constraintdialog.h \
    dialogs/newconstraintdialog.h \
    windows/constrainttabmodel.h \
    dialogs/messagelistdialog.h \
    windows/viewwindow.h \
    dialogs/configdialog.h \
    uiconfig.h \
    dialogs/indexdialog.h \
    sqlview.h \
    dialogs/triggerdialog.h \
    dialogs/triggercolumnsdialog.h \
    dbobjectdialogs.h \
    common/fontedit.h \
    customconfigwidgetplugin.h \
    configwidgets/styleconfigwidget.h \
    common/colorbutton.h \
    formmanager.h \
    configwidgets/combodatawidget.h \
    dialogs/ddlpreviewdialog.h \
    windows/ddlhistorywindow.h \
    common/userinputfilter.h \
    datagrid/sqlqueryrownummodel.h \
    windows/functionseditor.h \
    windows/functionseditormodel.h \
    syntaxhighlighterplugin.h \
    sqlitesyntaxhighlighter.h

FORMS    += mainwindow.ui \
    dbtree/dbtree.ui \
    dialogs/dbdialog.ui \
    statusfield.ui \
    completer/completerwindow.ui \
    dialogs/searchtextdialog.ui \
    windows/tablewindow.ui \
    windows/editorwindow.ui \
    dialogs/columndialog.ui \
    constraints/tableforeignkeypanel.ui \
    constraints/tablepkanduniquepanel.ui \
    constraints/constraintcheckpanel.ui \
    constraints/columnforeignkeypanel.ui \
    constraints/columnprimarykeypanel.ui \
    constraints/columnuniqueandnotnullpanel.ui \
    constraints/columncollatepanel.ui \
    constraints/columndefaultpanel.ui \
    dialogs/constraintdialog.ui \
    dialogs/newconstraintdialog.ui \
    dialogs/messagelistdialog.ui \
    windows/viewwindow.ui \
    dialogs/configdialog.ui \
    dialogs/indexdialog.ui \
    dialogs/triggerdialog.ui \
    dialogs/triggercolumnsdialog.ui \
    common/fontedit.ui \
    forms/sqlformatterplugin.ui \
    dialogs/ddlpreviewdialog.ui \
    windows/ddlhistorywindow.ui \
    windows/functionseditor.ui

LIBS += -lcoreSQLiteStudio

unix: {
    target.path = /usr/bin
    INSTALLS += target
}

copy_dir(img, $$DESTDIR/img)