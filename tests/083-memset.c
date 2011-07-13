#include <string.h>

int main(int argc, char **argv) {
  int x[4] = { 7, 42, 4, 5 };
  memset(&x, 0, sizeof(int) * 4);
  return x[0] + x[1] + x[2] + x[3];
}
