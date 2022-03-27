x <- 1
y <- 1
z <- 3

# Comparing the case between If-statement with and without bracket.
# Just applied for the case where there is one command

if (x == y) print("Test If-statement: Two components are equal.")

if (x == y) {print("Test If-statement (bracket): Two components are equal")}


# Test Else case 

if (x != y) {print("Two components are inequal")} else {
    print("Test Else condition: Success")}

# Test Multiple condition case
if (x == y && x != z) {print("Test multiple condition: success")} else{
    print("Failed")
}

# Test else if

if (x == z) {
    print("Failed")
} else if (x == y) {print("Else if check: Success")}


# Test ifelse

ifelse(x == y && x != z, "Condition True ifelse: Success", "Fail")
ifelse(x == y && x == z, "Fail", "Condition False ifelse: Success")

# Test switch - Found case and End of List case (With Stop)

switch("Hinata", "Hinata" = print("Player 10"), "Bakugo" = print("Player 4"),
stop("Volley ball player name is not in list"))

switch("Bokuto", "Hinata" = print("Player 10"), "Bakugo" = print("Player 4"),
stop("Volley ball player name is not in list"))
