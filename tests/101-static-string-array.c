#include <stdlib.h>
#include <stdio.h>

int main(int argc, char **argv) {
	int i;
	static char *text[4] = {
		"foo",
		"bar",
		"42",
		"0"
	};

	for (i = 0; i < 4; ++i)
		printf("%s\n", text[i]);


	return atoi(text[2]) + atoi(text[3]);
}
