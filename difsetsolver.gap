#contains functions for working with hadamard difference sets
#last edit 31-Jul-2013 by Dylan Peifer

################################################################################

##FUNCTION: DifSetTest
##PARAMETERS: v, cn, D
##	v is the group size
##	cn is the category number
##	D is a set of distinct elements in G in GAP index form
##PURPOSE: Given a group size, category number, and set of distinct elements,
##	DifSetTest() tells the user whether or not the set is a difference set.
##RETURN: Returns true if the given set is a difference set and false if not.


DifSetTest := function (v, cn, D)


#declare all variables as local variables
local G, eg, k, lambda, i, j, count, index;


#set up the group and variables
G := SmallGroup(v, cn);
eg := Elements(G);
k := Length(D);
lambda := k*(k-1)/(v-1);


#count stores the number of  times each element in the group is hit by the set
count := NullMat(1,v);

for i in D do
for j in D do

	#compute the index given by this pair of elements and add it to count
	index := Position(eg, eg[i]*eg[j]^(-1));
	count[1][index] := count[1][index]+1;

	#if a nonidentity index exceeds lambda the set cannot be a difset
	if not index = 1 and count[1][index] > lambda then
		return false;
	fi;

od;
od;


#if counts of nonidentities never exceeded lambda they must all be lambda
return true;

end;

################################################################################

##FUNCTION: DifSetEquivTest
##PARAMETERS: v, cn, D1, D2
##	v is the group size
##	cn is the category number
##	D1, D2 are the difference sets in GAP index form
##PURPOSE: Given a group size, category number, and two difference sets,
##	DifSetEquivTest() tells the user whether or not the two difference sets 
##	are equivalent.
##RETURN: Returns true if sets are equivalent and false if not.


DifSetEquivTest := function (v, cn, D1, D2)


#declare all variables as local
local G, eg, d1, i, d2, j, phi, g, d3, h;


#set up variables, including mapping positions in D1, D2 to elements in G
G := SmallGroup(v,cn);
eg := Elements(G);

d1 := [];
for i in D1 do
	Add(d1, eg[i]);
od;

d2 := [];
for j in D2 do
	Add(d2, eg[j]);
od;


#iterate over all automorphisms and group elements
#sets are equivalent iff d1 = g * (d2)^phi
for phi in AutomorphismGroup(G) do
for g in eg do

	#map d2 to d3 = g * (d2)^phi
	d3 := [];
	for h in d2 do
		Add(d3, g*h^phi);
	od;

	#if these sets are equal then D1 and D2 are equivalent
	if IsEqualSet(d1,d3) then
		return true;
	fi;

od;
od;


#if no equivalence was found then D1 and D2 must be inequivalent
return false;

end;

################################################################################

##FUNCTION: DifSetEquivList
##PARAMETERS: v, cn, difsets
##	v is the group size
##	cn is the category number
##	difsets is a list of distinct difference sets each in GAP index form
##PURPOSE: Given a group size, category number, and list of distinct difference
##	sets, DifSetEquivList() removes equivalent difference sets from the
##	list, leaving one from each equivalence class. This is much faster than
##	using DifSetEquivTest() on each pair, especially for large lists.
##RETURN: Returns a list of inequivalent difference sets from the given list.


DifSetEquivList := function (v, cn, difsets)


#declare all variables as local
local G, eg, index, phi, g, d, i, j;


#set up variables
G := SmallGroup(v,cn);
eg := Elements(G);


#the while loop starts with the first set in difsets, eliminates all
#sets equivalent to it, and then moves to the next set in difsets
index := 1;
while index < Length(difsets) do

	#iterate over all automorphisms and group elements
	for phi in AutomorphismGroup(G) do
	for g in eg do

		#map the index set to an equiv set in GAP index form
		d := [];
		for i in difsets[index] do
			Add(d, Position(eg, g*eg[i]^phi));
		od;

		#search for this equiv set in difsets
		for j in [(index+1)..Length(difsets)] do

			#remove it if found (there can only be one copy,
			#as difsets had distinct difference sets)
			if IsEqualSet(d, difsets[j]) then
				Remove(difsets, j);
				break;
			fi;

		od;

	od;
	od;

	#go to the next set in difsets
	index := index + 1;

