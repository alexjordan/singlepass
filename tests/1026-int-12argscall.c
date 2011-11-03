#include <stdlib.h>

int l;

void hello(int n1, int n2, int n3, int n4,
           int n5, int n6, int n7, int n8,
           int n9, int n10, int n11, int n12)
{
    l = n1 + n10 + n12;
}

int main(int argc, char **argv)
{
    hello(0x11111111,
              0x22222222,
              0x33333333,
              0x44444444,
              0x55555555,
              0x66666666,
              0x77777777,
              0x88888888,
              0x99999999,
              0xAAAAAAAA,
              0xBBBBBBBB,
              0xCCCCCCCC);
    return l;
} 
