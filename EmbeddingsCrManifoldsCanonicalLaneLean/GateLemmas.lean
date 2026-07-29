import canonicalLaneMathlib.GateLemmas
import .AdmissibleClass

namespace HautevilleHouse
namespace EmbeddingsCrManifoldsCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end EmbeddingsCrManifoldsCanonicalLaneLean
end HautevilleHouse
