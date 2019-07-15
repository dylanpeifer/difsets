#############################################################################
##
#W  PackageInfo.g            DifSets Package                     Dylan Peifer
##

SetPackageInfo( rec(
    PackageName := "DifSets",
    Subtitle := "an algorithm for enumerating all difference sets in a group",
    Version := "2.3.0",
    Date := "14/07/2019",
    PackageWWWHome := "https://dylanpeifer.github.io/difsets",
    SourceRepository := rec(
        Type := "git",
        URL := "https://github.com/dylanpeifer/difsets",
        ),
    IssueTrackerURL := Concatenation(~.SourceRepository.URL, "/issues"),
    SupportEmail := "djp282@cornell.edu",
    ArchiveURL := Concatenation(~.SourceRepository.URL,
                                "/archive/v", ~.Version),
    ArchiveFormats := ".tar.gz",
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
    Status := "accepted",
    CommunicatedBy := "Alexander Hulpke (Colorado State)",
    AcceptDate := "07/2019",
    README_URL := Concatenation(~.PackageWWWHome, "/README.md"),
    PackageInfoURL := Concatenation(~.PackageWWWHome, "/PackageInfo.g"),
    AbstractHTML :=
        "The <span class=\"pkgname\">DifSets</span> package is a \
        <span class=\"pkgname\">GAP</span> package implementing an algorithm \
        for enumerating all difference sets up to equivalence in a group.",
    PackageDoc := rec(
        BookName := "DifSets",
        ArchiveURLSubset := ["doc"],
        HTMLStart := "doc/chap0.html",
        PDFFile := "doc/manual.pdf",
        SixFile := "doc/manual.six",
        LongTitle := "an algorithm to enumerate difference sets",
        ),
    Dependencies := rec(
        GAP := "4.9",
        NeededOtherPackages := [ ["GAPDoc", "1.5"], ["GRAPE", "4.7"] ],
        SuggestedOtherPackages := [ ["SmallGrp", "1.3"] ],
        ),
    AvailabilityTest := ReturnTrue,
    TestFile := "tst/testall.g",
    Keywords := ["difference sets"],
    )
);

