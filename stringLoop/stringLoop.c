#include <asmio.h>

int main() {

	register char messages[6] = {'H', 'e', 'l', 'l', 'o', '\0'};
	register char c;
	for(int i = 0; i < 6; i++) {
		c= messages[i];
		print_char(c);
	}
}
