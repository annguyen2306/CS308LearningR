#Initiating an integer and a float, assigning them to variables
x <- 5
y <- 3.14
z <- 3

# Testing arithmetic functions upon these integer, adding an integer to an integer
sum <- (x+z)
print(paste("Output Type for Integer + Integer:",sum,"-",typeof(sum)))

# Testing arithmetic functions upon these integer, adding an integer to a float
sum <- (x + y)
print(paste("Output Type for Float + Integer:",sum,"-", typeof(sum)))

division <- (x / y)
print(paste("Output Type for Integer / Integer:",division,"-",typeof(division)))

#Printing out the outcome will prove that R view both floats and integers input
#as double, rather than dividing it into two seperate categories.
#Divisions would also not be rounded up.

#If users want to call out an integer object (as a datatype different than 
#double), they must explicitly define it.

x_int <- as.integer(1)

#Test adding double to integer to double
sum_int_dou <- (x + x_int)
print(paste("Output Type for Double/ Integer:", sum_int_dou, "-", typeof(sum_int_dou)))
#Still, the output will be converted to a double

#Initiating strings
string_1 <- "Hello World!"
string_2 <- "My name is R"

#Strings can be added using function paste()
string_sum <- paste(string_1, string_2)
print(paste(" Output type for String + String:",string_sum,"-", typeof(string_sum)))
string_sum <- paste(string_1, x)
print(paste(" Output type for String + Double:",string_sum,"-", typeof(string_sum)))

#Printing out the type of the variables, we would know that R does not distinct
#strings from R, they will view these as characters only.
#Besides, R can also add characters to a double. The results would be strings.

#Initiating booleans that compare objects of different datatypes
boo_doub_doub <- (1 == 2)
boo_int_doub <- (x_int == 1) #returning true
boo_int_string <- (1 == "one")
boo_diff <- (1 != 2)
boo_and <- (1 == 2 & 2 == 2)
boo_or <- (1 == 2 | 2 == 2)

#Test printing booleans
print(paste("Compare Integers with Integers:", boo_doub_doub))

#Initiating lists that contain one to many different datatypes
list_data_boo <- list(boo_doub_doub, boo_int_doub, boo_int_string, boo_diff, 
                boo_and, boo_or)
list_data_mix <- list(boo_int_doub, string_1, x)

#Test printing out list of data
print("List of mix datatypes:")
print(list_data_mix)

#Drawing out and printing out a member of a list
print(paste("Data in list at index 1:", list_data_boo[1]))

#Initiating a dictionary
dict_data_boo <- c("Double to Double" = boo_doub_doub,
                    "Int to Double" = boo_int_doub,
                    "Int to String" = boo_int_string,
                    "Check difference" = boo_diff,
                    "Multiple conditions" = boo_and,
                    "Or conditions" = boo_or)

#Test printing dictionary and values based on keys
print(dict_data_boo)
print(dict_data_boo["Int to Int"])
