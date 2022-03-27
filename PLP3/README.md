Selection Control Structures in R

The Booleans values in R contains TRUE and FALSE. Along with them are comparison and Boolean operators that help aid the setting of conditions in R. Listed below are the sets of comparison and Boolean operators used in R: [1]

- &quot;\&lt;&quot;, &quot;\&gt;&quot; : less than, greater than
- &quot;\&lt; =&quot;, &quot;\&gt;=&quot; : less than or equal to, greater than or equal to
- &quot;==&quot;: equals to
- &quot;!=&quot;: not equals to
- &quot;&amp;&quot;, &quot;&amp;&amp;&quot;: AND
- &quot;|&quot;,&quot;||&quot;: OR
- &quot;!&quot;: NOT

A typical selection If-statement in R would follow the following code blocks conventions: [2]

**if** (condition){ **true**.expression} **else** { **false**.expression}

In this statement, as the &quot;condition&quot; is TRUE or non-zero, the commands contained in the &quot;true.expression&quot; in the curly brackets will be conducted, while a FALSE condition will cause the commands in &quot;false.expression&quot; to be executed. It is worth it to note that if either the true or false expression only involve with one command, the curly brackets will be optional.[2]

Beside the If-statement presented, R can also used the either: [2]

- else if (condition): This is to put the false expression of the first selection to another selection control, the latter part after would be similar to that of a typical if-statement
- ifelse (condition, expression1, expression2) : This function aims to be a quicker way to use an if statement, for example in for loop, in which if the condition returns a TRUE value, expression 1 will be executed while in the other case, expression 2 will be executed
- switch (): Switch statement is also a powerful selection control statement where the first input element is an indicator to find the match in the list that follows it (if the first input is a character object – for the case of an integer, the statement will return the object at the integer) [3]

_(I will demonstrate each case of using these statements in the example code)_

Short-circuit within R is like the case of Python and Java, in which if examining one factor of the condition already answer the Boolean value, R will skip evaluating the latter components. [4] However, short-circuit in R would only be conducted if the users are running the condition with the long form of the logical operators &quot;&amp;&amp;&quot; and &quot;||&quot;, while the short form of these would examine till the last component.[5]

_(I will demonstrate short circuit in the example code)_

In R, to break out of a function using a validated Boolean from a selection statement in R, the users can use the function stop(). Inside the bracket, a string could be included, this string will be printed out as R executes the stop() function. Within the case of switch(), the users can just but the stop() function at the very last element of the list so that it can mark the end of switch function iteration. [1]

Bibliography

[1] &quot;R for Spatial Scientists.&quot; https://gsp.humboldt.edu/olm/R/02\_05\_BooleanComparisonsIfStatements.html (accessed Mar. 27, 2022).

[2] &quot;Conditionals in R | Applied R Code.&quot; http://applied-r.com/conditionals-in-r/ (accessed Mar. 27, 2022).

[3] &quot;R switch() Function (With Examples),&quot; _DataMentor_, Nov. 24, 2017. https://www.datamentor.io/r-programming/switch-function/ (accessed Mar. 27, 2022).

[4] &quot;Short-circuit evaluation of boolean operations in R | r-critique.com.&quot; https://r-critique.com/short-circuit-evaluation (accessed Mar. 27, 2022).

[5] &quot;R: Logical Operators.&quot; https://stat.ethz.ch/R-manual/R-patched/library/base/html/Logic.html (accessed Mar. 27, 2022).