#https://www.w3schools.com/python/python_regex.asp

import re

def main():
    
    patternI = "^[+-]?([0-9]+)$"
    # PATTERN
    # [0-9] Greedily add till end of string, see if Integer, can take negative
    patternF = "^[+-]?([0-9]+([.][0-9]+))$"
    # PATTERN
    # [0-9] Greedily add till end of string, see if Float, can take negatvie
    # seperated by a dot.
    
    testString = input("enter string to test if digits: ")
    
    setString = re.split('[ ,]', testString)
    #Split string to test on each smaller string
        
    newString = ""
    
    for futon in setString:
        
        x = re.search(patternI, futon)
        y = re.search(patternF, futon)
        
        if y:
            newString += "F " #Convert to F if fits float
        else:
            if x:
                newString += "I " #Convert to I if fits float
            else:
                newString += futon + ' '
    
     #New string with converted variables
    print (newString)

main()    
    
