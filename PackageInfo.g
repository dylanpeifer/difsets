#############################################################################
##
#W  PackageInfo.g            DifSets Package                     Dylan Peifer
##

SetPackageInfo( rec(
    PackageName := "DifSets",
    Subtitle := "an algorithm for enumerating all difference sets in a group",
    Version := "2.1.0",
    Date := "23/12/2017",
    Persons := [ rec(
            LastName := "Peifer",
            FirstNames := "Dylan",
            IsAuthor := true,
            IsMaintainer := true,
            Email := "djp282@cornell.edu",
            WWWHome := "http://www.math.cornell.edu/~djp282",
            Institution := "Cornell University"
            )
    ],
    Status := "other",
    PackageDoc := rec(
        BookName := "DifSets",
        SixFile := "doc/manual.six",
        Autoload := true
        ),
    Dependencies := rec(
        GAP := "4.8",
        NeededOtherPackages := [ ["GAPDoc", "1.5"],
                                 ["GRAPE", "4.7"] ],
        SuggestedOtherPackages := [ ]
        ),
    AvailabilityTest := ReturnTrue
    )
);

