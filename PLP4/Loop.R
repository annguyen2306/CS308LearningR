# Test out for-loop

# For-loop constrained by number:

print("Test for-loop numb constraint")

for (val in 1: 3)
{
    print(val)
}

print("Test for-loop set constraint")
numSet <- c(1,2,3)
for (val in numSet)
{
    print(val)
}

# While-loop test:

print("Test while-loop ")
val = 0
while (val<=3){
    print(val)
    val = val + 1
}

# Repeat-loop test

val = 6
print("Test repeat-loop ")
repeat{
    val = val - 1

    print(val)

    if (val<=3){

        break
    }
}