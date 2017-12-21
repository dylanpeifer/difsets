#############################################################################
##
#W  tests.gi                 DifSets Package                     Dylan Peifer
##
##  Functions check if a set/sum is a difference set/sum and determine if two
##  sets/sums are equivalent.
##

#############################################################################
##
#F  IsDifferenceSet( <G>, <D> )
##
InstallGlobalFunction( IsDifferenceSet, function (G, D)
    local v, k, lambda, e, count, i, j, index;

    v := Size(G);
    k := Length(D);
    lambda := k*(k-1)/(v-1);

    e := Elements(G);
    count := List([1..v], x->0); # times each group element is a difference

    for i in D do
    for j in D do

        # compute the element given by this difference and add to count
        index := Position(e, e[i]*e[j]^(-1));
        count[index] := count[index] + 1;

        # if a nonidentity element exceeds lambda then D cannot be a difset
        if not index = 1 and count[index] > lambda then
            return false;
        fi;

    od;
    od;

    # if counts of nonidentities never exceed lambda they must be lambda
    return true;
end );

#############################################################################
##
#F  IsDifferenceSum( <G>, <N>, <S> )
##
InstallGlobalFunction( IsDifferenceSum, function (G, N, S)
    local v, k, lambda, w, e, count, i, j, index;

    v := Size(G);
    k := Sum(S);
    lambda := k*(k-1)/(v-1);
    w := Size(N);

    # first test based on differences giving the identity
    if not Sum(S,x->x^2) = lambda*w + k - lambda then
        return false;
    fi;

    # then test all other elements
    e := Elements(G/N);
    count := List([1..v/w], x->0);

    for i in [1..v/w] do
    for j in [1..v/w] do

        # compute the element given by this difference and add coeff to count
        index := Position(e, e[i]*e[j]^(-1));
        count[index] := count[index] + S[i]*S[j];

        # if a nonidentity element exceeds lambda*w then S cannot be a difsum
        if not index = 1 and count[index] > lambda*w then
            return false;
        fi;

    od;
    od;

    # if counts of nonidentities never exceed lambda*w they must be lambda*w
    return true;
end );

#############################################################################
##
#F  IsEquivalentDifferenceSet( <G>, <D1>, <D2> )
##
InstallGlobalFunction( IsEquivalentDifferenceSet, function (G, D1, D2)
    local v, prod, phi, aut, i, D;

    v := Size(G);
    prod := ProductTable(G);

    # iterate over all automorphisms
    for phi in AutomorphismGroup(G) do
        aut := AutomorphismTable(G, phi);

        # iterate over all group elements
        for i in [1..v] do

            # map D2 to g * phi(D2) and check if equal to D1
            D := List(D2, x->prod[i][aut[x]]);
            if IsEqualSet(D1, D) then
                return true;
            fi;

        od;

    od;

    # no equivalence was found
    return false;
end );

#############################################################################
##
#F  IsEquivalentDifferenceSum( <G>, <N>, <S1>, <S2> )
##
InstallGlobalFunction( IsEquivalentDifferenceSum, function (G, N, S1, S2)
    local v, w, theta, H, prod, phi, aut, i, S, j;

    v := Size(G);
    w := Size(N);
    theta := NaturalHomomorphismByNormalSubgroup(G, N);
    H := Image(theta);
    prod := ProductTable(H);
 
    # iterate over all induced automorphisms
    for phi in AutomorphismGroup(G) do
        if Image(phi, N) = N then
            aut := AutomorphismTable(H, InducedAutomorphism(theta, phi));

            # iterate over all group elements
            for i in [1..v/w] do

                # map S2 to g * aut(S2) and check if equal to S1
                S := List([1..v/w]);
                for j in [1..v/w] do
                    S[prod[i][aut[j]]] := S2[j];
                od;

                if S1 = S then
                    return true;
                fi;

            od;

        fi;
    od;

    # no equivalence was found
    return false;
end );

#############################################################################
##
#E

