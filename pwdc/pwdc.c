#include	<stdio.h>

int	complexity(char *p) {
	int	strength;
	int	length;
	int	upper = 1;
	int lower = 1;
	int	digit = 1;
	int	other = 1;

/*
	for (length=0; p[length]!='\0'; length++) {
		if(p[length] >= 'A' && p[length] <= 'Z') {
			upper++;
		}
		else if(p[length] >= 'a' && p[length] <= 'z') {
			lower++;
		}
		else if(p[length] >= '0' && p[length] <= '9') {
			digit++;
		}
		else {
			other++;
		}
	}
*/
	length=0;
		mainLoop:
			if(p[length] == '\0') goto endMainLoop;
				if(p[length] < 'A') goto endpCapA;
					if(p[length] > 'Z') goto endpCapZ;
						upper++;
				endpCapZ:
			endpCapA:
			if(p[length] < 'a') goto endpLowA;
				if(p[length] > 'z') goto endpLowZ;
						lower++;
				endpLowZ:
			endpLowA:
			if(p[length] < '0') goto endp0;
				if(p[length] > '9') goto endp9;
						digit++;
				endp9:
			endp0:
			if(p[length] != '\0') goto endnot0;
				if(p[length] >= 'A') goto endgeA;
					if
		length++;
		goto mainLoop;
		endMainLoop:

	printf("upper: %d, lower: %d, digit: %d, other: %d, and length: %d\n", upper, lower, digit, other, length);

	strength = (upper * lower * digit * other) + length;
	return strength;
}

int main() {
	printf("Complexity: %d\n", complexity("Password1!") );
}
