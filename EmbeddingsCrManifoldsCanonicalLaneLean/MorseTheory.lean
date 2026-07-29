import EmbeddingsCrManifoldsCanonicalLaneLean.AdmissibleClass

/-!
# Morse Theory Package
-/

namespace HautevilleHouse
namespace EmbeddingsCrManifoldsCanonicalLaneLean

structure MorseTheoryPackage where
  manifold : Type u
  topology : TopologicalSpace manifold
  smoothStructure : Differentiable ℝ manifold
  morseFunction : (manifold → ℝ) → Prop
  criticalPoints : (manifold → ℝ) → Set manifold
  morseLemma : ∀ f, morseFunction f → ∀ p ∈ criticalPoints f,
    ∃ chart around p, in coordinates f = constant + sum of squares
  handleDecomposition : ∀ f, morseFunction f →
    manifold diffeomorphic to CW-complex with handles attached

structure MorseTheoryEvidence (M : MorseTheoryPackage) where
  morseFunctionClosed : ∀ f, M.morseFunction f
  morseLemmaClosed : ∀ f, M.morseFunction f → ∀ p ∈ M.criticalPoints f,
    ∃ chart around p, in coordinates f = constant + sum of squares
  handleDecompositionClosed : ∀ f, M.morseFunction f →
    M.manifold diffeomorphic to CW-complex with handles attached

def MorseTheoryClosed (M : MorseTheoryPackage) : Prop :=
  ∀ f, M.morseFunction f → (M.morseLemma f) ∧ (M.handleDecomposition f)

theorem morse_theory_closed_from_evidence (M : MorseTheoryPackage) (E : MorseTheoryEvidence M) :
    MorseTheoryClosed M := by
  intro f hf
  exact And.intro (E.morseLemmaClosed f hf) (E.handleDecompositionClosed f hf)

end EmbeddingsCrManifoldsCanonicalLaneLean
end HautevilleHouse