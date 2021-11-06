TEMPLATE = app
TARGET = gbcflsh 
DEPENDPATH += .
INCLUDEPATH += .
INCLUDEPATH += "$$PWD/src/"
#DESTDIR = build
RESOURCES += qdarkstyle/style.qrc

# Input
HEADERS += src/About.h \
           src/AbstractPort.h \
           src/Console.h \
           src/const.h \
           src/EraseThread.h \
           src/ftd2xx.h \
           src/Gui.h \
           src/Logic.h \
           src/ReadFlashThread.h \
           src/ReadRamThread.h \
           src/Settings.h \
           src/WinTypes.h \
           src/WriteFlashThread.h \
           src/WriteRamThread.h \
           src/about.xpm \
           src/flasher.xpm \
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
TRANSLATIONS += src/gbcflsh_english.ts \
                src/gbcflsh_french.ts \
                src/gbcflsh_german.ts \
                src/gbcflsh_polish.ts
RC_FILE = src/res.rc
win32 {
SOURCES += src/USBPortWin.cpp 
HEADERS += src/USBPortWin.h
LIBS += -lftd2xx
}
unix {
SOURCES += src/USBPort.cpp 
HEADERS += src/USBPort.h
LIBS += -lftd2xx
langpack.extra = lrelease gbcf.pro
langpack.path = /usr/share/gbcf
langpack.files = src/*.qm
exec.path = /usr/bin
exec.files = gbcflsh
config.path = ~/.config/GBCFProject
config.files = GameBoyCartFlasher.conf
INSTALLS += langpack exec config
QT += widgets network serialport
}

DISTFILES += \
    src/lib/ftd2xx.lib \
    src/icon.xpm