import EmbeddingsCrManifoldsCanonicalLaneLean.AdmissibleClass

/-!
# Transversality Package
-/

namespace HautevilleHouse
namespace EmbeddingsCrManifoldsCanonicalLaneLean

structure TransversalityPackage where
  sourceManifold : Type u
  sourceTopology : TopologicalSpace sourceManifold
  sourceSmooth : Differentiable ℝ sourceManifold
  targetManifold : Type v
  targetTopology : TopologicalSpace targetManifold
  targetSmooth : Differentiable ℝ targetManifold
  submanifold : targetManifold → Prop
  submanifoldSmooth : ∀ x, submanifold x → Differentiable ℝ (subtype (submanifold))
  genericMap : (sourceManifold → targetManifold) → Prop
  transversalityTheorem : ∀ f : sourceManifold → targetManifold, genericMap f →
    ∀ y : targetManifold, submanifold y → f ⋔ submanifold at y

structure TransversalityEvidence (T : TransversalityPackage) where
  genericMapClosed : ∀ f, T.genericMap f
  transversalityTheoremClosed : ∀ f, T.genericMap f → ∀ y, T.submanifold y → T.f ⋔ T.submanifold at y

def TransversalityClosed (T : TransversalityPackage) : Prop :=
  ∀ f, T.genericMap f → ∀ y, T.submanifold y → T.f ⋔ T.submanifold at y

theorem transversality_closed_from_evidence (T : TransversalityPackage) (E : TransversalityEvidence T) :
    TransversalityClosed T := by
  intro f hf y hy
  exact E.transversalityTheoremClosed f hf y hy

end EmbeddingsCrManifoldsCanonicalLaneLean
end HautevilleHouse