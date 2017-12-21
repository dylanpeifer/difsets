#############################################################################
##
#W  precompute.gi            DifSets Package                     Dylan Peifer
##
##  Functions compute group operations needed by other functions in the
##  package and store them in a table for quick access.
##

#############################################################################
##
#F  ProductTable( <G> )
##
InstallGlobalFunction( ProductTable, function (G)
    local v, e, table, i, j;

    v := Size(G);
    e := Elements(G);
    table := NullMat(v, v); # will store products

    for i in [1..v] do
    for j in [1..v] do

        table[i][j] := Position(e, e[i]*e[j]);

    od;
    od;

    return table;
end );

#############################################################################
##
#F  DifferenceTable( <G> )
##
InstallGlobalFunction( DifferenceTable, function (G)
    local v, e, table, i, j;

    v := Size(G);
    e := Elements(G);
    table := NullMat(v,v); # will store differences

    for i in [1..v] do
    for j in [1..v] do

        table[i][j] := Position(e, e[i]*e[j]^(-1));

    od;
    od;

    return table;
end );

#############################################################################
##
#F  CosetsTable( <G>, <N> )
##
InstallGlobalFunction( CosetsTable, function (G, N)
    local v, w, theta, eg, eh, cosets, i;

    v := Size(G);
    w := Size(N);
    theta := NaturalHomomorphismByNormalSubgroup(G, N);
    eg := Elements(G);
    eh := Elements(Image(theta));
    cosets := List([1..v/w], x->[]); # will store cosets of G/N

    for i in [1..v] do
        Add(cosets[Position(eh, eg[i]^theta)], i);
    od;

    return cosets;
end );

#############################################################################
##
#F  CosetsToCosetsTable( <G>, <N1>, <N2> )
##
InstallGlobalFunction( CosetsToCosetsTable, function (G, N1, N2)
    local v, w1, w2, theta1, theta2, eh1, eh2, cosets, i, coset;

    v := Size(G);
    w1 := Size(N1);
    w2 := Size(N2);
    theta1 := NaturalHomomorphismByNormalSubgroup(G, N1);
    theta2 := NaturalHomomorphismByNormalSubgroup(G, N2);
    eh1 := Elements(Image(theta1));
    eh2 := Elements(Image(theta2));
    cosets := List([1..v/w1], x->[]); # will store cosets of G/N1

    for i in [1..v/w2] do
        # find which coset in G/N1 each element of G/N2 is in
        coset := PreImagesRepresentative(theta2, eh2[i])^theta1;
        Add(cosets[Position(eh1, coset)], i);
    od;

    return cosets;
end );
 
#############################################################################
##
#F  AutomorphismTable( <G>, <phi> )
##
InstallGlobalFunction( AutomorphismTable, function (G, phi)
    local v, e;

    v := Size(G);
    e := Elements(G);

    return List([1..v], x->Position(e, e[x]^phi));
end );

#############################################################################
##
#F  AutomorphismsTable( <G> )
##
InstallGlobalFunction( AutomorphismsTable, function (G)
    local v, e, table, phi;

    v := Size(G);
    e := Elements(G);
    table := []; # will store all automorphisms

    for phi in AutomorphismGroup(G) do
        Add(table, List([1..v], x->Position(e, e[x]^phi)));
    od;

    return table;
end );

#############################################################################
##
#F  InducedAutomorphismsTable( <G>, <N> )
##
InstallGlobalFunction( InducedAutomorphismsTable, function (G, N)
    local v, w, theta, e, table, phi, rho, aut;

    # quotients of elementary abelian groups have all automorphisms induced
    if IsElementaryAbelian(G) then return AutomorphismsTable(G/N); fi;

    v := Size(G);
    w := Size(N);
    theta := NaturalHomomorphismByNormalSubgroup(G, N);
    e := Elements(Image(theta));
    table := Set([]); # will store all induced automorphisms

    for phi in AutomorphismGroup(G) do
        if Image(phi, N) = N then
            rho := InducedAutomorphism(theta, phi);
            aut := Immutable(List([1..v/w], x->Position(e, e[x]^rho)));
            AddSet(table, aut);
        fi;
    od;

    return table;
end );

#############################################################################
##
#E

