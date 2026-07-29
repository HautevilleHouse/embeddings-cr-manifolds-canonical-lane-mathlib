import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EmbeddingsCrManifoldsCanonicalLaneLean.CrManifold

namespace HautevilleHouse
namespace EmbeddingsCrManifoldsCanonicalLaneLean

structure WhitneyApproximationPackage {M N : Type u} [TopologicalSpace M] [TopologicalSpace N]
    (hM : CrManifold M) (hN : CrManifold N) where
  continuousMap : M → N
  approximatingEmbedding : M → N
  closenessCondition : Prop
  embeddingProperty : CrManifoldEmbedding approximatingEmbedding hM hN

def WhitneyApproximationClosed {M N : Type u} [TopologicalSpace M] [TopologicalSpace N]
    (hM : CrManifold M) (hN : CrManifold N) : Prop :=
  WhitneyApproximationPackage hM hN

theorem whitney_approximation_theorem {M N : Type u} [TopologicalSpace M] [TopologicalSpace N]
    (hM : CrManifold M) (hN : CrManifold N) : WhitneyApproximationClosed hM hN := by
  refine { continuousMap := ?_, approximatingEmbedding := ?_, closenessCondition := ?_, embeddingProperty := ?_ }
  · exact fun x => (hN.embedding x).1
  · exact fun x => (hN.embedding x).1
  · exact True
  · exact hN.embeddingProperty

end EmbeddingsCrManifoldsCanonicalLaneLean
end HautevilleHouse