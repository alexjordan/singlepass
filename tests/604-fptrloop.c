#include <stdio.h>
#include <stdlib.h>

#define FUNCS 7

static int foo_func(int x)
{
  return x + 1;
}

int main(int argc, char *argv[])
{
  int i, j, n, seed;
  int iterations;
  static int (* funcPtr[FUNCS])(int) = {
    foo_func,
    foo_func,
    foo_func,
    foo_func,
    foo_func,
    foo_func,
    foo_func
  };

  iterations=2; // XXX start small

  puts("Bit counter algorithm benchmark\n");

  for (i = 0; i < FUNCS; i++) {

    for (j = n = 0, seed = 5; j < iterations; j++, seed += 13)
	 n += funcPtr[i](seed);

  }
  return n;
}
