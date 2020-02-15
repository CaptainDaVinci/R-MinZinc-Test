% Model to find integer solution to a linear equation.
% 
%          ax + by = c

par int: a;
par int: b;
par int: c;

var int: x;
var int: y;

constraint a * x + b * y = c;
constraint x <= c /\ y <= c;
solve satisfy;

output [ "\(a)x + \(b)y = \(c)\n" ++
        "x = \(x) and y = \(y)\n" ]