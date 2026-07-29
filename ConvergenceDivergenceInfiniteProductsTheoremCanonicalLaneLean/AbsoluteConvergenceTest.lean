import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean.InfiniteProductConvergence

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

structure AbsoluteConvergencePackage {P : InfiniteProduct} (C : InfiniteProductConvergencePackage P) where
  absoluteConvergenceCriterion : Prop
  productOfAbsoluteValuesConverges : Prop
  rearrangementInvariance : Prop

structure AbsoluteConvergenceEvidence {P : InfiniteProduct} {C : InfiniteProductConvergencePackage P} (A : AbsoluteConvergencePackage C) where
  absoluteConvergenceCriterionClosed : A.absoluteConvergenceCriterion
  productOfAbsoluteValuesConvergesClosed : A.productOfAbsoluteValuesConverges
  rearrangementInvarianceClosed : A.rearrangementInvariance

def AbsoluteConvergenceClosed {P : InfiniteProduct} {C : InfiniteProductConvergencePackage P} (A : AbsoluteConvergencePackage C) : Prop :=
  A.absoluteConvergenceCriterion ∧ A.productOfAbsoluteValuesConverges ∧ A.rearrangementInvariance

theorem absolute_convergence_closed_from_evidence
    {P : InfiniteProduct} {C : InfiniteProductConvergencePackage P} (A : AbsoluteConvergencePackage C)
    (E : AbsoluteConvergenceEvidence A) : AbsoluteConvergenceClosed A := by
  exact And.intro E.absoluteConvergenceCriterionClosed
    (And.intro E.productOfAbsoluteValuesConvergesClosed E.rearrangementInvarianceClosed)

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse