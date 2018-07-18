
R-intro - session #1 recap
========================================================
author: João Gonçalves
date: 17 July 2018
autosize: true
css: custom.css

Assignment operator <-
========================================================
class: small-code

- Everything starts with an assignement! :-)


```r
variableName <- value
```

- Simple arithmetic operations:


```r
x <- 10
y <- 7.25

z <- x + y

print(z)
```

```
[1] 17.25
```


Functions
========================================================
class: small-code

- Functions calls are composed by the function name and a series of values for the different parameters inside `( )`


```r
funName(arg1 = value1, arg2 = value2, arg3 = value3)
```

An example:


```r
data(iris)

quantile(x = iris[,"Sepal.Length"], probs = 0.25, na.rm = TRUE)
```

```
25% 
5.1 
```

Scalars, vectors and matrices
========================================================
class: small-code
left: 40%

From simple to more complex:

- __Scalar__: single value
- __Vector__: multiple values (one type only)
- __Matrix__: multiple rows and columns (one type only)
- __Data frame__: multiple rows and columns (multiple types)

***

![](scalar-to-matrix.png)


Scalars, vectors and matrices
========================================================
class: small-code

- The `c()` function is used to concatenate multiple values in vectors


```r
x <- c(1, 2, 10, 1000)
print(x)
```

```
[1]    1    2   10 1000
```

```r
pt_cities <- c("Viseu", "Porto", "Lisboa")
print(pt_cities)
```

```
[1] "Viseu"  "Porto"  "Lisboa"
```

```r
length(pt_cities)
```

```
[1] 3
```


Scalars, vectors and matrices
========================================================
class: small-code

- The function `matrix()` is used to create matrices


```r
m <- matrix(1:9, nrow = 3, ncol = 3)
print(m)
```

```
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9
```

```r
nrow(m)
```

```
[1] 3
```

```r
ncol(m)
```

```
[1] 3
```


The recycling property of R (1)
========================================================
left: 10%
class: small-code

![](recycling.png)

*** 


```r
x <- rnorm(5, mean = 10, sd = 1)

print(x)
```

```
[1] 11.014070  8.479927  9.209859  8.635351 10.503302
```

```r
x + 1000
```

```
[1] 1011.014 1008.480 1009.210 1008.635 1010.503
```

```r
sqrt(x)
```

```
[1] 3.318745 2.912031 3.034775 2.938597 3.240880
```


The recycling property of R (2)
========================================================
left: 10%
class: small-code

![](recycling.png)

***

- Joining two vectors into a dataframe


```r
x <- 1:5
y <- 1:7

cbind(x = x, y = y) # The shorter x vector will be 'recycled'
```

```
     x y
[1,] 1 1
[2,] 2 2
[3,] 3 3
[4,] 4 4
[5,] 5 5
[6,] 1 6
[7,] 2 7
```

```
Warning message:
In cbind(x = x, y = y) :
  number of rows of result is not a multiple of vector length (arg 1)
```

Sequences - the : operator
========================================================
class: small-code

- Generating numeric sequences in R is simple and handy


```r
x <- 1:10
print(x)
```

```
 [1]  1  2  3  4  5  6  7  8  9 10
```


- Or using the function `seq()`


```r
y <- seq(from = 1, to = 5, by = 0.25)
print(y)
```

```
 [1] 1.00 1.25 1.50 1.75 2.00 2.25 2.50 2.75 3.00 3.25 3.50 3.75 4.00 4.25
[15] 4.50 4.75 5.00
```


Logical vectors
========================================================
class: small-code

- Generated when a logical operation is performed by element


```r
x <- 1:10
x > 5
```

```
 [1] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE
```

```r
x == 10
```

```
 [1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
```

```r
x < 3
```

```
 [1]  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
```


Indexation of vectors
========================================================
class: small-code

- The `[ ]` is used to subset vectors
- Mainly, in three different ways:

- By name

```r
temp <- c(14.5, 15.7, 17.2, 18.7)
names(temp) <- c("Porto","Coimbra","Faro","Funchal")

temp["Porto"]
```

```
Porto 
 14.5 
```


Indexation of vectors
========================================================
class: small-code

- By position

```r
temp[c(2,4)]
```

```
Coimbra Funchal 
   15.7    18.7 
```


Indexation of vectors
========================================================
class: small-code

- By logical condition

```r
temp[temp > 16]
```

```
   Faro Funchal 
   17.2    18.7 
```


Indexation of matrices
========================================================
class: small-code

- The `[row, col]` is used to subset rows and/or columns of a matrix/data frame

- By name

```r
data(iris)

iris[,"Sepal.Length"] # Get column named "Sepal.Length"
```

```
  [1] 5.1 4.9 4.7 4.6 5.0 5.4 4.6 5.0 4.4 4.9 5.4 4.8 4.8 4.3 5.8 5.7 5.4
 [18] 5.1 5.7 5.1 5.4 5.1 4.6 5.1 4.8 5.0 5.0 5.2 5.2 4.7 4.8 5.4 5.2 5.5
 [35] 4.9 5.0 5.5 4.9 4.4 5.1 5.0 4.5 4.4 5.0 5.1 4.8 5.1 4.6 5.3 5.0 7.0
 [52] 6.4 6.9 5.5 6.5 5.7 6.3 4.9 6.6 5.2 5.0 5.9 6.0 6.1 5.6 6.7 5.6 5.8
 [69] 6.2 5.6 5.9 6.1 6.3 6.1 6.4 6.6 6.8 6.7 6.0 5.7 5.5 5.5 5.8 6.0 5.4
 [86] 6.0 6.7 6.3 5.6 5.5 5.5 6.1 5.8 5.0 5.6 5.7 5.7 6.2 5.1 5.7 6.3 5.8
[103] 7.1 6.3 6.5 7.6 4.9 7.3 6.7 7.2 6.5 6.4 6.8 5.7 5.8 6.4 6.5 7.7 7.7
[120] 6.0 6.9 5.6 7.7 6.3 6.7 7.2 6.2 6.1 6.4 7.2 7.4 7.9 6.4 6.3 6.1 7.7
[137] 6.3 6.4 6.0 6.9 6.7 6.9 5.8 6.8 6.7 6.7 6.3 6.5 6.2 5.9
```


Indexation of matrices
========================================================
class: small-code

- By position

```r
iris[10:20, 2] # Columns 10 to 20 and column #2 - Sepal.Width
```

```
 [1] 3.1 3.7 3.4 3.0 3.0 4.0 4.4 3.9 3.5 3.8 3.8
```


Indexation of matrices
========================================================
class: small-code

- By logical condition

```r
iris[iris[,"Sepal.Length"] >= 7.5, ] # Select all observation with a Sepal.Length >= 0.75
```

```
    Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
106          7.6         3.0          6.6         2.1 virginica
118          7.7         3.8          6.7         2.2 virginica
119          7.7         2.6          6.9         2.3 virginica
123          7.7         2.8          6.7         2.0 virginica
132          7.9         3.8          6.4         2.0 virginica
136          7.7         3.0          6.1         2.3 virginica
```



