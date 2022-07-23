#include <asmio.h>

int main() {

	int arrayA[10];
	int arrayB[10];
	int arrayC[10];

	register int n;

	register int a;
	register int b;
	register int c;

	n = read_int();

	for(int i=0; i < n; i++) {
		a = read_int();
		arrayA[i] = a;
	}

	for(int i=0; i < n; i++) {
		b = read_int();
		arrayB[i] = b;
	}

	for(int i=0; i < n; i++) {
		c = arrayA[i] + arrayB[i];
		arrayC[i] = c;
	}

	for(int i=0; i < n; i++) {
		print_int(arrayC[i]);
		print_nl();
	}

}
