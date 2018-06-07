#############################################################################
##
#W  makedoc.g                DifSets Package                     Dylan Peifer
##
##  Script to build the documentation of the DifSets package. Needs GAPDoc
##  and pdflatex.

LoadPackage("GAPDoc");

path := Directory("doc");;
main := "difsets.xml";;
files := ["../lib/equivlist.gd", "../lib/groupsearch.gd", "../lib/loader.gd",
          "../lib/precompute.gd", "../lib/refine.gd", "../lib/smallest.gd",
          "../lib/tests.gd"];;
bookname := "DifSets";;
MakeGAPDocDoc(path, main, files, bookname, "MathJax");;
CopyHTMLStyleFiles("doc");;

#############################################################################
##
#E

