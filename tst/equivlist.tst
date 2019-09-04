#############################################################################
##
#W  equivlist.tst            DifSets Package                     Dylan Peifer
##
##  Tests of functions from equivlist.gi.
##

gap> START_TEST("DifSets Package: equivlist.tst");

gap> G := SmallGroup(16, 4);;
gap> sets := [[8,9,12,13,14,15], [7,8,9,13,15,16], [1,7,10,11,14,15]];;
gap> EquivalentFreeListOfDifferenceSets(G, sets);
[ [ 8, 9, 12, 13, 14, 15 ] ]

gap> G := SmallGroup(16, 4);;
gap> sets := [[8,9,12,13,14,15], [7,8,9,13,15,16], [1,7,10,11,14,15]];;
gap> TranslateFreeListOfDifferenceSets(G, sets);
[ [ 8, 9, 12, 13, 14, 15 ], [ 7, 8, 9, 13, 15, 16 ] ]

gap> G := SmallGroup(16, 4);;
gap> N := Subgroup(G, [G.1 * G.2 * G.3, G.3, G.4]);;
gap> EquivalentFreeListOfDifferenceSums(G, N, [[4,2], [2,4]]);
[ [ 4, 2 ] ]

gap> G := SmallGroup(16, 4);;
gap> N := Subgroup(G, [G.1 * G.2 * G.3, G.3, G.4]);;
gap> TranslateFreeListOfDifferenceSums(G, N, [[4,2], [2,4]]);
[ [ 4, 2 ] ]

gap> STOP_TEST("equivlist.tst", 10000);

#############################################################################
##
#E
