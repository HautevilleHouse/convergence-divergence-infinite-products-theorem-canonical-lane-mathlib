import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

structure ConvergenceTestPackage (P : InfiniteProductPackage) where
  ratioTest : Prop
  rootTest : Prop
  integralTest : Prop
  comparisonTest : Prop
  alternatingTest : Prop

structure ConvergenceTestEvidence {P : InfiniteProductPackage}
    (T : ConvergenceTestPackage P) where
  ratioTestClosed : T.ratioTest
  rootTestClosed : T.rootTest
  integralTestClosed : T.integralTest
  comparisonTestClosed : T.comparisonTest
  alternatingTestClosed : T.alternatingTest

def ConvergenceTestClosed {P : InfiniteProductPackage}
    (T : ConvergenceTestPackage P) : Prop :=
  T.ratioTest ∧ T.rootTest ∧ T.integralTest ∧
  T.comparisonTest ∧ T.alternatingTest

theorem convergence_test_closed_from_evidence
    {P : InfiniteProductPackage} (T : ConvergenceTestPackage P)
    (E : ConvergenceTestEvidence T) : ConvergenceTestClosed T := by
  exact And.intro E.ratioTestClosed
    (And.intro E.rootTestClosed
      (And.intro E.integralTestClosed
        (And.intro E.comparisonTestClosed E.alternatingTestClosed)))

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse
