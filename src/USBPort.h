#ifndef FL_USBPORT_H_
#define FL_USBPORT_H_
#ifdef Windows
// Compiling on Windows
#include <windows.h>
#else
#define WINAPI
#endif
#include "AbstractPort.h"
#include "ftd2xx.h"
#include <QtSerialPort/QSerialPort>
 
class USBPortWin : public AbstractPort
{
Q_OBJECT
	FT_HANDLE ftHandle;
	FT_STATUS ftStatus; 
	bool opened;
public:
	USBPortWin();
    bool open_port (QString);
	bool close_port ();
	int receive_char ();
	bool send_char (unsigned char character);
	int receive_packet (unsigned char *packet);
	int send_packet (unsigned char *packet);
	bool isOpen()
	{
		return opened;
	}
signals:
	void error(int err);
};

#endif
