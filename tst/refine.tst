#############################################################################
##
#W  refine.tst               DifSets Package                     Dylan Peifer
##
##  Tests of functions from refine.gi.
##

gap> START_TEST("DifSets Package: refine.tst");

gap> G := SmallGroup(16, 5);;
gap> N := NormalSubgroups(G)[5];;
gap> AllRefinedDifferenceSets(G, N, [[3,1,1,1], [2,2,2,0]]);
[ [ 1, 3, 2, 8, 4, 15 ], [ 1, 3, 2, 8, 9, 11 ], [ 1, 3, 2, 13, 4, 11 ],
  [ 1, 3, 2, 13, 9, 15 ], [ 1, 3, 6, 8, 4, 11 ], [ 1, 3, 6, 8, 9, 15 ],
  [ 1, 3, 6, 13, 4, 15 ], [ 1, 3, 6, 13, 9, 11 ], [ 1, 5, 2, 6, 4, 15 ],
  [ 1, 5, 2, 6, 9, 11 ], [ 1, 5, 2, 13, 4, 9 ], [ 1, 5, 2, 13, 11, 15 ],
  [ 1, 5, 6, 8, 4, 9 ], [ 1, 5, 6, 8, 11, 15 ], [ 1, 5, 8, 13, 4, 15 ],
  [ 1, 5, 8, 13, 9, 11 ], [ 1, 10, 2, 6, 4, 11 ], [ 1, 10, 2, 6, 9, 15 ],
  [ 1, 10, 2, 8, 4, 9 ], [ 1, 10, 2, 8, 11, 15 ], [ 1, 10, 6, 13, 4, 9 ],
  [ 1, 10, 6, 13, 11, 15 ], [ 1, 10, 8, 13, 4, 11 ], [ 1, 10, 8, 13, 9, 15 ],
  [ 3, 5, 2, 6, 4, 11 ], [ 3, 5, 2, 6, 9, 15 ], [ 3, 5, 2, 8, 4, 9 ],
  [ 3, 5, 2, 8, 11, 15 ], [ 3, 5, 6, 13, 4, 9 ], [ 3, 5, 6, 13, 11, 15 ],
  [ 3, 5, 8, 13, 4, 11 ], [ 3, 5, 8, 13, 9, 15 ], [ 3, 10, 2, 6, 4, 15 ],
  [ 3, 10, 2, 6, 9, 11 ], [ 3, 10, 2, 13, 4, 9 ], [ 3, 10, 2, 13, 11, 15 ],
  [ 3, 10, 6, 8, 4, 9 ], [ 3, 10, 6, 8, 11, 15 ], [ 3, 10, 8, 13, 4, 15 ],
  [ 3, 10, 8, 13, 9, 11 ], [ 5, 10, 2, 8, 4, 15 ], [ 5, 10, 2, 8, 9, 11 ],
  [ 5, 10, 2, 13, 4, 11 ], [ 5, 10, 2, 13, 9, 15 ], [ 5, 10, 6, 8, 4, 11 ],
  [ 5, 10, 6, 8, 9, 15 ], [ 5, 10, 6, 13, 4, 15 ], [ 5, 10, 6, 13, 9, 11 ] ]

gap> G := SmallGroup(16, 5);;
gap> N := NormalSubgroups(G)[5];;
gap> NrAllRefinedSets(G, N, [[3,1,1,1], [2,2,2,0]]);
472

gap> G := SmallGroup(16, 5);;
gap> N := NormalSubgroups(G)[5];;
gap> SomeRefinedDifferenceSets(G, N, [[3,1,1,1], [2,2,2,0]]);
[ [ 1, 3, 2, 8, 4, 15 ], [ 1, 3, 2, 8, 9, 11 ], [ 1, 3, 2, 13, 4, 11 ],
  [ 1, 3, 2, 13, 9, 15 ], [ 1, 3, 6, 8, 4, 11 ], [ 1, 3, 6, 8, 9, 15 ],
  [ 1, 3, 6, 13, 4, 15 ], [ 1, 3, 6, 13, 9, 11 ], [ 1, 5, 2, 6, 4, 15 ],
  [ 1, 5, 2, 6, 9, 11 ], [ 1, 5, 2, 13, 4, 9 ], [ 1, 5, 2, 13, 11, 15 ],
  [ 1, 5, 6, 8, 4, 9 ], [ 1, 5, 6, 8, 11, 15 ], [ 1, 5, 8, 13, 4, 15 ],
  [ 1, 5, 8, 13, 9, 11 ], [ 1, 10, 2, 6, 4, 11 ], [ 1, 10, 2, 6, 9, 15 ],
  [ 1, 10, 2, 8, 4, 9 ], [ 1, 10, 2, 8, 11, 15 ], [ 1, 10, 6, 13, 4, 9 ],
  [ 1, 10, 6, 13, 11, 15 ], [ 1, 10, 8, 13, 4, 11 ], [ 1, 10, 8, 13, 9, 15 ] ]

gap> G := SmallGroup(16, 5);;
gap> N := NormalSubgroups(G)[5];;
gap> NrSomeRefinedSets(G, N, [[3,1,1,1], [2,2,2,0]]);
300

gap> G := SmallGroup(16, 5);;
gap> N1 := NormalSubgroups(G)[5];;
gap> N2 := NormalSubgroups(G)[8];;
gap> AllRefinedDifferenceSums(G, N1, N2, [[3,1,1,1], [2,2,2,0]]);
[ [ 1, 1, 0, 1, 0, 1, 2, 0 ], [ 1, 1, 2, 1, 0, 1, 0, 0 ], 
  [ 1, 0, 1, 1, 0, 2, 1, 0 ], [ 1, 2, 1, 1, 0, 0, 1, 0 ], 
  [ 0, 1, 1, 2, 0, 1, 1, 0 ], [ 2, 1, 1, 0, 0, 1, 1, 0 ] ]

gap> G := SmallGroup(16, 5);;
gap> N1 := NormalSubgroups(G)[5];;
gap> N2 := NormalSubgroups(G)[8];;
gap> NrAllRefinedSums(G, N1, N2, [[3,1,1,1], [2,2,2,0]]);
22

gap> G := SmallGroup(16, 5);;
gap> N1 := NormalSubgroups(G)[5];;
gap> N2 := NormalSubgroups(G)[8];;
gap> SomeRefinedDifferenceSums(G, N1, N2, [[3,1,1,1], [2,2,2,0]]);
[ [ 1, 1, 0, 1, 0, 1, 2, 0 ], [ 1, 1, 2, 1, 0, 1, 0, 0 ], 
  [ 1, 0, 1, 1, 0, 2, 1, 0 ], [ 1, 2, 1, 1, 0, 0, 1, 0 ], 
  [ 2, 1, 1, 0, 0, 1, 1, 0 ] ]

gap> G := SmallGroup(16, 5);;
gap> N1 := NormalSubgroups(G)[5];;
gap> N2 := NormalSubgroups(G)[8];;
gap> NrSomeRefinedSums(G, N1, N2, [[3,1,1,1], [2,2,2,0]]);
21

gap> STOP_TEST("refine.tst", 10000);

#############################################################################
##
#E
