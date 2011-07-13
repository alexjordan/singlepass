#include <stdlib.h>

int main(int argc, char **argv) {
  int x;
label:
  x = rand();
  if (x > 250) {
    goto label;
  }
  return x + 5;
}
