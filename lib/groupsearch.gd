#############################################################################
##
#W  groupsearch.gd           DifSets Package                     Dylan Peifer
##
##  Functions set up the algorithm and pass work off to the refining and
##  equivalent list functions for each stage.
##

#############################################################################
##
#F  RefiningSeries( <G> )
##
##  <#GAPDoc Label="RefiningSeries">
##  <ManSection>
##  <Func Name="RefiningSeries" Arg="G"/>
##
##  <Description>
##  Returns a normal series for group <A>G</A>. Current implementation
##  produces a chief series through a nontrivial normal subgroup of smallest
##  possible size in <A>G</A>.
##
##  <Example><![CDATA[
##  gap> G := SmallGroup(8, 3);;
##  gap> RefiningSeries(G);
##  [ <pc group of size 8 with 3 generators>, Group([ f2, f3 ]), Group([ f3 ]), 
##    Group([  ]) ]
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "RefiningSeries" );

#############################################################################
##
#F  PossibleDifferenceSetSizes( <G> )
##
##  <#GAPDoc Label="PossibleDifferenceSetSizes">
##  <ManSection>
##  <Func Name="PossibleDifferenceSetSizes" Arg="G"/>
##
##  <Description>
##  Returns a list of the possible sizes of difference sets in group
##  <A>G</A>. Only the smaller of any pair of complementary sizes is
##  returned, and the trivial size 1 is never included. Current
##  implementation simply returns all values of k such that k(k-1)/(v-1) is
##  an integer, where v is the order of <A>G</A>.
##
##  <Example><![CDATA[
##  gap> G := SmallGroup(31, 1);;
##  gap> PossibleDifferenceSetSizes(G);
##  [ 6, 10, 15 ]
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "PossibleDifferenceSetSizes" );

#############################################################################
##
#F  DifferenceSetsOfSizeK( <G>, <k> )
##
##  <#GAPDoc Label="DifferenceSetsOfSizeK">
##  <ManSection>
##  <Func Name="DifferenceSetsOfSizeK" Arg="G, k"/>
##
##  <Description>
##  Returns a list of all difference sets up to equivalence in the group
##  <A>G</A> that have size <A>k</A>.
##
##  <Example><![CDATA[
##  gap> G := SmallGroup(16, 9);;
##  gap> DifferenceSetsOfSizeK(G, 1);
##  [ [ 1 ] ]
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "DifferenceSetsOfSizeK" );

#############################################################################
##
#F  DifferenceSets( <G> )
##
##  <#GAPDoc Label="DifferenceSets">
##  <ManSection>
##  <Func Name="DifferenceSets" Arg="G"/>
##
##  <Description>
##  Returns a list of all difference sets up to equivalence in the group
##  <A>G</A>. Only the smaller of each complementary pair of difference sets
##  is included, and one-element difference sets are ignored.
##
##  <Example><![CDATA[
##  gap> G := SmallGroup(16, 9);;
##  gap> DifferenceSets(G);
##  [ [ 1, 2, 8, 10, 11, 15 ], [ 1, 2, 8, 9, 10, 11 ] ]
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "DifferenceSets" );

#############################################################################
##
#F  DifferenceSumsOfSizeK( <G>, <N>, <k> )
##
##  <#GAPDoc Label="DifferenceSumsOfSizeK">
##  <ManSection>
##  <Func Name="DifferenceSumsOfSizeK" Arg="G, N, k"/>
##
##  <Description>
##  Returns a list of all difference sums up to equivalence in the group
##  <A>G</A> mod its normal subgroup <A>N</A> that have size <A>k</A>.
##
##  <Example><![CDATA[
##  gap> G := SmallGroup(16, 8);;
##  gap> N := NormalSubgroups(G)[5];;
##  gap> DifferenceSumsOfSizeK(G, N, 1);
##  [ [ 1, 0, 0, 0 ] ]
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "DifferenceSumsOfSizeK" );

#############################################################################
##
#F  DifferenceSums( <G>, <N> )
##
##  <#GAPDoc Label="DifferenceSums">
##  <ManSection>
##  <Func Name="DifferenceSums" Arg="G, N"/>
##
##  <Description>
##  Returns a list of all difference sums up to equivalence in the group
##  <A>G</A> mod its normal subgroup <A>N</A>. Only the smaller of each
##  complementary pair of difference sums is included, and difference sums
##  of size 1 are ignored.
##
##  <Example><![CDATA[
##  gap> G := SmallGroup(16, 8);;
##  gap> N := NormalSubgroups(G)[5];;
##  gap> DifferenceSums(G, N);
##  [ [ 3, 1, 1, 1 ], [ 2, 2, 2, 0 ] ]
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "DifferenceSums" );

#############################################################################
##
#E

