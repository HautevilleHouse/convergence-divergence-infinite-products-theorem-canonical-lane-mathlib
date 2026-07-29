import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

structure ConvergenceTestsPackage (C : ConvergentSequencesPackage) (P : InfiniteProductsPackage) where
  ratioTest : Prop
  rootTest : Prop
  integralTest : Prop
  comparisonTest : Prop

structure ConvergenceTestsEvidence {C : ConvergentSequencesPackage} {P : InfiniteProductsPackage} (T : ConvergenceTestsPackage C P) where
  ratioTestClosed : T.ratioTest
  rootTestClosed : T.rootTest
  integralTestClosed : T.integralTest
  comparisonTestClosed : T.comparisonTest

def ConvergenceTestsClosed {C : ConvergentSequencesPackage} {P : InfiniteProductsPackage} (T : ConvergenceTestsPackage C P) : Prop :=
  T.ratioTest ∧ T.rootTest ∧ T.integralTest ∧ T.comparisonTest

theorem convergence_tests_closed_from_evidence {C : ConvergentSequencesPackage} {P : InfiniteProductsPackage} (T : ConvergenceTestsPackage C P) (E : ConvergenceTestsEvidence T) :
    ConvergenceTestsClosed T := by
  exact And.intro E.ratioTestClosed (And.intro E.rootTestClosed (And.intro E.integralTestClosed E.comparisonTestClosed))

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse