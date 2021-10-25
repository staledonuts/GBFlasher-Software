TEMPLATE = app
TARGET = gbcflsh
DEPENDPATH += .
INCLUDEPATH += .

QT += network widgets serialport

QMAKE_LFLAGS += -static

RESOURCES += qdarkstyle/style.qrc

# Input
HEADERS += src/About.h \
           src/AbstractPort.h \
           src/Console.h \
           src/USBPortWin.h \
           src/const.h \
           src/EraseThread.h \
           src/Gui.h \
           src/Logic.h \
           src/ReadFlashThread.h \
           src/ReadRamThread.h \
           src/Settings.h \
           src/WriteFlashThread.h \
           src/WriteRamThread.h \
           src/WinTypes.h \
           src/about.xpm \
           src/ftd2xx.h \
           src/icon.xpm
SOURCES += src/About.cpp \
           src/EraseThread.cpp \
           src/gbcflsh.cpp \
           src/Gui.cpp \
           src/Logic.cpp \
           src/ReadFlashThread.cpp \
           src/ReadRamThread.cpp \
           src/Settings.cpp \
           src/WriteFlashThread.cpp \
           src/WriteRamThread.cpp
RC_FILE = src/res.rc

unix
{
    SOURCES +=
    HEADERS +=
    LIBS += -lftd2xx -Lsrc/lib
    exec.path = /usr/bin
    exec.files = gbcflsh
    INSTALLS += exec config
}

win32
{
    SOURCES += \
           src/USBPortWin.cpp
    HEADERS +=
    LIBS += -L"$$PWD/src/lib" -lftd2xx
    DISTFILES += \
        src/lib/ftd2xx.lib
}

DISTFILES += \
    src/icon.xpm
