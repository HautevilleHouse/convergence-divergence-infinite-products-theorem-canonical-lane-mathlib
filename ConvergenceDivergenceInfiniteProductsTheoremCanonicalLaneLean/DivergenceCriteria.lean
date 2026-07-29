import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean.InfiniteProductConvergence

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

structure DivergenceCriteriaPackage {P : InfiniteProduct} (C : InfiniteProductConvergencePackage P) where
  divergenceToZero : Prop
  divergenceToInfinity : Prop
  oscillation : Prop
  criteriaForDivergence : Prop

structure DivergenceCriteriaEvidence {P : InfiniteProduct} {C : InfiniteProductConvergencePackage P} (D : DivergenceCriteriaPackage C) where
  divergenceToZeroClosed : D.divergenceToZero
  divergenceToInfinityClosed : D.divergenceToInfinity
  oscillationClosed : D.oscillation
  criteriaForDivergenceClosed : D.criteriaForDivergence

def DivergenceCriteriaClosed {P : InfiniteProduct} {C : InfiniteProductConvergencePackage P} (D : DivergenceCriteriaPackage C) : Prop :=
  D.divergenceToZero ∧ D.divergenceToInfinity ∧ D.oscillation ∧ D.criteriaForDivergence

theorem divergence_criteria_closed_from_evidence
    {P : InfiniteProduct} {C : InfiniteProductConvergencePackage P} (D : DivergenceCriteriaPackage C)
    (E : DivergenceCriteriaEvidence D) : DivergenceCriteriaClosed D := by
  exact And.intro E.divergenceToZeroClosed
    (And.intro E.divergenceToInfinityClosed
      (And.intro E.oscillationClosed E.criteriaForDivergenceClosed))

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse