import .EmbeddingEndpoint
import .BridgeLemmas
import .GateLemmas

namespace HautevilleHouse
namespace EmbeddingsCrManifoldsCanonicalLaneLean

def ConstrainedEmbeddingClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_embedding_endgame (A : AdmissibleClass) :
    ConstrainedEmbeddingClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EmbeddingsCrManifoldsCanonicalLaneLean
end HautevilleHouse
