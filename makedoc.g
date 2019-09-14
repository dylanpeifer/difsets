#############################################################################
##
#W  makedoc.g                DifSets Package                     Dylan Peifer
##
##  Script to build the documentation of the DifSets package. Needs AutoDoc,
##  GAPDoc, and pdflatex.

if fail = LoadPackage("AutoDoc", ">= 2016.01.21") then
    Error("AutoDoc 2016.01.21 or newer is required");
fi;

AutoDoc( rec(
    gapdoc := rec( main := "difsets.xml" ),
    scaffold := rec( MainPage := false ),
));

#############################################################################
##
#E

