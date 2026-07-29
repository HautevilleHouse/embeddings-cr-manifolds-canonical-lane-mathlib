import .CrEmbeddingStructure

namespace HautevilleHouse
namespace EmbeddingsCrManifoldsCanonicalLaneLean

structure EmbeddingPropertiesPackage {P : CrManifoldPackage} (C : CrEmbeddingClosed P) where
  whitneyEmbeddingExists : Prop
  codimensionSufficient : Prop
  approximationProperty : Prop
  isotopyExtension : Prop

structure EmbeddingPropertiesEvidence {P : CrManifoldPackage} {C : CrEmbeddingClosed P}
    (Q : EmbeddingPropertiesPackage C) where
  whitneyEmbeddingExistsClosed : Q.whitneyEmbeddingExists
  codimensionSufficientClosed : Q.codimensionSufficient
  approximationPropertyClosed : Q.approximationProperty
  isotopyExtensionClosed : Q.isotopyExtension

def EmbeddingPropertiesClosed {P : CrManifoldPackage} {C : CrEmbeddingClosed P}
    (Q : EmbeddingPropertiesPackage C) : Prop :=
  Q.whitneyEmbeddingExists ∧ Q.codimensionSufficient ∧
  Q.approximationProperty ∧ Q.isotopyExtension

theorem embedding_properties_closed_from_evidence {P : CrManifoldPackage}
    {C : CrEmbeddingClosed P} (Q : EmbeddingPropertiesPackage C)
    (E : EmbeddingPropertiesEvidence Q) : EmbeddingPropertiesClosed Q := by
  exact And.intro E.whitneyEmbeddingExistsClosed
    (And.intro E.codimensionSufficientClosed
      (And.intro E.approximationPropertyClosed E.isotopyExtensionClosed))

end EmbeddingsCrManifoldsCanonicalLaneLean
end HautevilleHouse
