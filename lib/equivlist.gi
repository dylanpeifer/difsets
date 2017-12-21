#############################################################################
##
#W  equivlist.gi             DifSets Package                     Dylan Peifer
##
##  Functions take in a list of difference sets/sums and return a list with
##  equivalent sets/sums removed.
##

#############################################################################
##
#F  EquivalentFreeListOfDifferenceSets( <G>, <difsets> )
##
InstallGlobalFunction( EquivalentFreeListOfDifferenceSets, function (G, difsets)
    local v, prod, auts, newdifsets, D, aut, i, d;

    # make difsets a set of immutable elements so we can use binary search
    # each difset must be a set so that permutations don't matter
    Apply(difsets, x->Immutable(Set(x)));
    difsets := Set(difsets);

    # handle special case of trivial input
    if Length(difsets) <= 1 then return difsets; fi;

    v := Size(G);
    prod := ProductTable(G);
    auts := AutomorphismsTable(G);
    newdifsets := []; # will store inequivalent difsets
 
    while Length(difsets) > 0 do

        # remove a difset and add to the equivalent-free list
        D := Remove(difsets);
        Add(newdifsets, D);

        # remove anything equivalent to D from difsets
        for aut in auts do
        for i in [1..v] do
            d := Set(D, x->prod[i][aut[x]]);
            RemoveSet(difsets, d);
        od;
        od;

    od;

    return newdifsets;
end );

#############################################################################
##
#F  TranslateFreeListOfDifferenceSets( <G>, <difsets> )
##
InstallGlobalFunction( TranslateFreeListOfDifferenceSets, function (G, difsets)
    local v, prod, newdifsets, D, i, d;

    # make difsets a set of immutable elements so we can use binary search
    # each difset must be a set so that permutations don't matter
    Apply(difsets, x->Immutable(Set(x)));
    difsets := Set(difsets);

    # handle special case of trivial input
    if Length(difsets) <= 1 then return difsets; fi;

    v := Size(G);
    prod := ProductTable(G);
    newdifsets := []; # will store inequivalent difsets
 
    while Length(difsets) > 0 do

        # remove a difset and add to the equivalent-free list
        D := Remove(difsets);
        Add(newdifsets, D);

        # remove anything translationally equivalent to D from difsets
        for i in [1..v] do
            d := Set(D, x->prod[i][x]);
            RemoveSet(difsets, d);
        od;

    od;

    return newdifsets;
end );

#############################################################################
##
#F  EquivalentFreeListOfDifferenceSums( <G>, <N>, <difsums> )
##
InstallGlobalFunction( EquivalentFreeListOfDifferenceSums, function (G, N, difsums)
    local v, w,prod, auts, newdifsums, S, aut, i, s, j;

    # make difsums a set of immutable elements so we can use binary search
    Apply(difsums, x->Immutable(x));
    difsums := Set(difsums);

    # handle special case of trivial input
    if Length(difsums) <= 1 then return difsums; fi;

    v := Size(G);
    w := Size(N);
    prod := ProductTable(G/N);
    auts := InducedAutomorphismsTable(G, N);
    newdifsums := []; # will store inequivalent difsums

    while Length(difsums) > 0 do

        # remove a difsum and add it to the equivalent-free list
        S := Remove(difsums);
        Add(newdifsums, S);

        # remove anything equivalent to S from difsums
        for aut in auts do
        for i in [1..v/w] do
            s := EmptyPlist(v/w);
            for j in [1..v/w] do
                s[prod[i][aut[j]]] := S[j];
            od;
            RemoveSet(difsums, s);
        od;
        od;

    od;

    return newdifsums;
end );

#############################################################################
##
#F  TranslateFreeListOfDifferenceSums( <G>, <N>, <difsums> )
##
InstallGlobalFunction( TranslateFreeListOfDifferenceSums, function (G, N, difsums)
    local v, w, prod, newdifsums, S, i, s, j;

    # make difsums a set of immutable elements so we can use binary search
    Apply(difsums, x->Immutable(x));
    difsums := Set(difsums);

    # handle special case of trivial input
    if Length(difsums) <= 1 then return difsums; fi;

    v := Size(G);
    w := Size(N);
    prod := ProductTable(G/N);
    newdifsums := []; # will store inequivalent difsums

    while Length(difsums) > 0 do

        # remove a difsum and add it to the equivalent-free list
        S := Remove(difsums);
        Add(newdifsums, S);

        # remove anything equivalent to S from difsums
        for i in [1..v/w] do
            s := EmptyPlist(v/w);
            for j in [1..v/w] do
                s[prod[i][j]] := S[j];
            od;
            RemoveSet(difsums, s);
        od;

    od;

    return newdifsums;
end );


#############################################################################
##
#E

