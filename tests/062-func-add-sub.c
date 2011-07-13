#include <stdlib.h>

int main(int argc, char **argv) {
  int v1 = rand();
  int v2 = rand();
  int v3 = v1 * v2;
  int v4 = rand();
  int v5 = rand();
  int v6 = v4 + v5;
  int v7 = rand();
  int v8 = v1 + v7;
  int v9 = v6 * v8;
  int v10 = v3 + v9;
  return v10;
}
