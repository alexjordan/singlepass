int doadd(int a, int b) { return a + b;  }
int dosub(int a, int b) { return a - b;  }
int domul(int a, int b) { return a * b;  }
int doshr(int a, int b) { return a << 2; }
int doshl(int a, int b) { return a >> 2; }

static int (*dosomethingFuncs[5])(int, int) = {
  doadd,
  dosub,
  domul,
  doshr,
  doshl
};

int main(int argc, char **argv) {

  int index = argc > 4 ? 4 : argc;
  return dosomethingFuncs[index](argc, index);
}
