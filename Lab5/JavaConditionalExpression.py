#Identify the components of a Java Conditional Expression

import re

#Double check potential extra spaces to avoid incorrect translation
def validSpace(stringTerm):
    splitTerm = stringTerm.split()
    if(splitTerm.__len__()>1):
        return False
    else: return True

#Check to see if a conditon statement is in the correct form and convert its
#components
def checkCondStatement(condStatement):
    
    patternConditional = ">|<|>=|<=|!=|=="
    
    condStatement = re.sub(patternConditional,"COp", condStatement)
    
    setTerm = re.split("COp", condStatement)
    
    #Iterate the components group if it only involves an Identifier and a 
    #term that is seperated by a conditional operator
    if setTerm.__len__() == 2:
        if(validSpace(setTerm[0]) == False):
            return None
        setTerm[0] = checkIdentifier(setTerm[0])
        
        if setTerm[0] == None:
            return None
        else: 
            setTerm[1] = checkTerm(setTerm[1])
            if setTerm[1] == None:
                return None
            else: return setTerm[0]+ " COp " + setTerm[1]            
    else: return None
    

#Check if term is valid and translate to Identifier or Integer
def checkTerm(term):
    
    arithIdentifier = "\+|\-|\/|\*|\%"
    
    setFig = re.split(arithIdentifier,term)
    
    resultTerm =[]
    
    for i in setFig:
        if(validSpace(i)==False):
            return None
        kibo = checkNum(i)
        if (kibo == None):
            kibo = checkIdentifier(i)         
            if (kibo == None):
                return None
            else: resultTerm.append(kibo)
        else: 
            resultTerm.append(kibo)
    
    outputStatement = ""
    for i in range(resultTerm.__len__()-1):
        outputStatement += resultTerm[i]
        outputStatement += " AOp "
    
    outputStatement += resultTerm[resultTerm.__len__()-1]
    
    return outputStatement
        
#Check Numbers 
def checkNum(testString):
    testString = testString.split()[0]
    patternI = "^[+-]?([0-9]+)$"
    # PATTERN
    # [0-9] Greedily add till end of string, see if Integer, can take negative
    patternF = "^[+-]?([0-9]+([.][0-9]+))$"
    # PATTERN
    # [0-9] Greedily add till end of string, see if Float, can take negatvie
    # seperated by a dot.
    
    
    setString = re.split('[ ,]', testString)
    #Split string to test on each smaller string
        
    newString = ""
    
    for futon in setString:
        
        x = re.search(patternI, futon)
        y = re.search(patternF, futon)
        
        if y:
            newString += "N" #Convert to F if fits float
        else:
            if x:
                newString += "N" #Convert to I if fits float
            else:
                return None
                
    return newString
    
    
#Check Identifier in Java
def checkIdentifier(identifier):
    
    identifier = identifier.split()[0]
    
    patternIdentifier = "^[a-z]|[a-zA-Z0-9_]$" 
    
    checkIden = re.search(patternIdentifier, identifier)
    
    if checkIden:
        return "I"
    else:
        return None
    
    

def main(inputStatement):
    
    #split the string based on the number of logical operators involve
    inputStatement = re.sub("&&", "LOp", inputStatement)
    inputStatement = re.sub("\|\|", "LOp", inputStatement)
    setCondStatement = re.split("LOp",inputStatement)

    finalOut = []
    #translation and checking step
    for i in setCondStatement:
        kibo = checkCondStatement(i)
        if kibo == None:
            print("Not a Conditional Input")
            return None
        else: finalOut.append(kibo)
        
        
    outputStatement = ""
    for i in range(finalOut.__len__()-1):
        outputStatement += finalOut[i]
        outputStatement += " LOp "
    
    outputStatement += finalOut[finalOut.__len__()-1]
    
    print(outputStatement)
    return outputStatement
    
testString = input("enter string to test if valid variable: ")

main(testString)    
    