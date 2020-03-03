#include<stdio.h>

#define MAX 4

int main() {
	int i, x;
	WRITE("\n");
	READ("%d", &x);
	for(i = 0; i < MAX; i++) {
		WRITE("Hello World!\n");
	}
	return 0;
}
