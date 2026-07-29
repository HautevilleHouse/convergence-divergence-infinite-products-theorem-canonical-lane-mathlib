import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

structure ConditionalConvergencePackage where
  productTerms : (Nat -> ℝ)
  conditionalConvergence : Prop
  rearrangementBehavior : Prop

structure ConditionalConvergenceEvidence (C : ConditionalConvergencePackage) where
  conditionalConvergenceClosed : C.conditionalConvergence
  rearrangementBehaviorClosed : C.rearrangementBehavior

def ConditionalConvergenceClosed (C : ConditionalConvergencePackage) : Prop :=
  C.conditionalConvergence ∧ C.rearrangementBehavior

theorem conditional_convergence_closed_from_evidence
    (C : ConditionalConvergencePackage) (E : ConditionalConvergenceEvidence C) :
    ConditionalConvergenceClosed C := by
  exact And.intro E.conditionalConvergenceClosed E.rearrangementBehaviorClosed

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse