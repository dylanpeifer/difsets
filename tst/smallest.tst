#############################################################################
##
#W  smallest.tst             DifSets Package                     Dylan Peifer
##
##  Tests of functions from smallest.gi.
##

gap> START_TEST("DifSets Package: smallest.tst");

gap> G := SmallGroup(16, 4);;
gap> SmallestEquivalentDifferenceSet(G, [8,9,12,13,14,15]);
[ 1, 2, 3, 4, 8, 15 ]

gap> G := SmallGroup(16, 4);;
gap> sets := [[8,9,12,13,14,15], [7,8,9,13,15,16], [1,7,10,11,14,15]];;
gap> SmallestEquivalentFreeListOfDifferenceSets(G, sets);
[ [ 1, 2, 3, 4, 8, 15 ] ]

gap> STOP_TEST("smallest.tst", 10000);

#############################################################################
##
#E
