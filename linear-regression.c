#include <stdio.h>
#include <stdint.h>

// from https://github.com/SandyDash/LinearRegressionModel/blob/master/LinearRegressionModel.c

#define N 244

//#define DEBUG

float flat(float x[N]){
    float out;
    int i;
    out = 0;
    for (i=0; i<N; i++) {
        out += x[i];
        #ifdef DEBUG
        //printf("c%d : %f\n", i, x[i]);
        #endif // DEBUG
    }
    return out;
}

float flatSq(float x[N]){
    float out;
    uint16_t i;
    out = 0;
    for (i=0; i<N; i++) {
        out += x[i] * x[i];
        #ifdef DEBUG
        //printf("c%d : %f\n", i, x[i] * x[i]);
        #endif // DEBUG
    }
    return out;
}

float flatProduct (float x[N],float y[N]){
    float out;
    uint16_t i;
    out = 0;
    for (i=0; i<N; i++) {
        out += x[i] * y[i];
        #ifdef DEBUG
        //printf("c%d : %f\n", i, x[i] * y[i]);
        #endif // DEBUG
    }
    return out;
}

int main()
{
    float b1;
    float b0;
    float newALC;
    float SumXY;
    float SumX;
    float SumY;
    float SumSquareX;
    float x[N] = {1,2,3,4,5,6,7,8,9,10};
    float y[N] = {2,4,6,8,10,12,14,16,18,20};
    float Y;
    
    SumXY = flatProduct(x,y);
    SumX = flat (x);
    SumY = flat (y);
    SumSquareX = flatSq(x);
    
    b1 = (SumXY - ((SumX * SumY) / N)) / (SumSquareX);
    b0 = (SumY - (b1 * SumX)) / N;
    
    printf ("y = %f * x + %f\n", b1, b0);
    
    #define tRangeLow 0
    #define tRangeHi 21
    
    for(newALC = tRangeLow; newALC < tRangeHi; newALC++){
         Y = (b1*newALC + b0);
         printf ("With %f ALC >> %f HAP\n", newALC, Y);
     }
    
    return 0;
}