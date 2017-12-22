#############################################################################
##
#W  refine.gd                DifSets Package                     Dylan Peifer
##
##  Functions find all possible difference set/sum preimages of difference
##  sums.
##

#############################################################################
##
#F  AllRefinedDifferenceSets( <G>, <N>, <difsums> )
##
##  <#GAPDoc Label="AllRefinedDifferenceSets">
##  <ManSection>
##  <Func Name="AllRefinedDifferenceSets" Arg="G, N, difsums"/>
##
##  <Description>
##  Returns a list of all difference sets that are preimages of difference
##  sums contained in the list <A>difsums</A> of difference sums in group
##  <A>G</A> mod its normal subgroup <A>N</A>. Difference sums in
##  <A>difsums</A> are all assumed to be the same size.
##
##  <Example><![CDATA[
##  gap> G := SmallGroup(16, 5);;
##  gap> N := NormalSubgroups(G)[5];;
##  gap> AllRefinedDifferenceSets(G, N, [[3,1,1,1], [2,2,2,0]]);
##  [ [ 1, 3, 2, 8, 4, 15 ], [ 1, 3, 2, 8, 9, 11 ], [ 1, 3, 2, 13, 4, 11 ], 
##    [ 1, 3, 2, 13, 9, 15 ], [ 1, 3, 6, 8, 4, 11 ], [ 1, 3, 6, 8, 9, 15 ], 
##    [ 1, 3, 6, 13, 4, 15 ], [ 1, 3, 6, 13, 9, 11 ], [ 1, 5, 2, 6, 4, 15 ], 
##    [ 1, 5, 2, 6, 9, 11 ], [ 1, 5, 2, 13, 4, 9 ], [ 1, 5, 2, 13, 11, 15 ], 
##    [ 1, 5, 6, 8, 4, 9 ], [ 1, 5, 6, 8, 11, 15 ], [ 1, 5, 8, 13, 4, 15 ], 
##    [ 1, 5, 8, 13, 9, 11 ], [ 1, 10, 2, 6, 4, 11 ], [ 1, 10, 2, 6, 9, 15 ], 
##    [ 1, 10, 2, 8, 4, 9 ], [ 1, 10, 2, 8, 11, 15 ], [ 1, 10, 6, 13, 4, 9 ], 
##    [ 1, 10, 6, 13, 11, 15 ], [ 1, 10, 8, 13, 4, 11 ], [ 1, 10, 8, 13, 9, 15 ], 
##    [ 3, 5, 2, 6, 4, 11 ], [ 3, 5, 2, 6, 9, 15 ], [ 3, 5, 2, 8, 4, 9 ], 
##    [ 3, 5, 2, 8, 11, 15 ], [ 3, 5, 6, 13, 4, 9 ], [ 3, 5, 6, 13, 11, 15 ], 
##    [ 3, 5, 8, 13, 4, 11 ], [ 3, 5, 8, 13, 9, 15 ], [ 3, 10, 2, 6, 4, 15 ], 
##    [ 3, 10, 2, 6, 9, 11 ], [ 3, 10, 2, 13, 4, 9 ], [ 3, 10, 2, 13, 11, 15 ], 
##    [ 3, 10, 6, 8, 4, 9 ], [ 3, 10, 6, 8, 11, 15 ], [ 3, 10, 8, 13, 4, 15 ], 
##    [ 3, 10, 8, 13, 9, 11 ], [ 5, 10, 2, 8, 4, 15 ], [ 5, 10, 2, 8, 9, 11 ], 
##    [ 5, 10, 2, 13, 4, 11 ], [ 5, 10, 2, 13, 9, 15 ], [ 5, 10, 6, 8, 4, 11 ], 
##    [ 5, 10, 6, 8, 9, 15 ], [ 5, 10, 6, 13, 4, 15 ], [ 5, 10, 6, 13, 9, 11 ] ]
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "AllRefinedDifferenceSets" );

