import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

structure InfiniteProductsAdmissibleObject where
  productSpace : Type
  product : (ℕ → productSpace) → productSpace
  convergenceCondition : Prop
  summableCondition : Prop
  absoluteConvergence : Prop
  conclusion : convergenceCondition → summableCondition → absoluteConvergence

structure InfiniteProductsAdmissibleClass where
  object : InfiniteProductsAdmissibleObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : InfiniteProductsAdmissibleClass) : Prop :=
  (A.object.convergenceCondition ∧ A.object.summableCondition) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

theorem bridge_from_admissible_class (A : InfiniteProductsAdmissibleClass) :
    (A.object.convergenceCondition ∧ A.object.summableCondition) := by
  exact And.intro A.object.convergenceCondition A.object.summableCondition

theorem gate_from_admissible_class (A : InfiniteProductsAdmissibleClass) :
    (A.endpointSatisfied ∨ A.remainderRecorded) := by
  exact A.gateWitness

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse