#include <asmio.h>

int main() {

	int array[10] = {};

	int i,j,k;

	register int n = 10;
	register int b;
	register int c;

/*
	for(int i=0; i < n; i++) {
		b = read_int();
		array[i] = b;
	}
*/


	i=0;
	inputLoop:
		if (i >= n) goto endInputLoop;
			b = read_int();
			array[i] = b;
			i++;
			goto inputLoop;
	endInputLoop:


	i=0;
	sortLoop:
		if (i >= n) goto endSortLoop;
		j = i + 1;
		JLoop:
			if(j >= n) goto endJ;
				if(array[i] < array[j]) goto endIf;
					c = array[i];
					array[i] = array[j];
					array[j] = c;
				endIf:
		++j;
		goto JLoop;
	endJ:
		++i;
	goto sortLoop;
endSortLoop:

/*
	for(int i=0; i < n; i++) {

		for(int j=i+1; j < n; ++j) {
			if(array[i] > array[j])
			{
				c = array[i];
				array[i] = array[j];
				array[j] = c;
			}
		}
	}
*/

/*
	for(int i=0; i < n; ++i) {
		print_int(array[i]);
		print_nl();
	}
*/

	i=0;
	printLoop:
	if(i >= n) goto endPrintLoop;
		print_int(array[i]);
		print_nl();
		++i;
		goto printLoop;
	endPrintLoop:
		print_nl();

}
