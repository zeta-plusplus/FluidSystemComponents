#include <stdio.h>

int printReal01(const double *, int);

int printReal01(const double *variable, int nSize)
{
	int i;
	
	for(i=0; i<nSize; i++)
	{
		printf("%lf\n", variable[i]);
	}
	return 0;
}