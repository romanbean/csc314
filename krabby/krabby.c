#include <asmio.h>


int main() {

	//register char i; // user input purpose

	// y/n == yes/no
	const int LETTUCE = 32;
	const int ONION = 16;
	const int TOMATO = 8;
	const int PICKLE = 4;
	const int MUSTARD = 2;
	const int KETCHUP = 1;

	char i;
	int total;

		print_string("Lettuce? ");
		i = read_char();
		if(i == 'y')
			total+=LETTUCE;
		print_string("Onions? ");
		i = read_char();
		if(i == 'y')
			total+=ONION;
		print_string("Tomatoes? ");
		i = read_char();
		if(i == 'y')
			total+=TOMATO;

		print_string("Krabby Patty Code is: ");
		print_int(total);



}
