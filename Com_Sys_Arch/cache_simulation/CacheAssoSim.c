/**
 * CacheSim.c
 * This program is designed for class exercise only.
 * It is provided as is. There is no warranty or support of any kind.
 *
 * Krerk Piromsopa, Ph.D.
 * Department of Computer Engineering
 * Chulalongkorn University
 * Bangkok, Thailand.
 *
 * History
 * 2013 - Initial design
 * 2015 - Refactor/Clean code
 **/
#include <math.h>
#include <stdio.h>
#include <string.h>
// why need .h dude
int INDEXLEN, TAGLEN;
#define CACHE_SIZE 1024 * 1024  // size of cache
#define WAY 4                   // cache associative
#define ALGO 0                  // 0 == LRU, 1 == RR

#define INDEX_SIZE CACHE_SIZE / (BLOCK_SIZE * WAY)  // number of set = cache size / (block_size * WAY)
#define BLOCK_SIZE 4                                // size of 1 block
// #define TAGLEN 14                                   // the tag use to identify the real address in cache
// #define INDEXLEN 16                                 // just called this set
#define OFFSETLEN 2  // the size of block
typedef unsigned char Byte;
typedef unsigned char bool;
typedef struct Cache {
    bool valid;
    bool dirty;
    unsigned long tag;
    Byte data[BLOCK_SIZE];
};
// data format = tag + set + word
// this is bad the assignment doesn't specify the block size
// well I will just go with 4 bytes
long MISS;
long HIT;
struct Cache cache[INDEX_SIZE][WAY];  // modify by add [WAY]
int cache_life[INDEX_SIZE][WAY];      // keep the last access time + use in LRU
int cache_rotate[INDEX_SIZE];         // tell which set to rotate + use in RR
int count = 0;                        // access time + use in LRU

int init() {
    INDEXLEN = log2(INDEX_SIZE);
    TAGLEN = 32 - INDEXLEN - OFFSETLEN;
    MISS = 0;
    HIT = 0;
    int i, j;
    for (i = 0; i < INDEX_SIZE; i++) {
        for (j = 0; j < WAY; j++) {
            cache[i][j].valid = 0;
            cache[i][j].tag = 0;
            cache[i][j].dirty = 0;
            cache_life[i][j] = 0;
        }
        cache_rotate[i] = 0;
    }
}
int calAddr(unsigned long addr, unsigned long *tag, unsigned long *idx, unsigned long *offset) {
    unsigned long tmp;
    int i;
    *tag = addr >> (OFFSETLEN + INDEXLEN);
    tmp = 0;
    for (i = 0; i < INDEXLEN; i++) {
        tmp <<= 1;
        tmp |= 0x01;
    }
    *idx = addr >> OFFSETLEN & tmp;
    tmp = 0;
    for (i = 0; i < OFFSETLEN; i++) {
        tmp <<= 1;
        tmp |= 0x01;
    }
    *offset = addr & tmp;
}
int access(unsigned long addr) {
    unsigned long offset;
    unsigned long tag;
    unsigned long idx;
    int i, j;
    int valid = 0;
    int mi, mc;
    calAddr(addr, &tag, &idx, &offset);
    for (i = 0; i < WAY; i++) {
        if (cache[idx][i].tag == tag && cache[idx][i].valid) {
            HIT++;
            valid = 1;
            cache_life[idx][i] = count;
            break;
        }
    }
    if (valid == 0) {
        MISS++;
        if (ALGO == 0) {  // LRU
            mc = 3000000;
            for (i = 0; i < WAY; i++) {
                if (cache_life[idx][i] < mc) {
                    mc = cache_life[idx][i];
                    mi = i;
                }
            }
            cache[idx][mi].valid = 1;
            cache[idx][mi].tag = tag;
            cache_life[idx][mi] = count;
        } else {  // RR
            cache[idx][cache_rotate[idx]].valid = 1;
            cache[idx][cache_rotate[idx]].tag = tag;
            cache_rotate[idx] = (cache_rotate[idx] + 1) % WAY;
        }
    }
}
int main(int argc, char *argv[]) {
    init();
    printf("CacheSim v.2015\n");
    printf("This program is designed for class exercise only.\n");
    printf("By Krerk Piromsopa, Ph.D.\n");
    FILE *input;
    char buff[1025];
    unsigned long myaddr;
    if (argc < 2) {
        fprintf(stderr, "Usage:\n\t%s address_file\n", argv[0]);
        exit(-1);
    }
    input = fopen(argv[1], "r");
    // read file
    while (fgets(&buff[0], 1024, input)) {
        count += 1;
        sscanf(buff, "0x%x", &myaddr);
        access(myaddr);
    }
    if (ALGO == 0) {
        printf("Doing LRU\n");
    } else {
        printf("Doing RR\n");
    }
    printf("HIT:%7d MISS: %7d\n %.4lf", HIT, MISS, (double)HIT / (HIT + MISS));
}
