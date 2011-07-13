
float x = 42;

float foo(int a, double b, float c) {
  return c;
}

int main(int argc, char **argv) {
  return foo(5, 4., x);
}
