// want to trigger DAG folding:
// fold (or (shl x, C1), (srl x, C2)) -> (rotl x, C1)
//
#define shifta(a, b) \
	(a << b)

#define shiftb(a, b) \
	(a >> b)

int main(int argc, char **argv) {
	unsigned x = argc + 4;
	return (shifta(x, 20) | shiftb(x, 12)) + 7;
}
