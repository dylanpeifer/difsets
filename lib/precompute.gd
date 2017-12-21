#############################################################################
##
#W  precompute.gd            DifSets Package                     Dylan Peifer
##
##  Functions compute group operations needed by other functions in the
##  package and store them in a table for quick access.
##

#############################################################################
##
#F  ProductTable( <G> )
##
##  <#GAPDoc Label="ProductTable">
##  <ManSection>
##  <Func Name="ProductTable" Arg="G"/>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "ProductTable" );

#############################################################################
##
#F  DifferenceTable( <G> )
##
##  <#GAPDoc Label="DifferenceTable">
##  <ManSection>
##  <Func Name="DifferenceTable" Arg="G"/>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "DifferenceTable" );

#############################################################################
##
#F  CosetsTable( <G> , <N> )
##
##  <#GAPDoc Label="CosetsTable">
##  <ManSection>
##  <Func Name="CosetsTable" Arg="G, N"/>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "CosetsTable" );

#############################################################################
##
#F  CosetsToCosetsTable( <G> , <N1>, <N2> )
##
##  <#GAPDoc Label="CosetsToCosetsTable">
##  <ManSection>
##  <Func Name="CosetsToCosetsTable" Arg="G, N1, N2"/>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "CosetsToCosetsTable" );

#############################################################################
##
#F  AutomorphismTable( <G>, <phi> )
##
##  <#GAPDoc Label="AutomorphismTable">
##  <ManSection>
##  <Func Name="AutomorphismTable" Arg="G, phi"/>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "AutomorphismTable" );

##############################################################################
##
#F  AutomorphismsTable( <G> )
##
##  <#GAPDoc Label="AutomorphismsTable">
##  <ManSection>
##  <Func Name="AutomorphismsTable" Arg="G"/>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "AutomorphismsTable" );

############################################################################
##
#F  InducedAutomorphismsTable( <G>, <N> )
##
##  <#GAPDoc Label="InducedAutomorphismsTable">
##  <ManSection>
##  <Func Name="InducedAutomorphismsTable" Arg="G, N"/>
##  </ManSection>
##  <#/GAPDoc>
DeclareGlobalFunction( "InducedAutomorphismsTable" );

#############################################################################
##
#E

