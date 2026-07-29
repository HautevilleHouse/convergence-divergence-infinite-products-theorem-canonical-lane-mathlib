import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

structure ProductDivergenceCriteriaPackage where
  productTerms : (Nat -> ℝ)
  divergenceToZero : Prop
  divergenceToInfinity : Prop
  zeroCriteria : Prop
  infinityCriteria : Prop

structure ProductDivergenceCriteriaEvidence (D : ProductDivergenceCriteriaPackage) where
  divergenceToZeroClosed : D.divergenceToZero
  divergenceToInfinityClosed : D.divergenceToInfinity
  zeroCriteriaClosed : D.zeroCriteria
  infinityCriteriaClosed : D.infinityCriteria

def ProductDivergenceCriteriaClosed (D : ProductDivergenceCriteriaPackage) : Prop :=
  D.divergenceToZero ∧ D.divergenceToInfinity ∧ D.zeroCriteria ∧ D.infinityCriteria

theorem product_divergence_criteria_closed_from_evidence
    (D : ProductDivergenceCriteriaPackage) (E : ProductDivergenceCriteriaEvidence D) :
    ProductDivergenceCriteriaClosed D := by
  exact And.intro E.divergenceToZeroClosed (And.intro E.divergenceToInfinityClosed
    (And.intro E.zeroCriteriaClosed E.infinityCriteriaClosed))

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse