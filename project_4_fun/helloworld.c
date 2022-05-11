/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "PmodKYPD.h"
#include "xparameters.h"
#include <string.h>

PmodKYPD kypd;
#define DEFAULT_KEYTABLE "0FED789s456p123r"
//char DEFAULT_KEYTABLE[] = "0FED789C456B123A";

int validChoice(char c) {
	return c == 'r' || c == 'p' || c == 's';
}

int main()
{
    // set up stuff
	init_platform();
    KYPD_begin(&kypd, XPAR_PMODKYPD_0_AXI_LITE_GPIO_BASEADDR);
    KYPD_loadKeyTable(&kypd, (u8*)DEFAULT_KEYTABLE);

    Xil_Out32(kypd.GPIO_addr, 0xF);


    while(1) {
    	// sample from terminal
    	print("TERMINAL: (R)ock, (P)aper, or (S)cissors\n\r");
    	char terminalChoice = '\0';
    	while(!validChoice(terminalChoice)) {
    		terminalChoice = tolower(getchar());
			getchar();
			if(!validChoice(terminalChoice)) {
				print("Try again, enter R, P, or S\n\r");
			}
    	}


    	// sample from keypad
    	print("KEYPAD: (A)Rock, (B)Paper, or (C)scissors\n\r");
    	XStatus status = KYPD_NO_KEY;
    	u8 kypdChoice = 0;
        while(status != KYPD_SINGLE_KEY && !validChoice(kypdChoice)) {
        	u16 keyState = KYPD_getKeyStates(&kypd);
        	// Determine which single key is pressed, if any
        	status = KYPD_getKeyPressed(&kypd, keyState, &kypdChoice);
        }
        print("\n");

        // pick the winner
        if(terminalChoice == kypdChoice) {
        	xil_printf("TIE (both chose %c)\n\r", terminalChoice);
        	continue;
        }
        else {
        	xil_printf("TERM: %c\t KYPD %c\t", terminalChoice, kypdChoice);
        }

        if(terminalChoice == 'r') {
        	if(kypdChoice == 'p') {
        		print("KEYPAD W\r\n");
        	}
        	else {
        		print("TERMINAL W\r\n");
        	}

        }
        else if(terminalChoice == 'p') {
        	if(kypdChoice == 'r') {
				print("TERMINAL W\r\n");
			}
			else {
				print("KEYPAD W\r\n");
			}
        }
        else {
        	if(kypdChoice == 'r') {
				print("KEYPAD W W\r\n");
			}
			else if(kypdChoice == 'p') {
				print("TERMINAL W\r\n");
			}
        }
        print("HIT ANY KEY TO CONTINUE\r\n");
        getchar();
    }
    print("Hello World\n\r");

    cleanup_platform();
    return 0;
}
