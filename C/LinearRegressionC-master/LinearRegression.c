// from https://github.com/ShreyasAiyar/LinearRegressionC
// Super Simple implementation of Linear Regression In C using Batch Gradient Descent
// Parameters : X, Y, b1, B
// Learning Rate : [0.01..0.000001] - [100..1M] ITER
// Loss Function : Squared (MSE)

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

//#define ITER 1000000

float* regression(int *, int *, float, int, float *, float *);
float batch_gradient_descent(int *, int *, int, float, float*, float*);
float predict(int, float*, float *);

int main(int argc, char *argv[]){


	//Input Data
	int x[10] = {1,2,3,4,5,6,7,8,9,10};
	int y[10] = {6,8,8,9,10,11,12,13,14,15};

	//Parameters
     int ITER = 1000000;
	float learning_rate = 0.000001;
	

	//Initialize Parameters
	srand(time(NULL));
	float b1 = rand() % (1 - 0 + 1) + 0;
	float b0= 0;

	printf("Inital Value Of b1 %f \n", b1);
	printf("Initial Value Of b0 %f \n", b0) ;

	float *cost = regression(x, y, learning_rate, ITER, &b1, &b0) ;

	printf("Final Value Of b1 %f \n", b1);
	printf("Final Value Of b0 %f \n \n", b0) ;

	

	printf("Cost Values \n");
	for(int i=0; i<ITER; i++){
		printf("Cost %d %f \n",i,cost[i]);
	}
     
     printf("Predicted Value For 10 is %f \n",predict(10,&b1,&b0) );


	exit(0);

}


float* regression(int *x, int *y, float learning_rate, int ITER, float *b1, float *b0) {

	float *cost = (float*) malloc(sizeof(float)*ITER);
	int n = 10;

	for(int i=0; i<ITER; i++){
		cost[i] = batch_gradient_descent(x, y, n, learning_rate, b1, b0) ;
	}

	return cost;
}


float batch_gradient_descent(int *x, int *y, int n, float learning_rate, float *b1, float *b0){

	float db0 = 0.0;
	float db1 = 0.0;
	float cost = 0.0;

	for(int i=0; i<n; i++){

		cost += pow(((*b1 * x[i] + *b0)  - y[i]),2);
		db0+= (*b1 * x[i] + *b0)  - y[i];
		db1 += ((*b1 * x[i] + *b0)  - y[i])*x[i];
	}

	cost /= n;
	*b1 = *b1 - learning_rate*(db1)/n;
	*b0= *b0- learning_rate*(db0) /n;

	return cost;
}


float predict(int x, float *b1, float *b0) {
	return *b1 * x + *b0;
}




