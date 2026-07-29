import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

structure EndpointClassificationPackage {C : ConvergentSequencesPackage} {P : InfiniteProductsPackage} {T : ConvergenceTestsPackage C P} {A : AbsoluteConvergencePackage T} where
  endpointConvergence : Prop
  endpointDivergence : Prop
  classificationComplete : Prop

structure EndpointClassificationEvidence {C : ConvergentSequencesPackage} {P : InfiniteProductsPackage} {T : ConvergenceTestsPackage C P} {A : AbsoluteConvergencePackage T} (E : EndpointClassificationPackage A) where
  endpointConvergenceClosed : E.endpointConvergence
  endpointDivergenceClosed : E.endpointDivergence
  classificationCompleteClosed : E.classificationComplete

def EndpointClassificationClosed {C : ConvergentSequencesPackage} {P : InfiniteProductsPackage} {T : ConvergenceTestsPackage C P} {A : AbsoluteConvergencePackage T} (E : EndpointClassificationPackage A) : Prop :=
  E.endpointConvergence ∧ E.endpointDivergence ∧ E.classificationComplete

theorem endpoint_classification_closed_from_evidence {C : ConvergentSequencesPackage} {P : InfiniteProductsPackage} {T : ConvergenceTestsPackage C P} {A : AbsoluteConvergencePackage T} (Ep : EndpointClassificationPackage A) (E : EndpointClassificationEvidence Ep) :
    EndpointClassificationClosed Ep := by
  exact And.intro E.endpointConvergenceClosed (And.intro E.endpointDivergenceClosed E.classificationCompleteClosed)

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse