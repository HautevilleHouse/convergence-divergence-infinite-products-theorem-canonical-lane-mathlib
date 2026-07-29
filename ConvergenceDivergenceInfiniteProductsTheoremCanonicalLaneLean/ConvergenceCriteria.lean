import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

structure ConvergenceCriteriaPackage where
  comparisonTest : Prop
  ratioTest : Prop
  rootTest : Prop
  integralTest : Prop
  alternatingSeriesTest : Prop
  cauchyCondensation : Prop
  dirichletTest : Prop
  abelTest : Prop

structure ConvergenceCriteriaEvidence (C : ConvergenceCriteriaPackage) where
  comparisonTestClosed : C.comparisonTest
  ratioTestClosed : C.ratioTest
  rootTestClosed : C.rootTest
  integralTestClosed : C.integralTest
  alternatingSeriesTestClosed : C.alternatingSeriesTest
  cauchyCondensationClosed : C.cauchyCondensation
  dirichletTestClosed : C.dirichletTest
  abelTestClosed : C.abelTest

def ConvergenceCriteriaClosed (C : ConvergenceCriteriaPackage) : Prop :=
  C.comparisonTest ∧ C.ratioTest ∧ C.rootTest ∧ C.integralTest ∧
  C.alternatingSeriesTest ∧ C.cauchyCondensation ∧ C.dirichletTest ∧ C.abelTest

theorem convergence_criteria_closed_from_evidence (C : ConvergenceCriteriaPackage)
    (E : ConvergenceCriteriaEvidence C) : ConvergenceCriteriaClosed C := by
  exact And.intro E.comparisonTestClosed
    (And.intro E.ratioTestClosed
      (And.intro E.rootTestClosed
        (And.intro E.integralTestClosed
          (And.intro E.alternatingSeriesTestClosed
            (And.intro E.cauchyCondensationClosed
              (And.intro E.dirichletTestClosed E.abelTestClosed))))))

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse