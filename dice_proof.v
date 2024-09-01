Require Import Coq.Lists.List.
Require Import Coq.Arith.Arith.
Import ListNotations.

(* Function to sum elements of a list by folding with Nat.add *)
Fixpoint fold (f: nat -> nat -> nat) (l : list nat) (b:nat) : nat :=
  match l with
  | nil => b
  | h :: t => f h (fold f t b)
  end.

(* type of series whose elements sum to n *)
Definition sum_fin_series (n : nat) : Type :=
  match n with
  | 0 => unit
  | _ => { l : list nat | fold Nat.add l 0 = n }
  end.

(* compute the coefficient at position k in the polynomial l1 * l2 *)
Fixpoint nth_convolution (l1 l2 : list nat) (k : nat) : nat :=
  match k with
  | 0 => match l1, l2 with
         | h1 :: _, h2 :: _ => h1 * h2
         | _, _ => 0
         end
  | S k' => match l1, l2 with
            | [], _ | _, [] => 0
            | h1 :: t1, _ => (h1 * (nth k l2 0)) + (nth_convolution t1 l2 k')
            end
  end.

(* compute the convolution of two lists *)
Definition convolution (l1 l2 : list nat) : list nat :=
  let n := length l1 + length l2 - 1 in
  let fix compute_convolution k :=
      match k with
      | 0 => [nth_convolution l1 l2 0]
      | S k' => compute_convolution k' ++ [nth_convolution l1 l2 k]
      end
  in compute_convolution n.

(* convolution test *)
Definition l1 := [1; 2; 3].
Definition l2 := [4; 5; 6].

Compute convolution l1 l2.
