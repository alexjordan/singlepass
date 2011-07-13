
double x = 42;

double foo(int a, double b, float c) {
  return b;
}

int main(int argc, char **argv) {
  return foo(5, x, 4.);
}
