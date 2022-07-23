#include <asmio.h>

int main() {

	register int a;
	register int b;
	register char x;
	register int f;
	int i=0;
	f=1;

	a=read_int();
	x=read_char();
	b=read_int();

//	for(i = 0; i < b; i++)
//		f = f * a;

for1:
	if(i >= b) goto endfor;
		f *= a;
		i++;
		goto for1;
endfor:

	print_int(f);

}
