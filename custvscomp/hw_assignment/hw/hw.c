#include <asmio.h>

int main() {

	register int a;
	register int b;
	register int x;

	a = read_int();
	b = read_int();

	x = (17+a) * ((b * 32) / a) + 123 - b;

	print_int(x);
	print_nl();
}
