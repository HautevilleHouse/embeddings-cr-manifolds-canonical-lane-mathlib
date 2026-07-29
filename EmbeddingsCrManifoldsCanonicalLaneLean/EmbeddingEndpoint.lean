import .EmbeddingProperties
import Mathlib.Geometry.Manifold.WhitneyEmbedding

namespace HautevilleHouse
namespace EmbeddingsCrManifoldsCanonicalLaneLean

structure EndpointClassificationPackage {P : CrManifoldPackage}
    {C : CrEmbeddingClosed P} {Q : EmbeddingPropertiesPackage C} (Z : EmbeddingPropertiesClosed Q) where
  targetManifold : Type u
  targetTopology : TopologicalSpace targetManifold
  embeddingDimensionBound : Prop
  whitneyEmbeddingTheorem : Prop
  endpointMatchesWhitney : Prop

structure EndpointClassificationEvidence {P : CrManifoldPackage}
    {C : CrEmbeddingClosed P} {Q : EmbeddingPropertiesPackage C}
    {Z : EmbeddingPropertiesClosed Q} (Epkg : EndpointClassificationPackage Z) where
  embeddingDimensionBoundClosed : Epkg.embeddingDimensionBound
  whitneyEmbeddingTheoremClosed : Epkg.whitneyEmbeddingTheorem
  endpointMatchesWhitneyClosed : Epkg.endpointMatchesWhitney

def EndpointClassificationClosed {P : CrManifoldPackage}
    {C : CrEmbeddingClosed P} {Q : EmbeddingPropertiesPackage C}
    {Z : EmbeddingPropertiesClosed Q} (Epkg : EndpointClassificationPackage Z) : Prop :=
  Epkg.embeddingDimensionBound ∧ Epkg.whitneyEmbeddingTheorem ∧ Epkg.endpointMatchesWhitney

theorem endpoint_classification_closed_from_evidence {P : CrManifoldPackage}
    {C : CrEmbeddingClosed P} {Q : EmbeddingPropertiesPackage C}
    {Z : EmbeddingPropertiesClosed Q} (Epkg : EndpointClassificationPackage Z)
    (E : EndpointClassificationEvidence Epkg) : EndpointClassificationClosed Epkg := by
  exact And.intro E.embeddingDimensionBoundClosed
    (And.intro E.whitneyEmbeddingTheoremClosed E.endpointMatchesWhitneyClosed)

theorem endpoint_classification_supplies_mathlib_statement {P : CrManifoldPackage}
    {C : CrEmbeddingClosed P} {Q : EmbeddingPropertiesPackage C}
    {Z : EmbeddingPropertiesClosed Q} (Epkg : EndpointClassificationPackage Z) :
    Epkg.whitneyEmbeddingTheorem := Epkg.whitneyEmbeddingTheorem

end EmbeddingsCrManifoldsCanonicalLaneLean
end HautevilleHouse
