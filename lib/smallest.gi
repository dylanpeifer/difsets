#############################################################################
##
#W  smallest.gi              DifSets Package                     Dylan Peifer
##
##  Functions use `SmallestImageSet` from GRAPE package to find the
##  lexicographically smallest equivalent difference set to a given set.
##

#############################################################################
##
#F  SmallestEquivalentDifferenceSet( <G>, <D> )
##
InstallGlobalFunction( SmallestEquivalentDifferenceSet, function (G, D)
    local H, A, P;
                         
    # H is translation by group element, A is map by automorphism
    H := Image(RegularActionHomomorphism(G));
    A := Image(ActionHomomorphism(AutomorphismGroup(G), G));
    P := Group(Concatenation(GeneratorsOfGroup(H), GeneratorsOfGroup(A)));
    return SmallestImageSet(P, Set(D));
end );

#############################################################################
##
#F  SmallestEquivalentFreeListOfDifferenceSets( <G>, <difsets> )
##
InstallGlobalFunction( SmallestEquivalentFreeListOfDifferenceSets, function (G, difsets)
    local H, A, P;
                         
    # H is translation by group element, A is map by automorphism
    H := Image(RegularActionHomomorphism(G));
    A := Image(ActionHomomorphism(AutomorphismGroup(G), G));
    P := Group(Concatenation(GeneratorsOfGroup(H), GeneratorsOfGroup(A)));
    return Set(difsets, D -> SmallestImageSet(P, Set(D)));
end );

#############################################################################
##
#E

