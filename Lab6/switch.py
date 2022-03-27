def switch_no_return (x,y):
    x_rep =  x
    x = y
    y = x_rep

a = 1
b = 2

switch_no_return(a,b)

print("Swich function:",a,b)

temp = a
a = b
b = temp

print("Raw convert :",a,b)