od;


#return difsets, which is now clear of equiv sets
return difsets;

end;

################################################################################

##FUNCTION: DifSetDistroTest
##PARAMETERS: G, N, distro
##	G is a group
##	N is a normal subgroup of G
##	distro is a list counting distribution of elements into cosets of N
##PURPOSE: Given a group and normal subgroup, DifSetDistroTest() tells the user
##	if the given distribution into cosets could potentially contain a
##	difference set. Theory comes from Lemma 4.1 in Bruck's "Difference Sets
##	in a Finite Group" paper.
##RETURN: Returns false if the given distribution cannot correspond to a 
##	difference set, and true if the test cannot rule out the existence of
##	a difference set with the given distribution.


DifSetDistroTest := function (G, N, distro)


#declare all variables as local
local v, k, lambda, n, w, x, H, eh, i, sum, h, a, b;


#set up variables
v := Size(G);
k := 2 * ( (1/2) * RootInt(v) )^2 - ( (1/2) * RootInt(v) );
lambda := k*(k-1)/(v-1);
n := k-lambda;
w := Size(N);


#first test
if not Sum(distro) = k then return false; fi;


#second test
if not Sum(distro,x->x^2) = n + lambda*w then return false; fi;


#third test
H := FactorGroupNC(G,N);
eh := Elements(H);

for i in [2..Length(eh)] do
	sum := 0;

	for h in eh do

		a := Position(eh,h);
		b := Position(eh,eh[i]*h);

		sum := sum + distro[a] * distro[b];

	od;

	if not sum = lambda*w then return false; fi;
od;


#if d passes all three tests then return true
return true;

end;

################################################################################

##FUNCTION: DifSetDistroEquivTest
##PARAMETERS: G, N, d1, d2
##	G is a group
##	N is a normal subgroup of G
##	d1, d2 are distributions into cosets of N
##PURPOSE: Given a group and two distributions, DifSetDistroEquivTest()
##	determines if the two distributions are equivalent.
##RETURN: Returns true if the distributions are equivalent and false if not.


DifSetDistroEquivTest := function (G, N, d1, d2)


#declare all variables as local
local phi, H, eh, aut, rho, h, d3, i;


#set up variables for homomorphic image
phi := NaturalHomomorphismByNormalSubgroup(G, N);
H := Image(phi);
eh := Elements(H);

for aut in AutomorphismGroup(G) do
	
	if Image(aut, N) = N then

		rho := InducedAutomorphism(phi, aut);

		for h in eh do

			d3 := [];

			for i in [1..Length(d2)] do

				Add(d3, d2[Position(eh, h*eh[i]^rho)]);

			od;

			if d3 = d1 then return true; fi;

		od;

	fi;

od;

return false;

end;

################################################################################

##FUNCTION: DifSetDistroEquivList
##PARAMETERS: G, N, distros
##	G is a group
##	N is a normal subgroup of G
##	distros is a list containing distributions into cosets of N
##PURPOSE: Given a group and list of distributions, DifSetDistroEquivList()
##	removes equivalent distributions from the list.
##RETURN: Returns a list of inequivalent distributions.


DifSetDistroEquivList := function (G, N, distros)


#declare all variables as local
local phi, H, eh, index, aut, rho, h, d, i, j;


#set up variables for homomorphic image
phi := NaturalHomomorphismByNormalSubgroupNC(G,N);
H := Image(phi);
eh := Elements(H);

#start at first distro, eliminate all equiv distros, and move to next
index := 1;
while index < Length(distros) do

	for aut in AutomorphismGroup(G) do

		#make sure the automorphism fixes N
		if Image(aut, N) = N then

			rho := InducedAutomorphism(phi, aut);
				
			for h in eh do

				#map index distro to a new equiv distro
				d := [];
				for i in [1..Length(distros[index])] do
					Add(d, distros[index][Position(eh, h*eh[i]^rho)]);
				od;

				#search for the new equiv distro and eliminate if found
				for j in [(index+1)..Length(distros)] do

					if d = distros[j] then
						Remove(distros, j);
						break;
					fi;

				od;

			od;

		fi;

	od;

	index := index+1;

