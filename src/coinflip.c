#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "../include/coinflip.h"

int inputData(void)
{
    printf("Coin Flip Simulation\n\n");
    printf("Enter amount of flips: ");

    int amount;
    scanf("%i",&amount);
    return amount;
}

void generateRandom(int amount)
{
    int* random = malloc(sizeof(int) * amount);
    int heads = 0;
    
    srand(time(NULL));
    for (int i = 0; i != amount; ++i)
        if (rand() & 1) {
            ++heads;
            *random = 1;
            ++random;
        }
        else {
            *random = 0;
            ++random;
        }
}
