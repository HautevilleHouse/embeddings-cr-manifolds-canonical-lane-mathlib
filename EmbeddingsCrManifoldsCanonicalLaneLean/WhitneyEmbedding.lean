import EmbeddingsCrManifoldsCanonicalLaneLean.AdmissibleClass

/-!
# Whitney Embedding Package
-/

namespace HautevilleHouse
namespace EmbeddingsCrManifoldsCanonicalLaneLean

structure WhitneyEmbeddingPackage where
  sourceManifold : Type u
  sourceTopology : TopologicalSpace sourceManifold
  sourceSmooth : Differentiable ℝ sourceManifold
  targetEuclideanSpace : ℕ → Type v
  targetTopology : ∀ n, TopologicalSpace (targetEuclideanSpace n)
  targetSmooth : ∀ n, Differentiable ℝ (targetEuclideanSpace n)
  embeddingDimension : ℕ → Prop
  properEmbedding : ∀ n, Prop
  WhitneyTheorem : ∀ n, embeddingDimension n → properEmbedding n

structure WhitneyEmbeddingEvidence (W : WhitneyEmbeddingPackage) where
  embeddingDimensionClosed : ∀ n, W.embeddingDimension n
  properEmbeddingClosed : ∀ n, W.properEmbedding n
  WhitneyTheoremClosed : ∀ n, W.WhitneyTheorem n (embeddingDimensionClosed n)

def WhitneyEmbeddingClosed (W : WhitneyEmbeddingPackage) : Prop :=
  ∀ n, W.embeddingDimension n ∧ W.properEmbedding n ∧ W.WhitneyTheorem n

theorem whitney_embedding_closed_from_evidence (W : WhitneyEmbeddingPackage) (E : WhitneyEmbeddingEvidence W) :
    WhitneyEmbeddingClosed W := by
  intro n
  exact And.intro (E.embeddingDimensionClosed n) (And.intro (E.properEmbeddingClosed n) (E.WhitneyTheoremClosed n))

end EmbeddingsCrManifoldsCanonicalLaneLean
end HautevilleHouse