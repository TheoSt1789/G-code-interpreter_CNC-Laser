// Configuracion del PIC
#include <18F4550.h>
#fuses EC_IO, NOWDT, NOLVP, NOMCLR, PLL1, CPUDIV1
#use delay(clock = 20M)
#use rs232(BAUD = 9600, XMIT = PIN_C6, RCV = PIN_C7, BITS = 8, PARITY = N)

// Librerias usadas
#include <stdlib.h>
#include <input.c>
#define LCD_DATA_PORT getenv("SFR:PORTB")
#include <LCD.c>

// Configuracion de puertos
#use standard_io(A)
#use standard_io(B)
#use standard_io(C)
#use standard_io(D)
#use standard_io(E)

unsigned int16 uPosX = 0;       // Coordenadas en X
unsigned int16 uPosY = 0;       // Coordenadas en Y
unsigned int16 uPosXAnterior = 0;
unsigned int16 uPosYAnterior = 0;

unsigned int8 uFeedrate = 0;    // Feedrate
unsigned int8 uParameter;
unsigned int8 uPointer;
unsigned int8 uSteps = 170;      // Con 1/16 microsteps

char cPrefix;                   // Prefijo del codigo (ej.: G - M)
char sCommand[100];             // String completo del comando
char sMode[2];                  // Numero seguido al prefije (ej.: G02 - M01)

#define MOTOR_A_STEP PIN_D4
#define MOTOR_A_DIR PIN_D5
#define MOTOR_B_STEP PIN_D6
#define MOTOR_B_DIR PIN_D7

// dir = 1 clockwise
// dir = 0 counterclockwise

void move(void)                 // Funcion para unicamente mover el laser
{
    signed int16 iDiferenciaX = uPosX - uPosXAnterior;
    signed int16 iDiferenciaY = uPosY - uPosYAnterior;
    
    lcd_putc("\f");
    printf(lcd_putc, "X=%ld\nY=%ld", iDiferenciaX, iDiferenciaY);
}

void line(void)                 // Funcion para mover el laser mientras esta prendido
{}

void processCommand(void)       // Funcion para parsear el comando completo
{
    unsigned int8 uIndexX = 0;  // Posicion del comando donde se encuentra la coordenada en X
    unsigned int8 uIndexY = 0;  // Posicion del comando donde se encuentra la coordenada en Y
    unsigned int8 uIndexF = 0;  // Posicion del comando donde se encuentra el valor del feedrate
    char sCoordsX[4];
    char sCoordsY[4];
    char sFeedrate[4];
    
    lcd_putc("\f");
    cPrefix = sCommand[0];
    for(int i = 0; i < 2; i++)
    {
        sMode[i] = sCommand[++i];
        i--;
    }
    uParameter = atoi(sMode);
    for(i = 0; i < 100; i++)
    {
        if(sCommand[i] == 'X') uIndexX = i + 1;
        if(sCommand[i] == 'Y')
        {
            uIndexY = i + 1;
            if(uParameter == 0) break;
        }
        if(uParameter == 1)
        {
            if(sCommand[i] == 'F')
            {
                uIndexF = i + 1;
                break;
            }
        }
    }
    if(cPrefix == 'G')
    {
        switch(uParameter)
        {
            case 1:
                uPointer = 0;
                for(i = uIndexF; i < 100; i++)
                {
                    sFeedrate[uPointer] = sCommand[i];
                    uPointer++;
                }
                uFeedrate = atoi(sFeedrate);
                lcd_gotoxy(12, 1);
                printf(lcd_putc, "F=%u", uFeedrate);
            case 0:
                // line
                uPointer = 0;
                for(i = uIndexX; i < uIndexY - 2; i++)
                {
                    sCoordsX[uPointer] = sCommand[i];
                    uPointer++;
                }
                uPointer = 0;
                for(i = uIndexY; i < 100; i++)
                {
                    sCoordsY[uPointer] = sCommand[i];
                    uPointer++;
                }
                uPosXAnterior = uPosX;
                uPosYAnterior = uPosY;
                uPosX = atoi(sCoordsX);
                uPosY = atoi(sCoordsY);
                move();
                lcd_gotoxy(1, 1);
                printf(lcd_putc, "X=%lu\nY=%lu", uPosX, uPosY);
                break;
            case 20:
                // inches
                lcd_putc("inches();");
                break;
            case 21:
                // millimeter
                lcd_putc("millimeter();");
                break;
            case 28:
                // axes home
                lcd_putc("move(0,0);");
                uPosX = 0;
                uPosY = 0;
                move();
                break;
            case 90:
                // absolute coordinates
                lcd_putc("absolute();");
                break;
            case 91:
                // relative coordinates
                lcd_putc("relative();");
                break;
            case 92:
                // set position
                lcd_putc("move(x,y);");
                uPosX = 0;
                uPosY = 0;
                move();
                break;
        }
    }
    else if(cPrefix == 'M')
    {
        switch(uParameter)
        {
            case 3:
                // laser ON
                lcd_putc("ON();");
                break;
            case 5:
                // laser OFF
                lcd_putc("OFF();");
                break;
        }
    }
}

#int_rda
void serial_isr()
{
    get_string(sCommand, 100);
    processCommand();
    puts(" -> OK \n");
}

void main(void)
{
    lcd_init();
    
    enable_interrupts(GLOBAL);
    enable_interrupts(INT_RDA);
    
    unsigned int8 cont = 5;
    BOOLEAN flag = TRUE;
    
    while(TRUE)
    {
        if (flag)
        {
            output_high(PIN_D6);
            cont --;
            if (cont == 0)
            {
                flag = FALSE;
            }
        }
        else
        {
            output_low(PIN_D6);
            cont ++;
            if (cont == 5)
            {
                flag = TRUE;
            }
        }
        output_high(PIN_D5);
        delay_ms(250);
        output_low(PIN_D5);
        delay_ms(10);
    }
}
