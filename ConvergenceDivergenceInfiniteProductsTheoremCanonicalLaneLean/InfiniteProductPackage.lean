import convergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

structure SequenceSpace where
  carrier : Type
  norm : carrier → ℝ
  completeness : Prop

structure InfiniteProductSetting where
  indexSet : Type
  sequence : indexSet → ℝ
  partialProducts : indexSet → ℝ
  productLimit : ℝ
  convergenceCondition : Prop

def InfiniteProductAdmittedObject : Type := InfiniteProductSetting

structure AdmissibleClass where
  object : InfiniteProductAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ProductWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse