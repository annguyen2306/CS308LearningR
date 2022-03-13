#include <iostream>

using namespace std;

int main()
{
  int a[] = {1,2,3};
  int sizeArray = (sizeof(a)/sizeof(*a)); //Finding the size of the array
  
  int* a0 = a;
  int find = 0;
  int i = 0;
  //Loop within the size of the array
  for (i = 0; i<sizeArray; i++){
    if ( *a0 == 2) {
        find = i;
        break;
    } 
    a0 ++;
  }
  //Print if found
  if (find == 0){
      cout << "Index 2 not found"<< endl;
  } else { cout << "Found 2 at index:"<< find << endl;}
  
  find = 0;
  a0 = a;
  for (i = 0; i<sizeArray; i++){
    if ( *a0 == 5) {
        find = i;
        break;
    } 
    a0 ++;
  }
  if (find == 0){
      cout << "Index 5 not found"<< endl;
  } else { cout << "Found 5 at index:"<< find << endl;}
  
  
  
}
