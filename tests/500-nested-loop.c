#include <stdio.h>

int main(int argc, char **argv) {
  int i, j;
  int x = 0;
  int r = 42;

  for (i = 0; i < 8; ++i) {
	  for (j = 0; j < 8; ++j) {
		  if ((r > 0) && (j > i))
			printf("%d,%d,%d\n", i, j, x++);
	  }
  }
  return x;
}
