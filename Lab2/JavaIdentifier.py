#https://www.w3schools.com/python/python_regex.asp

import re

def main():

    pattern = "^[a-z][a-zA-Z0-9_]+" 
    #PATTERN
    #Follow Java variable convention with non-capitalized first letter and no number
    
    testString = input("enter string to test if valid variable: ")
    
    setString = re.split('[ ,]', testString)
    #Split string to test on each smaller string
    
    newString =''
    
    for futon in setString:
        x = re.search(pattern, futon)
        if x: #Convert to N if fit
            newString += 'N '
        else:
            newString += futon + ' '
        
    #New string with converted variables
    print(newString) 
    

main()    
    
