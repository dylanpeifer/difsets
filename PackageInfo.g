#############################################################################
##
#W  PackageInfo.g            DifSets Package                     Dylan Peifer
##

SetPackageInfo( rec(
    PackageName := "DifSets",
    Subtitle := "an algorithm for enumerating all difference sets in a group",
    Version := "2.3.1",
    Date := "14/09/2019",
    License := "GPL-3.0-or-later",
    PackageWWWHome := "https://dylanpeifer.github.io/difsets",
    SourceRepository := rec(
        Type := "git",
        URL := "https://github.com/dylanpeifer/difsets",
        ),
    IssueTrackerURL := Concatenation(~.SourceRepository.URL, "/issues"),
    SupportEmail := "djp282@cornell.edu",
    ArchiveURL := Concatenation(~.SourceRepository.URL,
                                "/releases/download/v", ~.Version,
                                "/", LowercaseString(~.PackageName),
                                "-", ~.Version),
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
    AutoDoc := rec(
        TitlePage := rec(
            Copyright := """
                Copyright &copyright; 2017, 2019 Dylan Peifer <P/>

                This program is free software: you can redistribute it and/or
                modify it under the terms of the GNU General Public License as
                published by the Free Software Foundation, either version 3 of
                the License, or (at your option) any later version. <P/>

                This program is distributed in the hope that it will be useful,
                but WITHOUT ANY WARRANTY; without even the implied warranty of
                MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
                GNU General Public License for more details. <P/>

                You should have received a copy of the GNU General Public
                License along with this program. If not, see
                <URL>http://www.gnu.org/licenses/</URL>.
            """,
            Abstract := """
                The <Package>DifSets</Package> Package implements an algorithm
                for enumerating all difference sets up to equivalence in an
                arbitrary finite group. The algorithm functions by finding
                difference sums, which are potential images of difference sets
                in quotient groups of the original group, and searching their
                preimages. In this way, the search space can be dramatically
                decreased, and searches of groups of relatively large order
                (such as order 64 or order 96) can be completed.
            """,
        ),
    ),
));

