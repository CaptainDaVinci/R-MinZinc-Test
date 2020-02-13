% A basic example to get started with MiniZinc.
%
% Colouring states of Australia using n colors, such that
% no two adjacent states have the same colour.

enum Colour;

var Colour: wa; var Colour: nt; var Colour: q; 
var Colour: sa; var Colour: nsw; var Colour: v;
var Colour: t;

constraint wa != nt /\ wa != sa /\ nt != sa /\ nt != q;
constraint q != nsw /\ sa != q /\ sa != nsw /\ sa != v /\ nsw != v;
solve satisfy;

output ["Colours: "] ++ [ "\(c) " | c in Colour ] ++ [
  "\n\nWA = \(wa)\n" ++
  "NT = \(nt)\n" ++
  "Q = \(q)\n" ++
  "SA = \(sa)\n" ++
  "NSW = \(nsw)\n" ++
  "V = \(v)\n" ++
  "T = \(t)\n"
]