#############################################################################
##
#W  groupsearch.gi           DifSets Package                     Dylan Peifer
##
##  Functions set up the algorithm and pass work off to the refining and
##  equivalent list functions for each stage.
##

#############################################################################
##
#F  RefiningSeries( <G> )
##
InstallGlobalFunction( RefiningSeries, function (G)
    local bestN, bestsize, N;

    # find a nontrivial normal subgroup of smallest possible size
    bestN := G;
    bestsize := Size(G);

    for N in NormalSubgroups(G) do
        if Size(N) < bestsize and Size(N) > 1 then
            bestN := N;
            bestsize := Size(N);
        fi;
    od;

    # return a chief series ending in this minimal normal subgroup
    return ChiefSeriesThrough(G, [bestN]);
end );

#############################################################################
##
#F  PossibleDifferenceSetSizes( <G> )
##
InstallGlobalFunction( PossibleDifferenceSetSizes, function (G)
    local v, ks, IsSquareFree, Test;

    v := Size(G);
    ks := List([2..Int(v/2)]); # ignore size 1 and larger of complements

    # counting test
    ks := Filtered(ks, k->IsInt(k*(k-1)/(v-1)));

    # BRC test
    if IsEvenInt(v) then
        ks := Filtered(ks, k->IsSquareInt(k - k*(k-1)/(v-1)));
    else
        IsSquareFree := x -> Product(Set(FactorsInt(x))) = x;
        Test := function (k)
            local lambda, a, b, d;
            lambda := k*(k-1)/(v-1);
            a := k - lambda;
            b := (-1)^((v-1)/2) * lambda;
            if IsSquareFree(a) and IsSquareFree(b) then
                d := GcdInt(a, b);
                return Legendre(a, AbsInt(b)) = 1 and
                       Legendre(b, AbsInt(a)) = 1 and
                       Legendre(-a*b/d^2, d) = 1;
            else
                return true;
            fi;
            end;

        ks := Filtered(ks, k->Test(k));
    fi;

    return ks;
end );

#############################################################################
##
#F  DifferenceSetsOfSizeK( <G>, <k> )
##
InstallGlobalFunction( DifferenceSetsOfSizeK, function (G, k)
    local series, oldN, difsums, i, newN, difsets;

    series := RefiningSeries(G);

    # at start the quotient group G/G is trivial and the only difsum is k
    oldN := G;
    difsums := [[k]];

    # perform search and remove equivalents for each stage
    for i in [2..Length(series)-1] do

        newN := series[i];
        difsums := SomeRefinedDifferenceSums(G, oldN, newN, difsums);
        difsums := EquivalentFreeListOfDifferenceSums(G, newN, difsums);

        oldN := newN; # prepare for next stage

    od;

    # in final stage refine to difsets and remove equivalents
    difsets := SomeRefinedDifferenceSets(G, oldN, difsums);
    difsets := SmallestEquivalentFreeListOfDifferenceSets(G, difsets);

    return difsets;
end );

#############################################################################
##
#F  DifferenceSets( <G> )
##
InstallGlobalFunction( DifferenceSets, function (G)
    local difsets, k; 

    difsets := []; # will store all inequivalent difsets

    for k in PossibleDifferenceSetSizes(G) do
        Append(difsets, DifferenceSetsOfSizeK(G, k));
    od;

    return difsets;
end );

#############################################################################
##
#F  DifferenceSumsOfSizeK( <G>, <N>, <k> )
##
InstallGlobalFunction( DifferenceSumsOfSizeK, function (G, N, k)
    local phi, series, oldN, difsums, i, newN;

    # produce a refining series for G/N and find its preimage in G
    phi := NaturalHomomorphismByNormalSubgroup(G, N);
    series := RefiningSeries(Image(phi));
    Apply(series, x -> PreImagesSet(phi, x));

    # at start the quotient group G/G is trivial and the only difsum is k
    oldN := G;
    difsums := [[k]];

    # perform search and remove equivalents for each stage
    for i in [2..Length(series)] do

        newN := series[i];
        difsums := SomeRefinedDifferenceSums(G, oldN, newN, difsums);
        difsums := EquivalentFreeListOfDifferenceSums(G, newN, difsums);

        oldN := newN; # prepare for next stage

    od;

    return difsums;
end );

#############################################################################
##
#F  DifferenceSums( <G>, <N> )
##
InstallGlobalFunction( DifferenceSums, function (G, N)
    local difsums, k;

    difsums := []; # will store all inequivalent difsums

    for k in PossibleDifferenceSetSizes(G) do
        Append(difsums, DifferenceSumsOfSizeK(G, N, k));
    od;

    return difsums;
end );

#############################################################################
##
#E

