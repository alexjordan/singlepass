int x = 42;

int foo(double bar, int in) {
	return x + in;
}

int main(int argc, char **argv) {
	double y;
	return foo(y, 1);
}
