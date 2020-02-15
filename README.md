# R-MinZinc-Test
Test Results for R-MinZinc GSoC'20

## Task 1

### Example 1
A basic example to get started with MiniZinc. Colouring states of Australia using _n_ colors, such that
no two adjacent states have the same colour.

```
$ minizinc example-1/main.mzn example-1/data.dzn
Colours: Red Blue Green

WA = Green
NT = Blue
Q = Green
SA = Red
NSW = Blue
V = Green
T = Red
----------
```
### Example 2
Solving a _N_ x _N_ Sudoku puzzle.

```
$ minizinc example-2/main.mzn example-2/data.dzn
5 9 3  7 6 2  8 1 4
2 6 8  4 3 1  5 7 9
7 1 4  9 8 5  2 3 6

3 2 6  8 5 9  1 4 7
1 8 7  3 2 4  9 6 5
4 5 9  1 7 6  3 2 8

9 4 2  6 1 8  7 5 3
8 3 5  2 4 7  6 9 1
6 7 1  5 9 3  4 8 2

----------
```

### Diophantine Equation
Model to find integer solution to a linear equation. _ax + by = c_

```
$ minizinc diophantine/main.mzn diophantine/data.dzn
3x + 5y = 15
x = 15 and y = -6
```

### Futoshiki Puzzle
Model to find a solution for [Futoshiki](https://en.wikipedia.org/wiki/Futoshiki) puzzle.

```
$ minizinc futoshiki/main.mzn futoshiki/data.dzn
5 3 6 2 1
4 6 1 5 2
2 1 4 3 5
3 5 2 1 4
1 2 5 4 3
----------
```
