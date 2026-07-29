import .AdmissibleClass
import Mathlib.Geometry.Manifold.Basic

namespace HautevilleHouse
namespace EmbeddingsCrManifoldsCanonicalLaneLean

structure CrManifoldPackage where
  sourceManifold : Type u
  targetManifold : Type v
  sourceTopology : TopologicalSpace sourceManifold
  targetTopology : TopologicalSpace targetManifold
  sourceSmoothness : Nat
  targetSmoothness : Nat
  embeddingMap : sourceManifold → targetManifold
  isEmbedding : Prop
  imageClosed : Prop
  differentialInjective : Prop
  topologicalEmbedding : Prop

structure CrEmbeddingEvidence (P : CrManifoldPackage) where
  isEmbeddingClosed : P.isEmbedding
  imageClosedClosed : P.imageClosed
  differentialInjectiveClosed : P.differentialInjective
  topologicalEmbeddingClosed : P.topologicalEmbedding

def CrEmbeddingClosed (P : CrManifoldPackage) : Prop :=
  P.isEmbedding ∧ P.imageClosed ∧ P.differentialInjective ∧ P.topologicalEmbedding

theorem cr_embedding_closed_from_evidence (P : CrManifoldPackage)
    (E : CrEmbeddingEvidence P) : CrEmbeddingClosed P := by
  exact And.intro E.isEmbeddingClosed (And.intro E.imageClosedClosed
    (And.intro E.differentialInjectiveClosed E.topologicalEmbeddingClosed))

end EmbeddingsCrManifoldsCanonicalLaneLean
end HautevilleHouse
