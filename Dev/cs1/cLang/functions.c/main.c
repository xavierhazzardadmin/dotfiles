#include <stdio.h>
#include <math.h>

int doubleSquare(int input){
    int doubled = input * 2;
    int squared = pow(doubled, 2);
    return squared;
}

int main(void){
    int output = doubleSquare(20);
    printf("%d\n", output);
}
