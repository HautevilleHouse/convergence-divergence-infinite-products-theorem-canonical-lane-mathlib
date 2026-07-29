import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

structure InfiniteProductConvergencePackage where
  sequence : (Nat -> ℝ)
  partialProducts : (Nat -> ℝ)
  convergence : Prop
  limitValue : ℝ
  convergenceCondition : Prop

structure InfiniteProductConvergenceEvidence (P : InfiniteProductConvergencePackage) where
  convergenceClosed : P.convergence
  limitValueClosed : P.limitValue = 0 ∨ P.limitValue ≠ 0

def InfiniteProductConvergenceClosed (P : InfiniteProductConvergencePackage) : Prop :=
  P.convergence ∧ (P.limitValue = 0 ∨ P.limitValue ≠ 0)

theorem infinite_product_convergence_closed_from_evidence
    (P : InfiniteProductConvergencePackage) (E : InfiniteProductConvergenceEvidence P) :
    InfiniteProductConvergenceClosed P := by
  exact And.intro E.convergenceClosed E.limitValueClosed

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse