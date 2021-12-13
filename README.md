# pqueue

A simple priority queue implemented as a binary heap. 

It  supports insert and deleteMin. 

To use this pqueue you need to modify the elemType in {basicType.h, basicType.c} to contain the data that you need.  By default elemType contains a distance (float) and a point (point2D).  ElemType does not store a field for the priority. The priority of an element is found by calling function getPriority(elemType). You have to implement this function in basicType.c to suit your needs. Right now  getPriority(elemType x) returns x.dist. 



Checkout file pqtest.c to see how to use it. 

To run: 

make 

./pqtest 10 
