import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

structure InfiniteProductPackage where
  sequence : ℕ → ℝ
  partialProducts : ℕ → ℝ
  convergenceCondition : Prop
  divergenceCondition : Prop
  absoluteConvergence : Prop
  conditionalConvergence : Prop

structure InfiniteProductEvidence (P : InfiniteProductPackage) where
  convergenceConditionClosed : P.convergenceCondition
  divergenceConditionClosed : P.divergenceCondition
  absoluteConvergenceClosed : P.absoluteConvergence
  conditionalConvergenceClosed : P.conditionalConvergence

def InfiniteProductClosed (P : InfiniteProductPackage) : Prop :=
  P.convergenceCondition ∧ P.divergenceCondition ∧
  P.absoluteConvergence ∧ P.conditionalConvergence

theorem infinite_product_closed_from_evidence
    (P : InfiniteProductPackage) (E : InfiniteProductEvidence P) :
    InfiniteProductClosed P := by
  exact And.intro E.convergenceConditionClosed
    (And.intro E.divergenceConditionClosed
      (And.intro E.absoluteConvergenceClosed E.conditionalConvergenceClosed))

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse
