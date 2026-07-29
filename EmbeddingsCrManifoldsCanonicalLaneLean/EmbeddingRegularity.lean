import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EmbeddingsCrManifoldsCanonicalLaneLean.CrManifold

namespace HautevilleHouse
namespace EmbeddingsCrManifoldsCanonicalLaneLean

structure RegularEmbeddingPackage {M N : Type u} [TopologicalSpace M] [TopologicalSpace N]
    (f : M → N) (hM : CrManifold M) (hN : CrManifold N) where
  embeddingCondition : CrManifoldEmbedding f hM hN
  rankCondition : ∀ x, rank (tangentMap f x) = hM.dimension
  immersion : Prop
  submersion : Prop

def RegularEmbeddingClosed {M N : Type u} [TopologicalSpace M] [TopologicalSpace N]
    (f : M → N) (hM : CrManifold M) (hN : CrManifold N) : Prop :=
  RegularEmbeddingPackage f hM hN

theorem regular_embedding_closed_from_package {M N : Type u} [TopologicalSpace M] [TopologicalSpace N]
    (f : M → N) (hM : CrManifold M) (hN : CrManifold N)
    (pkg : RegularEmbeddingPackage f hM hN) : RegularEmbeddingClosed f hM hN := pkg

end EmbeddingsCrManifoldsCanonicalLaneLean
end HautevilleHouse