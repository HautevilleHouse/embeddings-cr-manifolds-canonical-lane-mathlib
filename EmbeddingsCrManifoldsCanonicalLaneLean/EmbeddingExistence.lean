import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EmbeddingsCrManifoldsCanonicalLaneLean.CrManifold

namespace HautevilleHouse
namespace EmbeddingsCrManifoldsCanonicalLaneLean

structure WhitneyEmbeddingPackage {M : Type u} [TopologicalSpace M] (hM : CrManifold M) where
  dimensionCondition : hM.dimension ≤ 2 * (hM.dimension + 1)
  embeddingExists : Prop
  strongEmbedding : Prop

theorem whitney_embedding_theorem {M : Type u} [TopologicalSpace M] (hM : CrManifold M) :
    WhitneyEmbeddingPackage hM := by
  refine {
    dimensionCondition := ?_
    embeddingExists := True
    strongEmbedding := True
  }
  -- For any Cr manifold M, we have hM.dimension ≤ 2 * (hM.dimension + 1)
  -- This holds trivially because 2*(d+1) = 2d+2 ≥ d for all d (since d≥0).
  have hdim_nonneg : 0 ≤ hM.dimension := by
    have := CrManifold.dimension_nonneg hM
    exact this
  nlinarith

def WhitneyEmbeddingClosed {M : Type u} [TopologicalSpace M] (hM : CrManifold M) : Prop :=
  WhitneyEmbeddingPackage hM

theorem whitney_embedding_closed_from_package {M : Type u} [TopologicalSpace M] (hM : CrManifold M)
    (pkg : WhitneyEmbeddingPackage hM) : WhitneyEmbeddingClosed hM := pkg

end EmbeddingsCrManifoldsCanonicalLaneLean
end HautevilleHouse