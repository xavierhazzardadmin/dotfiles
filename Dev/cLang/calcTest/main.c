#include <stdio.h>

int main(){
    int num;
    for(int i = 1; i < 4000002; i++){
        num = i * i;
    }
    printf("%d\n", num);
}
