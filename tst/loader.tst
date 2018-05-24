#############################################################################
##
#W  loader.tst               DifSets Package                     Dylan Peifer
##
##  Tests of functions from loader.gi.
##

gap> START_TEST("DifSets Package: loader.tst");

gap> CanLoadDifferenceSets(36, 9);
true
gap> CanLoadDifferenceSets(64, 267);
false

gap> LoadDifferenceSets(15, 1);
[ [ 1, 2, 4, 7, 8, 11, 15 ] ]
gap> G := SmallGroup(15, 1);; H := AbelianGroup([15]);;
gap> IdGroup(G) = IdGroup(H);
true
gap> IsDifferenceSet(G, [1, 2, 4, 7, 8, 11, 15]);
true
gap> IsDifferenceSet(H, [1, 2, 4, 7, 8, 11, 15]);
false

gap> STOP_TEST("loader.tst", 10000);

#############################################################################
##
#E
