module Data.Verified.Fufunctor

import Data.Fufunctor

%default total

||| Verified Fufunctor
||| A Fufunctor for which identity and composition laws are verified
export
interface Fufunctor t => VerifiedFufunctor (t : Type -> Type -> Type -> Type) where
  fufunctorIdentity : {a : Type} -> {b : Type} -> {c : Type} ->
                      (x : t a b c) ->
                      fumap Basics.id Basics.id Basics.id x = x
  fufunctorComposition : {a : Type} -> {b : Type} -> {c : Type} ->
                         {a1 : Type} -> {b1 : Type} -> {c1 : Type} ->
                         (x : t a b c) ->
                         (fa1 : a1 -> a) -> (fb1 : b1 -> b) -> (fc1 : c -> c1) ->
                         (fa2 : a2 -> a1) -> (fb2 : b2 -> b1) -> (fc2 : c1 -> c2) ->
                         (fumap (fa1 . fa2) (fb1 . fb2) (fc2 . fc1) x) =
                         (fumap fa2 fb2 fc2 . fumap fa1 fb1 fc1) x
