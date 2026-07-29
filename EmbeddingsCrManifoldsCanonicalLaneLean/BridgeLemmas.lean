import canonicalLaneMathlib.BridgeLemmas
import .AdmissibleClass

namespace HautevilleHouse
namespace EmbeddingsCrManifoldsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CrEmbeddingWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end EmbeddingsCrManifoldsCanonicalLaneLean
end HautevilleHouse
