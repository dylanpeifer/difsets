last edit 25–Aug-2013 by Dylan Peifer


The file difsetsolver.gap contains several functions for working with Hadamard difference sets. I've tried to keep things reasonably commented and included a header before each function that describes the purpose and use of the function, but things are still a bit messy and there could be some errors and bugs.

The most important function is DifSetGroupSearch(v, cn). Given group size v and category number cn, this function returns all inequivalent difference sets in the group. This is almost instant for the trivial case of v=4, takes a few seconds for v=16, and takes under a minute for v=36 (with the exception of SmallGroup(36,9), which takes 16 minutes). Some testing indicates that the function will work for groups of order 64, but I very roughly estimate it will take anywhere from a couple of hours to several days for each group, with all groups of order 64 taking somewhere around 150 days of computer time.

The file difsets.txt contains a list of all inequivalent difference sets found in order 4, order 16, and order 36 groups.
