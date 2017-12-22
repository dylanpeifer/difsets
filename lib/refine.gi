#############################################################################
##
#W  refine.gi                DifSets Package                     Dylan Peifer
##
##  Functions find all possible difference set/sum preimages of difference
##  sums.
##

#############################################################################
##
#F  AllRefineDifferenceSets( <G>, <N>, <difsums> )
##
InstallGlobalFunction( AllRefinedDifferenceSets, function (G, N, difsums)
    local v, k, lambda, dif, cosets, difsets, S, opts, opt, D;

    # handle special case of empty input
    if Length(difsums) = 0 then return []; fi;

    v := Size(G);
    k := Sum(difsums[1]); # assume all difsums have same k
    lambda := k*(k-1)/(v-1);
    dif := DifferenceTable(G);
    cosets := CosetsTable(G, N);

    difsets := []; # will store found difsets

    for S in difsums do

        # iterate through preimages D of S
        opts := List([1..Size(cosets)], x->Combinations(cosets[x], S[x]));
        for opt in IteratorOfCartesianProduct(opts) do
            D := Flat(opt);

            # if D is a difset then add it to list
            if IsDifferenceSetByTable(dif, D, v, lambda) then
                Add(difsets, D);
            fi;

        od;

    od;

    return difsets;
end );

#############################################################################
##
#F  NrAllRefinedSets( <G>, <N>, <difsums> )
##
InstallGlobalFunction( NrAllRefinedSets, function (G, N, difsums)
    return Sum(difsums, S->Product(S, x->Binomial(Size(N), x)));
end );

#############################################################################
##
#F  SomeRefinedDifferenceSets( <G>, <N>, <difsums> )
##
InstallGlobalFunction( SomeRefinedDifferenceSets, function (G, N, difsums)
    local v, k, lambda, dif, cosets, difsets, S, opts, opt, D;

    # handle special case of empty input
    if Length(difsums) = 0 then return []; fi;

    v := Size(G);
    k := Sum(difsums[1]); # assume all difsums have same k
    lambda := k*(k-1)/(v-1);
    dif := DifferenceTable(G);
    cosets := CosetsTable(G, N);

    difsets := []; # will store found difsets

    for S in difsums do

        # iterate through preimages D of S, forcing choice of identity
        opts := List([1..Size(cosets)], x->Combinations(cosets[x], S[x]));
        if S[1] > 0 then opts[1] := Filtered(opts[1], x->(1 in x)); fi;

        for opt in IteratorOfCartesianProduct(opts) do
            D := Flat(opt);

            # if D is a difset then add it to list
            if IsDifferenceSetByTable(dif, D, v, lambda) then
                Add(difsets, D);
            fi;

        od;

    od;

    return difsets;
end );

#############################################################################
##
#F  NrSomeRefinedSets( <G>, <N>, <difsums> )
##
InstallGlobalFunction( NrSomeRefinedSets, function (G, N, difsums)
    local f;

    f := function(S)
        if S[1] > 0 then
            return Binomial(Size(N)-1, S[1]-1)
                   * Product(S{[2..Length(S)]}, x->Binomial(Size(N), x));
        else
            return Product(S, x->Binomial(Size(N), x));
        fi;
    end;

    return Sum(difsums, S->f(S));
end );

#############################################################################
##
#F  IsDifferenceSetByTable( <table>, <D>, <v>, <lambda> )
##
InstallGlobalFunction( IsDifferenceSetByTable, function (table, D, v, lambda)
    # method is identical to IsDifferenceSet but uses precomputed values
    local count, i, j, index;

    count := List([1..v], x->0);

    for i in D do
    for j in D do

        index := table[i][j];
        count[index] := count[index] + 1;

        if not index = 1 and count[index] > lambda then
            return false;
        fi;

    od;
    od;

    return true;
end );

