#### from https://github.com/twnbay78/Simple-Machine-Learning

<h3>Summary</h3>

In the new age of Artificial Intelligence, machine learning has become quite popular 
due to how powerful it can be. One field that utilizes machine learning quite frequently
is finance, particularly in the real-estate sector. 

This program will take in training data from a .txt file consisting of house attributes (number
of bathrooms, year the house was built, size of the house, etc...), and minimize the sum 
of squared residuals, or "data fits" the systems of equations in order to find weights 
associated with the data. The weights are then applied to test data, which consists of
solely house attributes in order to estimate the cost of a house. 

### Usage

Compiling and linking necessary files is made simple using the "make" command in terminal:

`$make`

If you need to compile for win64, you can cross/compile fron linux (Ubuntu):
Install mingw:
~~~~
sudo apt-get install mingw-w64
sudo apt-get update
~~~~
And to compile use:
`x86_64-w64-mingw32-g++ -o learnWin.exe learn.c`


Running the program is accomplished by initializing the following terminal command:

`./learn train_file.txt test_file.txt`


## Test files structure:
num(number of not-to-predict elements for each group)
num(number of groups in this file)
group1
group2
group3
.
.
.

example:
~~~~
3
5
12,33,44,30000(last element of the line is the one to predict/learn)
534,432,674,31411243
321,65454,4321,745
342,5436,866,53423
423,645,321,65
~~~~

### Implementation

Calculating the weights needed to estimate the house cost is done by computing the 
Moore-Penrose "pseudoinverse." the equation is as follows: 

`W = (XTT * X)^−1 * X^T * Y`