od;

#return distros, which is now clear of equivalents
return distros;

end;

################################################################################

##FUNCTION: DifSetDistroRefine
##PARAMETERS: G, oldN, newN, oldd
##	G is a group
##	oldN is a normal subgroup of G
##	newN is a subgroup of oldN that is also normal in G
##	oldd is a single distribution into cosets of oldN
##PURPOSE: Given a group and a distribution into cosets of a normal subgroup,
##	DifSetDistroRefine() computes all possible distributions into cosets
##	of a new normal subgroup.
##RETURN: Returns a list of distributions.


DifSetDistroRefine := function (G, oldN, newN, oldd)


#declare all variables as local
local v, k, lambda, n, oldw, oldphi, oldeh, neww, newphi, neweh, newd,
	cosetparts, i, cosetopts, cosetopt, test, x, d, perms, j, perm, copy,
	distro, m, coset, pos, pass, y, sum, h, a, b;


#set up (v, k, lmabda, n) difference set variables
v := Size(G);
k := Sum(oldd);
lambda := k*(k-1)/(v-1);
n := k-lambda;

#set up homomorphic images variables
oldw := Size(oldN);
oldphi := NaturalHomomorphismByNormalSubgroupNC(G, oldN);
oldeh := Elements(Image(oldphi));

neww := Size(newN);
newphi := NaturalHomomorphismByNormalSubgroupNC(G, newN);
neweh := Elements(Image(newphi));


#newd will contain all the refined distributions
newd := [];


#for each coset of oldN, cosetparts will contain a list of possible partitions
#into cosets of newN
cosetparts := [];

for i in [1..Length(oldd)] do

	#RestrictedPartitions() returns an empty list when evaluated on 0,
	#so use Tuples() to get the proper return
	#using partitions means test 1 is always satisfied
	if oldd[i] = 0 then
		Add(cosetparts, Tuples([0], oldw/neww));
	else
		Add(cosetparts, RestrictedPartitions(oldd[i], [0..neww], oldw/neww));
	fi;

od;


#cosetopts will contain possible distributions before permutation in each coset
cosetopts := [];

for cosetopt in IteratorOfCartesianProduct(cosetparts) do

	#make a copy so that the original is not changed
	test := StructuralCopy(cosetopt);

	#if passes test 2 then add to cosetopts
	if Sum(Flat(test),x->x^2) = n + lambda*neww then
		Add(cosetopts, test);
	fi;

od;


#now check permutations
for d in cosetopts do

	#perms will contain permutations for each coset
	perms := [];

	for j in [1..Length(d)] do
		Add(perms, PermutationsList(d[j]));
	od;


	#now iterate through all possible permutations of d
	for perm in IteratorOfCartesianProduct(perms) do

		#make a copy so that original is not changed
		copy := StructuralCopy(perm);

		#distro will be the distro in proper order (compared to neweh)
		distro := [];

		for m in [1..Length(neweh)] do

			coset := PreImagesRepresentative(newphi, neweh[m])^oldphi;
			pos := Position(oldeh, coset);
			distro[m] := Remove(copy[pos]);

		od;

		#perform test 3
		pass := true;
		for y in [2..Length(neweh)] do
			sum := 0;

			for h in neweh do
				a := Position(neweh, h);
				b := Position(neweh, neweh[y]*h);
				sum := sum + distro[a]*distro[b];
			od;

			if not sum = lambda*neww then
				pass := false;
				break;
			fi;

		od;

		#if distro passes test 3 add it to newd
		if pass = true then Add(newd, distro); fi;

	od;

od;

return newd;

end;

################################################################################

##FUNCTION: DifSetDistroList
##PARAMETERS: G
##	G is a group
##PURPOSE: Given a group, DifSetDistroList() computes all possible distributions
##	of a difference set into cosets of the smallest nontrivial normal 
##	subgroup.
##RETURN: Returns a list with the first entry the smallest nontrivial normal
##	subgroup of G and the second entry all possible distributions. 


DifSetDistroList := function (G)


#declare all variables as local
local v, k, lambda, n, best, K, N, series, oldN, oldd, i, newN, newd, d;


#set up (v,k,lambda, n) difference set variables
v := Size(G);
k := 2 * ( (1/2) * RootInt(v) )^2 - ( (1/2) * RootInt(v) );
lambda := k*(k-1)/(v-1);
n := k-lambda;


#find a nontrivial normal subgroup N of minimal size
best := v;
N := G;

for K in NormalSubgroups(G) do

	if Size(K) < best and Size(K) > 1 then
		N := K;
		best := Size(K);
	fi;

od;


#find a chief series that ends in N
series := ChiefSeriesThrough(G,[N]);


#G is the first normal subgroup in series, and only has one possible distro
oldN := G;
oldd := [[k]];


#now move down the series and refine the distributions at each step
for i in [2..Length(series)-1] do

	#set up variables for the ith subgroup in series	
	newN := series[i];
	newd := [];


	#iterate over each distribution from previous subgroup and refine it
	for d in oldd do

		Append(newd, DifSetDistroRefine(G, oldN, newN, d));

	od;

	
	#remove equivalent distributions
	newd := DifSetDistroEquivList(G, newN, newd);


	#prepare for the next iteration
	oldN := newN;
	oldd := newd;

od;

#return the smallest nontrivial normal subgroup and distributions for it
return [N, newd];

end;

################################################################################

##FUNCTION: DifSetDistroSearch
##PARAMETERS: G, N, distro, v, cn
##	G is a group
##	N is a normal subgroup of G
##	distro is a list counting distribution of elements into cosets of N
##	v is the size of G
##	cn is the category number of G
##PURPOSE: Given a group, normal subgroup, and distribution of elements,
##	DifSetDistroSearch() exhaustively finds all difsets with the given
##	distribution.
##RETURN: Returns a list of all found (and potentially equivalent) difsets.


DifSetDistroSearch := function (G, N, distro, v, cn)


#declare all variables as local
local phi, H, eh, eg, cosets, i, j, options, k, difsets, x, set;


#set up variables for the group and quotient group
phi := NaturalHomomorphismByNormalSubgroupNC(G,N);
H := Image(phi);
eh := Elements(H);
eg := Elements(G);


#cosets will contain the cosets of N in GAP index form
cosets := [];

#add an empty list for each coset
for i in [1..Length(eh)] do
	Add(cosets, []);
od;

#for each indexed element in G put the index in the appropriate coset
for j in [1..Length(eg)] do
	Add(cosets[Position(eh, eg[j]^phi)],j);
od;


#options will contain the choices in elements for each coset
options := [];

for k in [1..Length(eh)] do
	Add(options, Combinations(cosets[k], distro[k]));
od;


#difsets will contain all found difsets
difsets := [];

#iterate over all possible choices for all cosets
for x in IteratorOfCartesianProduct(options) do

	#flatten to a list
	set := Flat(x);

	#if set is a difset then add it to difsets
	if DifSetTest(v, cn, set) then
		Add(difsets, set);
	fi;

od;


#return all found difsets
return difsets;

end;

################################################################################

##FUNCTION: DifSetGroupSearch
##PARAMETERS: v, cn
##	v is the group size
##	cn is the category number
##PURPOSE: Given a group specified by size and GAP category number,
##	DifSetGroupSearch() exhaustively searches the group and finds all
##	difference sets up to equivalence.
##RETURN: A list of all inequivalent difference sets in the group.

DifSetGroupSearch := function (v, cn)


#declare all variables as local
local G, difsets, distros, d, new;


#G is the group and difsets will store found difsets
G := SmallGroup(v,cn);
difsets := [];


#find all distributions and search them
distros := DifSetDistroList(G);

for d in distros[2] do

	new := DifSetDistroSearch(G,distros[1],d,v,cn);
	Append(difsets, new);

od;


#remove equivalent difsets from the list
difsets := DifSetEquivList(v, cn, difsets);


#return the list of difsets
return difsets;

end;

################################################################################
