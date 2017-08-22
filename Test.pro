QT += core
QT -= gui

CONFIG += c++11

TARGET = Test
CONFIG += console
CONFIG -= app_bundle

TEMPLATE = app

INCLUDEPATH += /usr/local/Cellar/boost/1.64.0_1/include

SOURCES += \
    #main1.cpp \
    main.cpp

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../usr/local/Cellar/ompl/1.3.0/lib/release/ -lompl.1.3.0
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../usr/local/Cellar/ompl/1.3.0/lib/debug/ -lompl.1.3.0
else:unix: LIBS += -L$$PWD/../../../usr/local/Cellar/ompl/1.3.0/lib/ -lompl.1.3.0

INCLUDEPATH += $$PWD/../../../usr/local/Cellar/ompl/1.3.0/include
DEPENDPATH += $$PWD/../../../usr/local/Cellar/ompl/1.3.0/include

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../usr/local/Cellar/boost/1.64.0_1/lib/release/ -lboost_filesystem
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../usr/local/Cellar/boost/1.64.0_1/lib/debug/ -lboost_filesystem
else:unix: LIBS += -L$$PWD/../../../usr/local/Cellar/boost/1.64.0_1/lib/ -lboost_filesystem

INCLUDEPATH += $$PWD/../../../usr/local/Cellar/boost/1.64.0_1/include
DEPENDPATH += $$PWD/../../../usr/local/Cellar/boost/1.64.0_1/include

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../../../usr/local/Cellar/boost/1.64.0_1/lib/release/libboost_filesystem.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../../../usr/local/Cellar/boost/1.64.0_1/lib/debug/libboost_filesystem.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$PWD/../../../usr/local/Cellar/boost/1.64.0_1/lib/release/boost_filesystem.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$PWD/../../../usr/local/Cellar/boost/1.64.0_1/lib/debug/boost_filesystem.lib
else:unix: PRE_TARGETDEPS += $$PWD/../../../usr/local/Cellar/boost/1.64.0_1/lib/libboost_filesystem.a

QMAKE_LFLAGS += -lboost_system
