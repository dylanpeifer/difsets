#############################################################################
##
#W  tests.tst                DifSets Package                     Dylan Peifer
##
##  Tests of functions from tests.gi.
##

gap> START_TEST("DifSets Package: tests.tst");

gap> G := SmallGroup(16, 4);;
gap> IsDifferenceSet(G, [1, 2, 3, 4, 5, 6]);
false
gap> IsDifferenceSet(G, [1, 2, 8, 10, 11, 15]);
true

gap> G := SmallGroup(16, 4);;
gap> N := Subgroup(G, [G.1 * G.2 * G.3, G.3, G.4]);;
gap> IsDifferenceSum(G, N, [2, 4]);
true
gap> IsDifferenceSum(G, N, [1, 1]);
false

gap> G := SmallGroup(16, 4);;
gap> IsEquivalentDifferenceSet(G, [1,5,8,9,10,14], [1,5,7,8,10,15]);
false

gap> G := SmallGroup(16, 4);;
gap> N := Subgroup(G, [G.1 * G.2 * G.3, G.3, G.4]);;
gap> IsEquivalentDifferenceSum(G, N, [2,4], [4,2]);
true

gap> STOP_TEST("tests.tst", 10000);

#############################################################################
##
#E