#############################################################################
##
#F  SomeRefinedDifferenceSets( <G>, <N>, <difsums> )
##
##  <#GAPDoc Label="SomeRefinedDifferenceSets">
##  <ManSection>
##  <Func Name="SomeRefinedDifferenceSets" Arg="G, N, difsums"/>
##
##  <Description>
##  Returns a list of some difference sets that are preimages of difference
##  sums contained in the list <A>difsums</A> of difference sums in group
##  <A>G</A> mod its normal subgroup <A>N</A>. At least one member of each
##  equivalence class that would appear in the set of all preimages will be
##  returned, but all preimage difference sets may not appear. Difference
##  sums in <A>difsums</A> are all assumed to be the same size. Current
##  implementation forces the choice of an identity element when possible.
##
##  <Example><![CDATA[
##  gap> G := SmallGroup(16, 5);;
##  gap> N := NormalSubgroups(G)[5];;
##  gap> RefineDifferenceSumsToSets(G, N, [[3,1,1,1], [2,2,2,0]]);
##  [ [ 1, 3, 2, 8, 4, 15 ], [ 1, 3, 2, 8, 9, 11 ], [ 1, 3, 2, 13, 4, 11 ], 
##    [ 1, 3, 2, 13, 9, 15 ], [ 1, 3, 6, 8, 4, 11 ], [ 1, 3, 6, 8, 9, 15 ], 
##    [ 1, 3, 6, 13, 4, 15 ], [ 1, 3, 6, 13, 9, 11 ], [ 1, 5, 2, 6, 4, 15 ], 
##    [ 1, 5, 2, 6, 9, 11 ], [ 1, 5, 2, 13, 4, 9 ], [ 1, 5, 2, 13, 11, 15 ], 
##    [ 1, 5, 6, 8, 4, 9 ], [ 1, 5, 6, 8, 11, 15 ], [ 1, 5, 8, 13, 4, 15 ], 
##    [ 1, 5, 8, 13, 9, 11 ], [ 1, 10, 2, 6, 4, 11 ], [ 1, 10, 2, 6, 9, 15 ], 
##    [ 1, 10, 2, 8, 4, 9 ], [ 1, 10, 2, 8, 11, 15 ], [ 1, 10, 6, 13, 4, 9 ], 
##    [ 1, 10, 6, 13, 11, 15 ], [ 1, 10, 8, 13, 4, 11 ], [ 1, 10, 8, 13, 9, 15 ] ] 
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "SomeRefinedDifferenceSets" );

#############################################################################
##
#F  IsDifferenceSetByTable( <table>, <D>, <v>, <lambda> )
##
##  <#GAPDoc Label="IsDifferenceSetByTable">
##  <ManSection>
##  <Func Name="IsDifferenceSetByTable" Arg="table, D, v, lambda"/>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "IsDifferenceSetByTable" );

#############################################################################
##
#F  AllRefinedDifferenceSums( <G>, <N1>, <N2>, <difsums> )
##
##  <#GAPDoc Label="AllRefinedDifferenceSums">
##  <ManSection>
##  <Func Name="AllRefinedDifferenceSums" Arg="G, N1, N2, difsums"/>
##
##  <Description>
##  Returns a list of all difference sums in group <A>G</A> mod its normal
##  subgroup <A>N2</A> that are preimages of difference sums contained in the
##  list <A>difsums</A> of difference sums in group <A>G</A> mod its normal 
##  subgroup <A>N1</A>. The subgroup <A>N2</A> must be contained in <A>N1</A>.
##  Difference sums in <A>difsums</A> are all assumed to be the same size.
##
##  <Example><![CDATA[
##  gap> G := SmallGroup(16, 5);;
##  gap> N1 := NormalSubgroups(G)[5];;
##  gap> N2 := NormalSubgroups(G)[8];;
##  gap> AllRefinedDifferenceSums(G, N1, N2, [[3,1,1,1], [2,2,2,0]]);
##  [ [ 1, 1, 0, 1, 0, 1, 2, 0 ], [ 1, 1, 2, 1, 0, 1, 0, 0 ], 
##    [ 1, 0, 1, 1, 0, 2, 1, 0 ], [ 1, 2, 1, 1, 0, 0, 1, 0 ], 
##    [ 0, 1, 1, 2, 0, 1, 1, 0 ], [ 2, 1, 1, 0, 0, 1, 1, 0 ] ]
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "AllRefinedDifferenceSums" );

