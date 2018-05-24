#############################################################################
##
#W  testall.g                DifSets Package                     Dylan Peifer
##
##  Run tests in the `tst` directory of the DifSets package.
##

LoadPackage("DifSets");

TestDirectory(DirectoriesPackageLibrary("DifSets", "tst"),
  rec(exitGAP     := true,
      testOptions := rec(compareFunction := "uptowhitespace")));

FORCE_QUIT_GAP(1); # if we ever get here, there was an error
