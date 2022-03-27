is_true <- function()
{
    print ("True")
    TRUE
}

is_false <- function()
{
    print ("False")
    FALSE
}

# Testing out short circuit for both long and short operators

print("Test And: True - False")
if (is_true() && is_false()) print("Executed true.statement")
print("Test And: False - True")
if (is_false() && is_true()) print("Executed true.statement")

print("Test And (short operator): True - False")
if (is_true() & is_false()) print("Executed true.statement")
print("Test And (short operator): False - True")
if (is_false() & is_true()) print("Executed true.statement")


print("Test Or: True - False")
if (is_true() || is_false()) print("Executed true.statement")
print("Test Or: False - True")
if (is_false() || is_true()) print("Executed true.statement")

print("Test Or (short operator): True - False")
if (is_true() | is_false()) print("Executed true.statement")
print("Test Or (short operator): False - True")
if (is_false() | is_true()) print("Executed true.statement")



