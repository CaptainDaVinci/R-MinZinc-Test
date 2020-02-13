% Solve a Sudoku puzzle

include "alldifferent.mzn";

% Set sub-grid, S, size and grid size, N.
par int: S;
par int: N = S * S;

% Set grid and sub-grid range.
par set of int: PuzzleRange = 1..N;
par set of int: SubSquareRange = 1..S;

% 2-D array for initial state of puzzle and final solution state.
array[1..N, 1..N] of par 0..N: initial;
array[1..N, 1..N] of var PuzzleRange: puzzle;

% Copy initial to puzzle.
constraint forall(i, j in PuzzleRange) 
                   (if initial[i, j] > 0 
                     then puzzle[i, j] = initial[i, j] 
                      else true endif);
                      
% Distinct row elements.
constraint forall(i in PuzzleRange)
                    (alldifferent([puzzle[i, j] | j in PuzzleRange]));

% Distinct column elements.
constraint forall(j in PuzzleRange)
                    (alldifferent([puzzle[i, j] | i in PuzzleRange]));

% Distinct sub-grid elements.
constraint forall(x, y in SubSquareRange)(
                    alldifferent(
              [puzzle[(x - 1) * S + i, (y - 1) * S + j] | i, j in SubSquareRange]));
              
solve satisfy;

output [ show(puzzle[i, j]) ++ " " ++
          if j mod S == 0 then " " else "" endif ++
          if i mod S == 0 /\ j mod N == 0 then "\n" else "" endif ++
          if j mod N == 0 then "\n" else "" endif
          | i, j in PuzzleRange]
          
          