#include <stdio.h>

int printStr01(const char **, int);

int printStr01(const char **str, int nSize)
{
	int i;
	
	for(i=0; i<nSize; i++)
	{
		printf("%s\n", *str);
		str++;
	}
	return 0;
}