#ifndef COINFLIP_H
#define COINFLIP_H

struct Data {
    int amount;
    int heads[amount];
    int tails[amount];
};

int inputData(void);
void generateRandom(int, int*, int, int*, int);

#endif // COINFLIP_H
