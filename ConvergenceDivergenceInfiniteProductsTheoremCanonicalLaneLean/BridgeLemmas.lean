import convergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean.InfiniteProductPackage

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

def ProductWitnessClosed (O : InfiniteProductAdmittedObject) : Prop :=
  O.convergenceCondition

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ProductWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.convergenceCondition

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse