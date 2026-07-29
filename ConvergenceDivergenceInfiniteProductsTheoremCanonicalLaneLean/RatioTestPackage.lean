import convergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean.InfiniteProductPackage

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

structure RatioTestPackage (S : SequenceSpace) where
  ratio : ℕ → ℝ
  limitSup : ℝ
  limitInf : ℝ
  absoluteConvergence : Prop
  conditionalConvergence : Prop
  ratioLimitLessThanOne : Prop
  ratioLimitGreaterThanOne : Prop

structure RatioTestEvidence {S : SequenceSpace} (R : RatioTestPackage S) where
  absoluteConvergenceClosed : R.absoluteConvergence
  ratioLimitLessThanOneClosed : R.ratioLimitLessThanOne

def RatioTestClosed {S : SequenceSpace} (R : RatioTestPackage S) : Prop :=
  R.absoluteConvergence ∧ R.ratioLimitLessThanOne

theorem ratio_test_closed_from_evidence {S : SequenceSpace} (R : RatioTestPackage S) (E : RatioTestEvidence R) :
    RatioTestClosed R := by
  exact And.intro E.absoluteConvergenceClosed E.ratioLimitLessThanOneClosed

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse