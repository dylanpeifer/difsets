#############################################################################
##
#W  PackageInfo.g            DifSets Package                     Dylan Peifer
##

SetPackageInfo( rec(
    PackageName := "DifSets",
    Subtitle := "an algorithm for enumerating all difference sets in a group",
    Version := "2.0.0",
    Date := "30/06/2017",
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
        GAP := "4.5",
        NeededOtherPackages := [ ["GAPDoc", "1.3"] ],
        SuggestedOtherPackages := [ ]
        ),
    AvailabilityTest := ReturnTrue
    )
);

