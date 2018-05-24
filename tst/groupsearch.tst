#############################################################################
##
#W  groupsearch.tst          DifSets Package                     Dylan Peifer
##
##  Tests of functions from groupsearch.gi.
##

gap> START_TEST("DifSets Package: groupsearch.tst");

gap> LoadPackage("example", false);
true

gap> G := SmallGroup(8, 3);;
gap> RefiningSeries(G);
[ <pc group of size 8 with 3 generators>, Group([ f2, f3 ]), Group([ f3 ]),
  Group([  ]) ]

gap> G := SmallGroup(31, 1);;
gap> PossibleDifferenceSetSizes(G);
[ 6, 10, 15 ]

gap> G := SmallGroup(16, 9);;
gap> DifferenceSetsOfSizeK(G, 1);
[ [ 1 ] ]

gap> G := SmallGroup(16, 9);;
gap> DifferenceSets(G);
[ [ 1, 2, 8, 10, 11, 15 ], [ 1, 2, 8, 9, 10, 11 ] ]

gap> G := SmallGroup(16, 8);;
gap> N := NormalSubgroups(G)[5];;
gap> DifferenceSumsOfSizeK(G, N, 1);
[ [ 1, 0, 0, 0 ] ]

gap> G := SmallGroup(16, 8);;
gap> N := NormalSubgroups(G)[5];;
gap> DifferenceSums(G, N);
[ [ 3, 1, 1, 1 ], [ 2, 2, 2, 0 ] ]

gap> STOP_TEST("groupsearch.tst", 10000);

#############################################################################
##
#E
