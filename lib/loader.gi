#############################################################################
##
#W  loader.gi                DifSets Package                     Dylan Peifer
##
##  Functions provide access to the precomputed difference sets in the data
##  directory.
##

#############################################################################
##
#F  CanLoadDifferenceSets( <v>, <cn> )
##
InstallGlobalFunction( CanLoadDifferenceSets, function (v, n)
    local path, src;

    path := DirectoriesPackageLibrary("DifSets")[1];
    src := Concatenation("../data/groups/", String(v), "/",
                         String(v), "-", String(n), ".txt");

    return IsExistingFile(Filename(path, src));
end );

#############################################################################
##
#F  LoadDifferenceSets( <v>, <cn> )
##
InstallGlobalFunction( LoadDifferenceSets, function (v, n)
    local path, src;

    path := DirectoriesPackageLibrary("DifSets")[1];
    src := Concatenation("../data/groups/", String(v), "/",
                         String(v), "-", String(n), ".txt");

    if IsExistingFile(Filename(path, src)) then
        return ReadAsFunction(Filename(path, src))();
    else
        ErrorNoReturn("no precomputed list of difference sets for group ",
                      [v, n], "\n");
    fi;
end );

#############################################################################
##
#E

