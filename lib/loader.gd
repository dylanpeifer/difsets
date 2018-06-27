#############################################################################
##
#W  loader.gd                DifSets Package                     Dylan Peifer
##
##  Functions provide access to the precomputed difference sets in the data
##  directory.
##

#############################################################################
##
#F  CanLoadDifferenceSets( <v>, <n> )
##
##  <#GAPDoc Label="CanLoadDifferenceSets">
##  <ManSection>
##  <Func Name="CanLoadDifferenceSets" Arg="v, n"/>
##
##  <Description>
##  Returns true if a precomputed list of all difference sets up to
##  equivalence can be loaded from the package library for the group
##  <C>SmallGroup(<A>v</A>, <A>n</A>)</C>, and false otherwise.
##
##  <Example><![CDATA[
##  gap> CanLoadDifferenceSets(36, 9);
##  true
##  gap> CanLoadDifferenceSets(79, 1);
##  false
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "CanLoadDifferenceSets" );

#############################################################################
##
#F  LoadDifferenceSets( <v>, <n> )
##
##  <#GAPDoc Label="LoadDifferenceSets">
##  <ManSection>
##  <Func Name="LoadDifferenceSets" Arg="v, n"/>
##
##  <Description>
##  Returns the precomputed list of all difference sets up to equivalence
##  for the group <C>SmallGroup(<A>v</A>, <A>n</A>)</C> stored in the
##  package library. An error is thrown if no precomputed list is available.
##  Note that the listed difference sets are specific to
##  <C>SmallGroup(<A>v</A>, <A>n</A>)</C>, as &GAP; may label entries of
##  other isomorphic versions of the same group differently.
##
##  <Example><![CDATA[
##  gap> LoadDifferenceSets(15, 1);
##  [ [ 1, 2, 3, 4, 8, 11, 12 ] ]
##  gap> G := SmallGroup(15, 1);; H := AbelianGroup([15]);;
##  gap> IdGroup(G) = IdGroup(H);
##  true
##  gap> IsDifferenceSet(G, [1, 2, 3, 4, 8, 11, 12]);
##  true
##  gap> IsDifferenceSet(H, [1, 2, 3, 4, 8, 11, 12]);
##  false
##  ]]></Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "LoadDifferenceSets" );

#############################################################################
##
#E

