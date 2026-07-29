import convergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean.InfiniteProductPackage

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

structure RootTestPackage (S : SequenceSpace) where
  root : ℕ → ℝ
  limitSup : ℝ
  absoluteConvergence : Prop
  rootLimitLessThanOne : Prop
  rootLimitGreaterThanOne : Prop

structure RootTestEvidence {S : SequenceSpace} (R : RootTestPackage S) where
  absoluteConvergenceClosed : R.absoluteConvergence
  rootLimitLessThanOneClosed : R.rootLimitLessThanOne

def RootTestClosed {S : SequenceSpace} (R : RootTestPackage S) : Prop :=
  R.absoluteConvergence ∧ R.rootLimitLessThanOne

theorem root_test_closed_from_evidence {S : SequenceSpace} (R : RootTestPackage S) (E : RootTestEvidence R) :
    RootTestClosed R := by
  exact And.intro E.absoluteConvergenceClosed E.rootLimitLessThanOneClosed

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse