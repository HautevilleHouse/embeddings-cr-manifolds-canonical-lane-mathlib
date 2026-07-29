import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EmbeddingsCrManifoldsCanonicalLaneLean

structure CrManifold (M : Type u) [TopologicalSpace M] where
  atlas : Set (Set M)
  charts : Type v
  transitionMaps : charts → charts → (Set M → Set M)
  differentiabilityClass : Nat
  dimension : Nat

def CrManifoldEmbedding {M N : Type u} [TopologicalSpace M] [TopologicalSpace N]
    (f : M → N) (hM : CrManifold M) (hN : CrManifold N) : Prop :=
  Continuous f ∧ 
  (∀ x, DifferentiableAt (hM.differentiabilityClass) hM.charts hN.charts f x) ∧
  (∀ x, Injective (tangentMap f x)) ∧
  (Image f) ∈ hN.atlas

def CrManifoldEmbeddingClosed (O : CrManifoldAdmittedObject) : Prop :=
  ∃ (f : O.manifoldType → EuclideanSpace ℝ (Fin O.dimension)) (hM : CrManifold O.manifoldType),
    CrManifoldEmbedding f hM (EuclideanCrManifold (Fin O.dimension))

end EmbeddingsCrManifoldsCanonicalLaneLean
end HautevilleHouse