unsigned shifta(unsigned a, unsigned b) {
	return a >> b;
}

unsigned shiftb(unsigned a, unsigned b) {
	return b >> a;
}
int main(int argc, char **argv) {
  unsigned x = -2;
  return (shifta(x, 3) == shiftb(3, x));
}
