#include <asmio.h>

int main() {

	register int a, b;

	a = read_int();

	b = a * 7;

	print_int(b);

}
