**Discussing: Names, Types and Binding**

In The R Programming Language, there are a set of **reserved keywords** in the language that cannot be used as identifiers in the language since they have special meanings, e.g., logical conditioning if – else. To view the reserved words in R, users can run either one of these two codes on the terminal [1]:

\&gt; help( reserved ) or \&gt; ?reserved

For **styling** in R, just like in other environment, one of the foremost features for either file name, objects or variable is that it would need to be descriptive and precise. However, R itself would also have its own indications for styling [2]:

- File names: must end with an &#39;.R&#39; and must have a dash &#39;-&#39; between words – Example: homework-lab-1.R. The &#39;.R&#39; is required for an R type files, however, the other convention is that derived from the community.
- Object names: having a low dash &#39;\_&#39; between words – Example: test\_integer. However, this convention derived from the community, objects with no dash can still be compiled.
- Spacing: around infix operators must have spaces. Example: However, this convention derived from the community, an equation with numbers and no spaces among the operators can still be compiled.
- Curly braces: after opening a curly brace, the code should be in the next line. Also for the ending brace, it should also be written in another line. This is also a convention from the community.
- Assignment: Unlike Java which use &quot;=&quot;, in R, to assign a value to a variable we would use an arrow &#39;\&lt;-&#39;. The right arrow would also work fine but it is a convention of the community to use left arrow. Example: x \&lt;- 1. [3]

R is a language that is dynamic but also is strongly typed. When creating a variable user would not have to state the type of the variable, along with that is the type of a variable can be changed flexibly. R is also strongly typed, and it could be seen if the users try to add a double with a string using a &#39;+&#39; operator – the language will immediately identify it as an error. [4]

The objects in R Programming language are &quot;mostly&quot; immutable – which means that when modifying an object, we can see that the memory of the object will be modified [5]. Taking into the example of when a user modifies a list:

x \&lt;- list( 1, 2, 3) #Creating the list

x[1] = 1 #Change the value of the object at index 1 in the list

Thus, the outcome of the codes will be a new list of x with the set of value [1, 1, 3]. However, this set of value is formed by copying the original list to a new address and modify the index, afterwards, object x will point to the copied list. Nevertheless, there are still cases where the objects are mutable, one is that if we change our code to x[[1]] = 1, then we will get to modify the value of the index but not the list itself. [5]

Within R, the operations that can be used can be divided into several categories: [6]

- Arithmetic Operators
- Relational Operators
- Logical Operators
- Assignment Operators
- Miscellaneous Operators

Notably the arithmetic operators, unlike in Java or Python – where users can add strings directly together, the case would not be it for R. For detail documentation and example of all the operators, please visit this site: [https://www.tutorialspoint.com/r/r\_operators.htm](https://www.tutorialspoint.com/r/r_operators.htm).

There are many packages that are recommended to be built and run in R, their functionalities usually center around helping data scientists in analyzing data and plotting. Some that can be mentioned would be: [7]

- ggplot2, dplyr and dbplyr: data visualizing, plotting and summary
- mlr3 and caret: for machine learning
- knitr: aid building analytical reports
- tidyverse: aid the process of using R to be more efficient and easier

**Bibliography**

[1] &quot;R Keywords (Reserved Words),&quot; _DataMentor_, Nov. 24, 2017. https://www.datamentor.io/r-programming/reserved-words/ (accessed Mar. 06, 2022).

[2] &quot;Style guide · Advanced R.&quot; http://adv-r.had.co.nz/Style.html (accessed Mar. 06, 2022).

[3] jmount, &quot;The Case For Using -\&gt; In R,&quot; _Win Vector LLC_, Dec. 13, 2016. https://win-vector.com/2016/12/12/the-case-for-using-in-r/ (accessed Mar. 06, 2022).

[4] &quot;Tutorial: Introduction to the R programming language.&quot; https://mlconference.ai/blog/introduction-to-the-r-programming-language/ (accessed Mar. 06, 2022).

[5] G. Lang, &quot;RFP - Part5: Immutability in R,&quot; _Become Great at R_. https://masterr.org/r/RFP-part5-immutability/ (accessed Mar. 06, 2022).

[6] &quot;R - Operators.&quot; https://www.tutorialspoint.com/r/r\_operators.htm (accessed Mar. 06, 2022).

[7] &quot;Best R Packages for Data Science,&quot; _Udacity_, Jan. 28, 2021. https://www.udacity.com/blog/2021/01/best-r-packages-for-data-science.html (accessed Mar. 06, 2022).
