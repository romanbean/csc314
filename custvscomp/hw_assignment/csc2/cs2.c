
#include <asmio.h>

int main() {

	register int a;

	a = read_int();

	if (a == 13) {
		print_int(37);
	} else if (a == 100) {
		print_int(200);
	} else {
		print_int(-1);
	}
		print_nl();

}
