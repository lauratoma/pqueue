#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>


#include "pqheap.h"

/* this is the file with the definition of a pqueue element */
#include "basictype.h"


int  main(int argc, char** argv) {

  int n; 
  PQueue* pq; 
  elemType elt;

  if (argc==1)
    n = 10;
  else {
    char* pend; 
    n = strtol(argv[1], &pend, 10); 
  }
  printf("running pq with size=%d\n", n); 
  
  //initialize PQ
  pq = PQ_initialize();
  
  //insert some elements 
  for (int i=0; i<n; i++) {
    elt.dist = 1.0/i; //some random dist 
    point2D p = {i, i+1}; //some random point
    elt.p = p; 
    PQ_insert(pq, elt); 
  }
  PQ_print(pq);
  
  //now delete everything
  
  while (!PQ_isEmpty(pq)) {
    assert(PQ_extractMin(pq, &elt)); 
    // printf("deleteMin: "); printElem(elt); printf("\n");  
  }
  //destroy the pqueue 
  PQ_delete(pq);


  return 1;
}
