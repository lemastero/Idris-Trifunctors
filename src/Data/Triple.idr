module Data.Triple

%default total

public export
data Triple : (A : Type) -> (B : Type) -> (C : Type) -> Type where
  MkTriple : {A, B, C : Type} ->
             (1 a : A) -> (1 b : B) -> (1 c : C) ->
             Triple A B C

export
fst3 : Triple a b c -> a
fst3 (MkTriple x y z) = x

export
snd3 : Triple a b c -> b
snd3 (MkTriple x y z) = y

export
trd3 : Triple a b c -> c
trd3 (MkTriple x y z) = z

||| Dependent Triple 1
||| Type of A -> (B -> C)
||| Dual to DTriple 2
public export
data DTriple1 : (a : Type) -> (b : a -> Type) ->
                (c : a -> (Type -> Type)) -> Type where
  MkDPair1 : {c : a -> (Type -> Type)} -> {b : a -> Type} ->
             (1 af : a) -> (1 bf : b af) -> (1 cf: (c af) (b af)) ->
             DTriple1 a b c

||| Dependent Triple 2
||| Type of (A -> B) -> C
||| Dual to DTriple 1
public export
data DTriple2 : (a : Type) -> (b : a -> Type) ->
                (c : (a -> Type) -> Type) -> Type where
  MkDPair2 : {c : (a -> Type) -> Type} -> {b : a -> Type} ->
             (1 af : a) -> (1 bf : b af) -> (1 cf: c b) ->
             DTriple2 a b c
