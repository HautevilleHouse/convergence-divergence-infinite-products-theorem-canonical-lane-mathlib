import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

structure AbsoluteConvergencePackage where
  productTerms : (Nat -> ℝ)
  absoluteConvergence : Prop
  absoluteConvergenceCondition : Prop

structure AbsoluteConvergenceEvidence (A : AbsoluteConvergencePackage) where
  absoluteConvergenceClosed : A.absoluteConvergence
  absoluteConvergenceConditionClosed : A.absoluteConvergenceCondition

def AbsoluteConvergenceClosed (A : AbsoluteConvergencePackage) : Prop :=
  A.absoluteConvergence ∧ A.absoluteConvergenceCondition

theorem absolute_convergence_closed_from_evidence
    (A : AbsoluteConvergencePackage) (E : AbsoluteConvergenceEvidence A) :
    AbsoluteConvergenceClosed A := by
  exact And.intro E.absoluteConvergenceClosed E.absoluteConvergenceConditionClosed

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse