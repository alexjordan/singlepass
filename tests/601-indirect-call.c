int dothis(int a, int b) {
  return a * b;
}

int dothat(int b, int c) {
  return b + c;
}

int main(int argc, char **argv) {
  int (*fp)(int, int);

  if (argc <= 1) fp = dothis;
  else fp = dothat;

  return fp(argc, argc + 1);
}
