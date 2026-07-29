import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

structure ConvergentSequencesPackage where
  sequence : Type u
  limit : Type v
  epsilon : Prop
  existsN : Nat
  convergenceCondition : Prop

structure ConvergentSequencesEvidence (C : ConvergentSequencesPackage) where
  epsilonClosed : C.epsilon
  existsNClosed : C.existsN = 0 ∨ C.existsN > 0
  convergenceConditionClosed : C.convergenceCondition

def ConvergentSequencesClosed (C : ConvergentSequencesPackage) : Prop :=
  C.epsilon ∧ C.convergenceCondition

theorem convergent_sequences_closed_from_evidence (C : ConvergentSequencesPackage) (E : ConvergentSequencesEvidence C) :
    ConvergentSequencesClosed C := by
  exact And.intro E.epsilonClosed E.convergenceConditionClosed

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse