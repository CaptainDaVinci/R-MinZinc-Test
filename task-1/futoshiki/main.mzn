% Solve a Futoshiki puzzle

include "alldifferent.mzn";

% Grid size, parameter N.
par int: N;

% Set grid range.
par set of int: PuzzleRange = 1..N;

% 2-D array for initial state of puzzle, inequalities and final solution state.
array[1..N, 1..N] of par 0..N: initial;
array[1..N, 1..N] of par 0..4: inequality;
array[1..N, 1..N] of var int: puzzle;

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

% Contraint on inequality
% 1 -> puzzle[i, j] < puzzle[i - 1, j]
% 2 -> puzzle[i, j] < puzzle[i, j + 1]
% 3 -> puzzle[i, j] < puzzle[i + 1, j]
% 4 -> puzzle[i, j] < puzzle[i, j - 1]
% 0 -> no inequality
constraint forall(i, j in PuzzleRange)
                  (if inequality[i, j] == 1 then puzzle[i - 1, j] > puzzle[i, j]
                   elseif inequality[i, j] == 2 then puzzle[i, j + 1] > puzzle[i, j]
                   elseif inequality[i, j] == 3 then puzzle[i + 1, j] > puzzle[i, j]
                   elseif inequality[i, j] == 4 then puzzle[i, j - 1] > puzzle[i, j]
                   else true
                   endif);
                   
var int: max_value = max([puzzle[i, j] | i, j in PuzzleRange]);

% Restrict values of puzzle to be less than max value in puzzle + N
constraint forall(i, j in PuzzleRange)
                  (puzzle[i, j] > 0 /\ puzzle[i, j] < max_value + N);
              
solve satisfy;

output [ show(puzzle[i, j]) ++
          if j == N then "\n" else " " endif | i, j in PuzzleRange]
          
          