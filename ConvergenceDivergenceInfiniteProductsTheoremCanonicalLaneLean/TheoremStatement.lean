import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  productConvergenceStatement : String
  certificateLane : String
  carriedRemainder : String

def sourceTheoremStatement : TheoremStatement :=
  {
    sourceKey := "convergence-divergence-infinite-products-canonical-lane"
    theoremName := "ConvergenceDivergenceInfiniteProductsTheorem"
    theoremObject := "Canonical convergence/divergence classification for infinite products"
    classicalBoundary := "Unrestricted classical closure remains carried."
    productConvergenceStatement := "For an admissible class of infinite products, the product converges if and only if the bridge and gate conditions hold, ensuring closure."
    certificateLane := "product_closed"
    carriedRemainder := "Classical source boundary carried by the formalization certificate."
  }

def ProductConvergenceClosure (A : AdmissibleClass) : Prop :=
  ConstrainedConvergenceDivergenceClosure A

theorem product_convergence_closed (A : AdmissibleClass) :
    ProductConvergenceClosure A := by
  exact constrained_convergence_divergence_endgame A

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse