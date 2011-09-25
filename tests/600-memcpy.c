#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char **argv) {

  int sourceVal = argc;
  int destVal;

  int *sourcePtr = &sourceVal;
  int *destPtr = &destVal;

  // try both variants, since this requires two
  // different strategies for llvm-IR lowering

  memcpy((int *)&destVal, (int *)&sourceVal, 1);
  memcpy((int *)destPtr, (int *)sourcePtr, 1);

  return destVal + *destPtr;
}
