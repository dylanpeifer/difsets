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
gap> List(RefiningSeries(G), N -> Size(N));
[ 8, 4, 2, 1 ]

gap> G := SmallGroup(31, 1);;
gap> PossibleDifferenceSetSizes(G);
[ 6, 10, 15 ]

gap> G := SmallGroup(16, 9);;
gap> DifferenceSetsOfSizeK(G, 1);
[ [ 1 ] ]

gap> G := SmallGroup(16, 9);;
gap> DifferenceSets(G);
[ [ 1, 2, 3, 4, 7, 10 ], [ 1, 2, 3, 4, 8, 9 ] ]

gap> G := SmallGroup(16, 8);;
gap> N := Subgroup(G, [G.3, G.4]);;
gap> DifferenceSumsOfSizeK(G, N, 1);
[ [ 1, 0, 0, 0 ] ]

gap> G := SmallGroup(16, 8);;
gap> N := Subgroup(G, [G.3, G.4]);;
gap> DifferenceSums(G, N);
[ [ 3, 1, 1, 1 ], [ 2, 2, 2, 0 ] ]

gap> STOP_TEST("groupsearch.tst", 10000);

#############################################################################
##
#E