#############################################################################
##
#F  AllRefinedDifferenceSums( <G>, <N1>, <N2>, <difsums> )
##
InstallGlobalFunction( AllRefinedDifferenceSums, function (G, N1, N2, difsums)
    local v, k, lambda, dif, cosets, w2, u1, u2, u3, id, nonid, newdifsums, S, opts, opt, perms, perm, s;

    # handle special case of empty input
    if Length(difsums) = 0 then return []; fi;

    v := Size(G);
    k := Sum(difsums[1]); # assume all difsums have same k
    lambda := k*(k-1)/(v-1);
    dif := DifferenceTable(G/N2);
    cosets := CosetsToCosetsTable(G, N1, N2);

    # compute some numbers for function calls below
    w2 := Size(N2);
    u1 := Size(G/N1);
    u2 := Size(G/N2);
    u3 := Size(N1/N2);
    id := lambda*Size(N2) + k - lambda;
    nonid := lambda*Size(N2);
 
    newdifsums := []; # will store found difsums

    for S in difsums do

        # iterate through all partitions of S into new cosets
        opts := DifferenceSumPreImagesOptions(u3, w2,  S);
        for opt in IteratorOfCartesianProduct(opts) do

            # testing identity coeff can be done before permutations
            if not Sum(Flat(opt), x->x^2) = id then
                continue;
            fi;

            # iterate through all permutations of this partition
            perms := DifferenceSumPreImagesPermutations(opt);
            for perm in IteratorOfCartesianProduct(perms) do

                # if difference sum is found then add to list
                s := DifferenceSumPreImagesTranslate(cosets, u1, u2, u3, perm);
                if IsDifferenceSumByTable(dif, s, u2, nonid) then
                    Add(newdifsums, s);
                fi;

            od;

        od;

    od;

    return newdifsums;
end );

#############################################################################
##
#F  NrAllRefinedSums( <G>, <N1>, <N2>, <difsums> )
##
InstallGlobalFunction( NrAllRefinedSums, function (G, N1, N2, difsums)
    local v, k, lambda, total, S, opts, opt, perms;

    if Length(difsums) = 0 then return 0; fi;

    v := Size(G);
    k := Sum(difsums[1]);
    lambda := k*(k-1)/(v-1);

    total := 0;
    for S in difsums do
        opts := DifferenceSumPreImagesOptions(Size(N1/N2), Size(N2), S);

        for opt in IteratorOfCartesianProduct(opts) do
            if not Sum(Flat(opt), x->x^2) = lambda*Size(N2)+k-lambda then
                continue;
            fi;

            perms := DifferenceSumPreImagesPermutations(opt);
            total := total + Product(perms, x->Length(x));

        od;

    od;

    return total;
end );

#############################################################################
##
#F  SomeRefinedDifferenceSums( <G>, <N1>, <N2>, <difsums> )
##
InstallGlobalFunction( SomeRefinedDifferenceSums, function (G, N1, N2, difsums)
    local v, k, lambda, dif, cosets, w2, u1, u2, u3, id, nonid, newdifsums, S, opts, opt, perms, perm, s;

    # handle special case of empty input
    if Length(difsums) = 0 then return []; fi;

    v := Size(G);
    k := Sum(difsums[1]); # assume all difsums have same k
    lambda := k*(k-1)/(v-1);
    dif := DifferenceTable(G/N2);
    cosets := CosetsToCosetsTable(G, N1, N2);

    # compute some numbers for function calls below
    w2 := Size(N2);
    u1 := Size(G/N1);
    u2 := Size(G/N2);
    u3 := Size(N1/N2);
    id := lambda*Size(N2) + k - lambda;
    nonid := lambda*Size(N2);
 
    newdifsums := []; # will store found difsums

    for S in difsums do

        # iterate through all partitions of S into new cosets
        opts := DifferenceSumPreImagesOptions(u3, w2,  S);
        for opt in IteratorOfCartesianProduct(opts) do

            # testing identity coeff can be done before permutations
            if not Sum(Flat(opt), x->x^2) = id then
                continue;
            fi;

            # iterate through all permutations of this partition
            perms := DifferenceSumPreImagesPermutationsForced(opt);
            for perm in IteratorOfCartesianProduct(perms) do

                # if difference sum is found then add to list
                s := DifferenceSumPreImagesTranslate(cosets, u1, u2, u3, perm);
                if IsDifferenceSumByTable(dif, s, u2, nonid) then
                    Add(newdifsums, s);
                fi;

            od;

        od;

    od;

    return newdifsums;
end );

