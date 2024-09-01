This is a Coq proof of the solution to the "Weird Dice" problem posed by PurpleMind, on YouTube (https://www.youtube.com/watch?v=p0J8kIoQF6I). This solution was found in collaboration with Gabriel Grajeda.


The problem is as follows:

{

Let d1 and d2 be fair, 8-sided dice with sides

d1 = {1, 2, 3, 4, 5, 6, 7, 8},
d2 = {1, 2, 3, 4, 5, 6, 7, 8}.

Then the flat mapping of d1 with respect to the list operator [+ d2[0], ... + d2[7]]
is a multiset

outcomes(d1, d2) = {1 + 1, 1 + 2, 1 + 3, ..., 8 + 7, 8 + 8}

of 64 elements, corresponding to the probability distribution

prob_distr(d1, d2) = {2: 1/64, 3: 2/64, 4: 3/64, 5: 4/64, 6: 5/64,
	      	      7: 6/64, 8: 7/64, 9: 8/64, 10: 7/64, 11: 6/64,
	              12: 5/64, 13: 4/64, 14: 3/64, 15: 2/64, 16: 1/64}.

Can you label 8-sided dice d1' and d2' such that they are distinct
(i.e. d1 \neq d2) and that 

prob_distr(d1', d2') = prob_distr(d1, d2) ?

}

We answer in the affirmative, identifying several solutions. The basic proof strategy is
as follows:

{

The probability distribution of sums can be understood as the convolution of d1 and d2,
considered as lists. Equivalently, we may view d1 and d2 as characteristic polynomials
\Chi(d1) and \Chi(d2) in an indeterminate x:

with \Chi(dt) -> (n0)x^{dt[0]} + ... + (nk)x^{dt[k]} + ... + (n7)x^{dt[7]},

so that the convolution d1 * d2 corresponding to prob_distr(d1, d2) satisfies

\Chi(d1 * d2) = \Chi(d1)\Chi(d2).

We expand the product \Chi(d1)\Chi(d2) directly and search for factorizations

\Chi(d1)(x)\Chi(d2)(x) = \Chi(d1')\Chi(d1')(x)

where \Chi(d1') and \Chi(d1') are distinct polynomials in x satisfying P(1) = Q(1) = 8.
Then we can simply invert the characteristic polynomial correspondence to obtain d1' and d2,
which satisfy the desiderata by construction. There are four unique solutions, obtained by a
key observation about the structure of the factorization of \Chi(d1)\Chi(d2). In particular, 
we factor \Chi(d1)\Chi(d2) as 

x^2(x + 1)^2(x^2 + 1)^2(x^4 + 1)^2

= [x(x + 1)(x^2 + 1)(x^4 + 1)][x(x + 1)(x^2 + 1)(x^4 + 1)]

:= [x(A)(B)(C)][x(A')(B')(C')] := P \cdot Q

Note that A (resp. B, C) = A' (resp. B', C'). Observe that A(1) = B(1) = C(1); in particular,
the constraint {P(1) = Q(1) = 8} is invariant under any swaps of A, B, C, A', B', C'. There are
only four distinct configurations (modulo {A (resp. B, C) = A' (resp. B', C')} && {P \cdot Q = Q \cdot P}):

0) [x(A)(B)(C)][x(A')(B')(C')] 	| (original dice)

1) [x(A)(A')(B)][x(C)(C')(B')]	|
2) [x(A)(A')(C)][x(B)(B')(C')]	| (weird dice_
3) [x(B)(B')(A)][x(C)(C')(A')]	| 

The corresponding weird dice are

1) d1' = {1, 2, 2, 3, 3, 4, 4, 5}, d2' = {1, 3, 5, 5, 7, 7, 9, 11}

2) d1' = {1, 2, 2, 3, 5, 6, 6, 7}, d2' = {1, 3, 3, 5, 5, 7, 7, 9 }

3) d1' = {1, 2, 3, 3, 4, 4, 5, 6}, d2' = {1, 2, 5, 5, 6, 6, 9, 10}.

In fact, these are all such weird dice with 8 sides, since R[Z] is a unique factorization domain.

}