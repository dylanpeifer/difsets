#############################################################################
##
#W  equivlist.gd             DifSets Package                     Dylan Peifer
##
##  Functions take in a list of difference sets/sums and return a list with
##  equivalent sets/sums removed.
##

#############################################################################
##
#F  EquivalentFreeListOfDifferenceSets( <G>, <difsets> )
##
##  <#GAPDoc Label="EquivalentFreeListOfDifferenceSets">
##  <ManSection>
##  <Func Name="EquivalentFreeListOfDifferenceSets" Arg="G, difsets"/>
##
##  <Description>
##  Returns a list of inequivalent difference sets in the group <A>G</A> that
##  consists of one representative from each equivalence class found in the
##  list <A>difsets</A> of arbitrary difference sets in <A>G</A>.
##
##  <Example><![CDATA[
##  gap> G := SmallGroup(16, 4);;
##  gap> sets := [[8,9,12,13,14,15], [7,8,9,13,15,16], [1,7,10,11,14,15]];;
##  gap> EquivalentFreeListOfDifferenceSets(G, sets);
##  [ [ 8, 9, 12, 13, 14, 15 ] ]
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "EquivalentFreeListOfDifferenceSets" );

#############################################################################
##
#F  TranslateFreeListOfDifferenceSets( <G>, <difsets> )
##
##  <#GAPDoc Label="TranslateFreeListOfDifferenceSets">
##  <ManSection>
##  <Func Name="TranslateFreeListOfDifferenceSets" Arg="G, difsets"/>
##
##  <Description>
##  Returns a list of translationally inequivalent difference sets in the
##  group <A>G</A> that consists of one representative from each
##  translational equivalence class found in the list <A>difsets</A> of
##  arbitrary difference sets in <A>G</A>.
##
##  <Example><![CDATA[
##  gap> G := SmallGroup(16, 4);;
##  gap> sets := [[8,9,12,13,14,15], [7,8,9,13,15,16], [1,7,10,11,14,15]];;
##  gap> TranslateFreeListOfDifferenceSets(G, sets);
##  [ [ 8, 9, 12, 13, 14, 15 ], [ 7, 8, 9, 13, 15, 16 ] ]
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "TranslateFreeListOfDifferenceSets" );

#############################################################################
##
#F  EquivalentFreeListOfDifferenceSums( <G>, <N>, <difsums> )
##
##  <#GAPDoc Label="EquivalentFreeListOfDifferenceSums">
##  <ManSection>
##  <Func Name="EquivalentFreeListOfDifferenceSums" Arg="G, N, difsums"/>
##
##  <Description>
##  Returns a list of inequivalent difference sums in the group <A>G</A>
##  mod its normal subgroup <A>N</A> that consists of one representative from
##  each equivalence class found in the list <A>difsums</A> of arbitrary
##  difference sums in <A>G</A> mod <A>N</A>.
##
##  <Example><![CDATA[
##  gap> G := SmallGroup(16, 4);;
##  gap> N := Subgroup(G, [G.1 * G.2 * G.3, G.3, G.4]);;
##  gap> EquivalentFreeListOfDifferenceSums(G, N, [[4,2], [2,4]]);
##  [ [ 4, 2 ] ]
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "EquivalentFreeListOfDifferenceSums" );

#############################################################################
##
#F  TranslateFreeListOfDifferenceSums( <G>, <N>, <difsums> )
##
##  <#GAPDoc Label="TranslateFreeListOfDifferenceSums">
##  <ManSection>
##  <Func Name="TranslateFreeListOfDifferenceSums" Arg="G, N, difsums"/>
##
##  <Description>
##  Returns a list of translationally inequivalent difference sums in the
##  group <A>G</A> mod its normal subgroup <A>N</A> that consists of one
##  representative from each translational equivalence class found in the
##  list <A>difsums</A> of arbitrary difference sums in <A>G</A> mod
##  <A>N</A>.
##
##  <Example><![CDATA[
##  gap> G := SmallGroup(16, 4);;
##  gap> N := Subgroup(G, [G.1 * G.2 * G.3, G.3, G.4]);;
##  gap> TranslateFreeListOfDifferenceSums(G, N, [[4,2], [2,4]]);
##  [ [ 4, 2 ] ]
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "TranslateFreeListOfDifferenceSums" );

#############################################################################
##
#E

