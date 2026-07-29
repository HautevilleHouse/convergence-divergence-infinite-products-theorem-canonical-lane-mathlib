import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

structure AbsoluteConvergencePackage {C : ConvergentSequencesPackage} {P : InfiniteProductsPackage} (T : ConvergenceTestsPackage C P) where
  absoluteConvergenceCondition : Prop
  rearrangementTheorem : Prop
  cauchyProduct : Prop

structure AbsoluteConvergenceEvidence {C : ConvergentSequencesPackage} {P : InfiniteProductsPackage} {T : ConvergenceTestsPackage C P} (A : AbsoluteConvergencePackage T) where
  absoluteConvergenceConditionClosed : A.absoluteConvergenceCondition
  rearrangementTheoremClosed : A.rearrangementTheorem
  cauchyProductClosed : A.cauchyProduct

def AbsoluteConvergenceClosed {C : ConvergentSequencesPackage} {P : InfiniteProductsPackage} {T : ConvergenceTestsPackage C P} (A : AbsoluteConvergencePackage T) : Prop :=
  A.absoluteConvergenceCondition ∧ A.rearrangementTheorem ∧ A.cauchyProduct

theorem absolute_convergence_closed_from_evidence {C : ConvergentSequencesPackage} {P : InfiniteProductsPackage} {T : ConvergenceTestsPackage C P} (A : AbsoluteConvergencePackage T) (E : AbsoluteConvergenceEvidence A) :
    AbsoluteConvergenceClosed A := by
  exact And.intro E.absoluteConvergenceConditionClosed (And.intro E.rearrangementTheoremClosed E.cauchyProductClosed)

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse