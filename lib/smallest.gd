#############################################################################
##
#W  smallest.gd              DifSets Package                     Dylan Peifer
##
##  Functions use `SmallestImageSet` from GRAPE package to find the
##  lexicographically smallest equivalent difference set to a given set.
##

#############################################################################
##
#F  SmallestEquivalentDifferenceSet( <G>, <D> )
##
##  <#GAPDoc Label="SmallestEquivalentDifferenceSet">
##  <ManSection>
##  <Func Name="SmallestEquivalentDifferenceSet" Arg="G, D"/>
##
##  <Description>
##  Returns the set that is lexicographically smallest among all sets that
##  are equivalent to the difference set <A>D</A> in the group <A>G</A>.
##
##  <Example><![CDATA[
##  gap> G := SmallGroup(16, 4);;
##  gap> SmallestEquivalentDifferenceSet(G, [8,9,12,13,14,15]);
##  [ 1, 2, 3, 4, 8, 15 ]
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "SmallestEquivalentDifferenceSet" );

#############################################################################
##
#F  SmallestEquivalentFreeListOfDifferenceSets( <G>, <difsets> )
##
##  <#GAPDoc Label="SmallestEquivalentFreeListOfDifferenceSets">
##  <ManSection>
##  <Func Name="SmallestEquivalentFreeListOfDifferenceSets" Arg="G, difsets"/>
##
##  <Description>
##  Returns a list containing the lexicographically smallest set for each set
##  in the list of difference sets <A>difsets</A> in the group <A>G</A>.
##  Duplicates are removed, so the returned list contains exactly one
##  representative from each equivalence class found in <A>difsets</A>.
##
##  <Example><![CDATA[
##  gap> G := SmallGroup(16, 4);;
##  gap> sets := [[8,9,12,13,14,15], [7,8,9,13,15,16], [1,7,10,11,14,15]];;
##  gap> SmallestEquivalentFreeListOfDifferenceSets(G, sets);
##  [ [ 1, 2, 3, 4, 8, 15 ] ]
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "SmallestEquivalentFreeListOfDifferenceSets" );

#############################################################################
##
#E

