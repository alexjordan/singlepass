#include <stdlib.h>

int main(int argc, char **argv) {
  int x = rand();
  if (x < 10) {
    return rand();
  }
  else {
    return 0;
  }
}