#############################################################################
##
#F  SomeRefinedDifferenceSums( <G>, <N1>, <N2>, <difsums> )
##
##  <#GAPDoc Label="SomeRefinedDifferenceSums">
##  <ManSection>
##  <Func Name="SomeRefinedDifferenceSums" Arg="G, N1, N2, difsums"/>
##
##  <Description>
##  Returns a list of some difference sums in group <A>G</A> mod its normal
##  subgroup <A>N2</A> that are preimages of difference sums contained in
##  the list <A>difsums</A> of difference sums in group <A>G</A> mod its
##  normal subgroup <A>N1</A>. At least one member of each equivalence class
##  that would appear in the set of all preimages will be returned, but all
##  preimage difference sums may not appear. The subgroup <A>N2</A> must be
##  contained in <A>N1</A> and difference sums in <A>difsums</A> are all
##  assumed to be the same size. Current implementation forces a choice
##  of nonzero identity coefficient when possible.
##
##  <Example><![CDATA[
##  gap> G := SmallGroup(16, 5);;
##  gap> N1 := NormalSubgroups(G)[5];;
##  gap> N2 := NormalSubgroups(G)[8];;
##  gap> SomeRefinedDifferenceSums(G, N1, N2, [[3,1,1,1], [2,2,2,0]]);
##  [ [ 1, 1, 0, 1, 0, 1, 2, 0 ], [ 1, 1, 2, 1, 0, 1, 0, 0 ], 
##    [ 1, 0, 1, 1, 0, 2, 1, 0 ], [ 1, 2, 1, 1, 0, 0, 1, 0 ], 
##    [ 2, 1, 1, 0, 0, 1, 1, 0 ] ]
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "SomeRefinedDifferenceSums" );

#############################################################################
##
#F  DifferenceSumPreImagesOptions( <u>, <w>, <S> )
##
##  <#GAPDoc Label="DifferenceSumPreImagesOptions">
##  <ManSection>
##  <Func Name="DifferenceSumPreImagesOptions" Arg="u, w, S"/>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "DifferenceSumPreImagesOptions" );

#############################################################################
##
#F  DifferenceSumPreImagesPermutations( <opt> )
##
##  <#GAPDoc Label="DifferenceSumPreImagesPermutations">
##  <ManSection>
##  <Func Name="DifferenceSumPreImagesPermutations" Arg="opt"/>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "DifferenceSumPreImagesPermutations" );

#############################################################################
##
#F  DifferenceSumPreImagesPermutationsForced( <opt> )
##
##  <#GAPDoc Label="DifferenceSumPreImagesPermutationsForced">
##  <ManSection>
##  <Func Name="DifferenceSumPreImagesPermutationsForced" Arg="opt"/>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "DifferenceSumPreImagesPermutationsForced" );

#############################################################################
##
#F  DifferenceSumPreImagesTranslate( <cosets>, <u1>, <u2>, <u3>, <perm> )
##
##  <#GAPDoc Label="DifferenceSumPreImagesTranslate">
##  <ManSection>
##  <Func Name="DifferenceSumPreImagesTranslate" Arg="cosets, u1, u2, u3, perm"/>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "DifferenceSumPreImagesTranslate" );

#############################################################################
##
#F  IsDifferenceSumByTable( <table>, <S>, <v>, <k>, <lambda>, <w> )
##
##  <#GAPDoc Label="IsDifferenceSumByTable">
##  <ManSection>
##  <Func Name="IsDifferenceSumByTable" Arg="table, S, v, k, lambda, w"/>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "IsDifferenceSumByTable" );

#############################################################################
##
#E