#############################################################################
##
#F  NrSomeRefinedSums( <G>, <N1>, <N2>, <difsums> )
##
InstallGlobalFunction( NrSomeRefinedSums, function (G, N1, N2, difsums)
    local v, k, lambda, total, S, opts, opt, perms;

    if Length(difsums) = 0 then return 0; fi;

    v := Size(G);
    k := Sum(difsums[1]);
    lambda := k*(k-1)/(v-1);

    total := 0;
    for S in difsums do
        opts := DifferenceSumPreImagesOptions(Size(N1/N2), Size(N2), S);

        for opt in IteratorOfCartesianProduct(opts) do
            if not Sum(Flat(opt), x->x^2) = lambda*Size(N2)+k-lambda then
                continue;
            fi;

            perms := DifferenceSumPreImagesPermutationsForced(opt);
            total := total + Product(perms, x->Length(x));

        od;

    od;

    return total;
end );

#############################################################################
##
#F  DifferenceSumPreImagesOptions( <u>, <w>, <S> )
##
InstallGlobalFunction( DifferenceSumPreImagesOptions, function (u, w, S)
    local opts, i, parts;

    opts := [1..Length(S)];
    for i in [1..Length(S)] do
        # partition the large coset coeff into the new small coset coeffs
        # adjust call to RestrictedPartitions since it won't use 0 as a summand
        parts := RestrictedPartitions(S[i]+u, [1..w+1], u);
        parts := List(parts, x->List(x, y->y-1));
        opts[i] := parts;
    od;

    return opts;
end );

#############################################################################
##
#F  DifferenceSumPreImagesPermutations( <opt> )
##
InstallGlobalFunction( DifferenceSumPreImagesPermutations, function (opt)
    local perms;

    perms := List(opt, x->PermutationsList(x));

    return perms;
end ); 

#############################################################################
##
#F  DifferenceSumPreImagesPermutationsForced( <opt> )
##
InstallGlobalFunction( DifferenceSumPreImagesPermutationsForced, function (opt)
    local perms;

    perms := List(opt, x->PermutationsList(x));

    # if the trivial coset contains anything we can force pick 1
    if Sum(perms[1][1]) > 0 then
        perms[1] := Filtered(perms[1], x->(x[1] > 0));
    fi;

    return perms;
end ); 

#############################################################################
##
#F  DifferenceSumPreImagesTranslate( <cosets>, <u1>, <u2>, <u3>, <perm> )
##
InstallGlobalFunction( DifferenceSumPreImagesTranslate, function (cosets, u1, u2, u3, perm)
    local S, i, j;

    # map the small coset values from the permutation to the appropriate
    # places in the list representing the new potential difference sum
    S := List([1..u2]);
    for i in [1..u1] do
    for j in [1..u3] do
        S[cosets[i][j]] := perm[i][j];
    od;
    od;

    return S;
end );
 
#############################################################################
##
#F  IsDifferenceSumByTable( <table>, <S>, <v>, <k>, <lambda>, <w> )
##
InstallGlobalFunction( IsDifferenceSumByTable, function (table, S, u, nonid)
    # method is identical to IsDifferenceSum but uses precomputed values
    local i, j, index, count;

    count := List([1..u], x->0);

    for i in [1..u] do
    for j in [1..u] do

        index := table[i][j];
        count[index] := count[index] + S[i]*S[j];

        if not index = 1 and count[index] > nonid then
            return false;
        fi;

    od;
    od;

    return true;
end );

#############################################################################
##
#E

