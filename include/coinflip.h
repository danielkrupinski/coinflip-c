#ifndef COINFLIP_H
#define COINFLIP_H

struct Data {
    int* heads;
    int headsSize;
    int* tails;
    int tailsSize;
};

int inputData(void);
void generateRandom(int, int*, int, int*, int);

#endif // COINFLIP_H
