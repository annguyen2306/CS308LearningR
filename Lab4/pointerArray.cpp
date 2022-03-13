#include <iostream>

using namespace std;

int main()
{
  int a[] = {1,2,3};
  
  /*Create a pointer that point to the first index of a*/
  int* a0 = a;
  
  /*Change the value of the pointer*/
  *a0 = 2;
  a0 ++; //increment pointer
  
  
  cout << "Original value after re-value pointer : " << a[0]  << endl;
  
  
}
