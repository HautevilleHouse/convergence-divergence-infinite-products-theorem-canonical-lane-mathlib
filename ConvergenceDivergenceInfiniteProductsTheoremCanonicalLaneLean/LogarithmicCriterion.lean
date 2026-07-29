import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean.InfiniteProductConvergence

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

structure LogarithmicCriterionPackage {P : InfiniteProduct} (C : InfiniteProductConvergencePackage P) where
  logarithmicTest : Prop
  seriesOfLogarithmsConverges : Prop
  equivalenceToProductConvergence : Prop

structure LogarithmicCriterionEvidence {P : InfiniteProduct} {C : InfiniteProductConvergencePackage P} (L : LogarithmicCriterionPackage C) where
  logarithmicTestClosed : L.logarithmicTest
  seriesOfLogarithmsConvergesClosed : L.seriesOfLogarithmsConverges
  equivalenceToProductConvergenceClosed : L.equivalenceToProductConvergence

def LogarithmicCriterionClosed {P : InfiniteProduct} {C : InfiniteProductConvergencePackage P} (L : LogarithmicCriterionPackage C) : Prop :=
  L.logarithmicTest ∧ L.seriesOfLogarithmsConverges ∧ L.equivalenceToProductConvergence

theorem logarithmic_criterion_closed_from_evidence
    {P : InfiniteProduct} {C : InfiniteProductConvergencePackage P} (L : LogarithmicCriterionPackage C)
    (E : LogarithmicCriterionEvidence L) : LogarithmicCriterionClosed L := by
  exact And.intro E.logarithmicTestClosed
    (And.intro E.seriesOfLogarithmsConvergesClosed E.equivalenceToProductConvergenceClosed)

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse