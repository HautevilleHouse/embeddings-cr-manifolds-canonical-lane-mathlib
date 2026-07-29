import HautevilleHouse.EmbeddingsCrManifoldsCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace EmbeddingsCrManifoldsCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  manifoldConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String
deriving Repr, DecidableEq

def sourceRepository : String := "embeddings-cr-manifolds-canonical-lane"
def sourceDescription : String := "Embeddings of Cr manifolds"
def baselineCertificateLane : String := "manifold_constrained"

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := sourceRepository,
  theoremName := sourceRepository,
  theoremObject := sourceDescription,
  classicalBoundary := "carried remainder",
  manifoldConstrainedStatement := "manifold-constrained embedding theorem",
  certificateLane := baselineCertificateLane,
  carriedRemainder := "classical source boundary carried"
}

theorem theorem_statement_source_key_checked :
    sourceTheoremStatement.sourceKey = sourceRepository := by
  rfl

end EmbeddingsCrManifoldsCanonicalLaneLean
end HautevilleHouse