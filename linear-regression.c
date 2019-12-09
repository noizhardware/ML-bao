#include <stdio.h>
#include <stdint.h>

// now loosely based on https://github.com/SandyDash/LinearRegressionModel/blob/master/LinearRegressionModel.c
// equations from https://www.statisticshowto.datasciencecentral.com/probability-and-statistics/regression-analysis/find-a-linear-regression-equation/
// x = explanatory variable
// y = dependent variable
// y = a + b * x
// a = y-intercept
// b = slope
// a = (SUM(y) * SUM(x * x) - SUM(x) * SUM( x + y)) / (n * SUM(x * x) - SUM(x) * SUM(x))
// b = n .... blah blah, see code below...


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
    float b;
    float a;
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
    
    //b = (SumXY - ((SumX * SumY) / N)) / (SumSquareX);
    //a = (SumY - (b * SumX)) / N;
    
    a = (flat(y)*flatSq(x) - flat(x)*flatProduct(x,y)) / (N*flatSq(x)-flatSq(x)*flatSq(x));
    b = (N*flatProduct(x,y) - flat(x)*flat(y)) / (N*flatSq(x)-flat(x)*flat(x));
    
    printf ("y = %f * x + %f\n", b, a);
    
    #define tRangeLow 0
    #define tRangeHi 101
    
    for(newALC = tRangeLow; newALC < tRangeHi; newALC++){
         Y = (b*newALC + a);
         printf ("With %f ALC >> %f HAP\n", newALC, Y);
     }
    
    return 0;
}