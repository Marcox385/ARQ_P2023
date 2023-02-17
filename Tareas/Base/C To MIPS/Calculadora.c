/*
 * Copyright (c) 2017, NXP Semiconductor, Inc.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * o Redistributions of source code must retain the above copyright notice, this list
 *   of conditions and the following disclaimer.
 *
 * o Redistributions in binary form must reproduce the above copyright notice, this
 *   list of conditions and the following disclaimer in the documentation and/or
 *   other materials provided with the distribution.
 *
 * o Neither the name of NXP Semiconductor, Inc. nor the names of its
 *   contributors may be used to endorse or promote products derived from this
 *   software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
 
/**
 * @file    Calculadora.c
 * @brief   Application entry point.
 */
#include <stdio.h>


int suma(int a, int b);
int resta(int a, int b);
int multiplica(int a, int b);
int andBitwise(int a, int b);

int main(void) {

	int selector = 0; //registro s0
	int a = 5;  // registro s1
	int b = 3;  // registro s2
	int c = 0; // registro s3


       switch (selector)
    	{
    		case 1:
    			c = suma(a,b);
    			break;
    		case 2:
    			c = resta(a,b);
    			break;
    		case 3:
    			c = multiplica(a, b);
    			break;
    		default:
    			c = andBitwise(a,b);
    			break;
    	}

}



int suma(int a, int b)
{
	int c = 0;
	c = a + b;
	return c;
}
int resta(int a, int b)
{
	int c = 0;
	c = a - b;
	return c;
}
int multiplica(int a, int b)
{
	int c = 0;
	c = a * b;
	return c;
}
int andBitwise(int a, int b)
{
	int c = 0;
	c = a & b;
	return c;
}
