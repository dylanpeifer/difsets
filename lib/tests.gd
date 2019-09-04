#############################################################################
##
#W  tests.gd                 DifSets Package                     Dylan Peifer
##
##  Functions check if a set/sum is a difference set/sum and determine if two
##  sets/sums are equivalent.
##

#############################################################################
##
#F  IsDifferenceSet( <G>, <D> )
##
##  <#GAPDoc Label="IsDifferenceSet">
##  <ManSection>
##  <Func Name="IsDifferenceSet" Arg="G, D"/>
##
##  <Description>
##  Returns true if the set <A>D</A> is a difference set in the group
##  <A>G</A>, and false otherwise.
##
##  <Example><![CDATA[
##  gap> G := SmallGroup(16, 4);;
##  gap> IsDifferenceSet(G, [1, 2, 3, 4, 5, 6]);
##  false
##  gap> IsDifferenceSet(G, [1, 2, 8, 10, 11, 15]);
##  true
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "IsDifferenceSet" );

#############################################################################
##
#F  IsDifferenceSum( <G>, <N>, <S> )
##
##  <#GAPDoc Label="IsDifferenceSum">
##  <ManSection>
##  <Func Name="IsDifferenceSum" Arg="G, N, S"/>
##
##  <Description>
##  Returns true if the sum <A>S</A> is a difference sum in the group
##  <A>G</A> mod its normal subgroup <A>N</A>, and false otherwise.
##
##  <Example><![CDATA[
##  gap> G := SmallGroup(16, 4);;
##  gap> N := Subgroup(G, [G.1 * G.2 * G.3, G.3, G.4]);;
##  gap> IsDifferenceSum(G, N, [2, 4]);
##  true
##  gap> IsDifferenceSum(G, N, [1, 1]);
##  false
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "IsDifferenceSum" );

#############################################################################
##
#F  IsEquivalentDifferenceSet( <G>, <D1>, <D2> )
##
##  <#GAPDoc Label="IsEquivalentDifferenceSet">
##  <ManSection>
##  <Func Name="IsEquivalentDifferenceSet" Arg="G, D1, D2"/>
##
##  <Description>
##  Returns true if sets <A>D1</A> and <A>D2</A> are equivalent in the group
##  <A>G</A>, and false otherwise.
##
##  <Example><![CDATA[
##  gap> G := SmallGroup(16, 4);;
##  gap> IsEquivalentDifferenceSet(G, [1,5,8,9,10,14], [1,5,7,8,10,15]);
##  false
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "IsEquivalentDifferenceSet" );

#############################################################################
##
#F  IsEquivalentDifferenceSum( <G>, <N>, <S1>, <S2> )
##
##  <#GAPDoc Label="IsEquivalentDifferenceSum">
##  <ManSection>
##  <Func Name="IsEquivalentDifferenceSum" Arg="G, N, S1, S2"/>
##
##  <Description>
##  Returns true if sums <A>S1</A> and <A>S2</A> are equivalent in the group
##  <A>G</A> mod its normal subgroup <A>N</A>, and false otherwise.
##
##  <Example><![CDATA[
##  gap> G := SmallGroup(16, 4);;
##  gap> N := Subgroup(G, [G.1 * G.2 * G.3, G.3, G.4]);;
##  gap> IsEquivalentDifferenceSum(G, N, [2,4], [4,2]);
##  true
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "IsEquivalentDifferenceSum" );

#############################################################################
##
#E

