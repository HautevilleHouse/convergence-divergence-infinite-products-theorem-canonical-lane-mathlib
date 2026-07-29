import convergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean.InfiniteProductPackage

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

structure CauchyCondensationPackage (S : SequenceSpace) where
  monotoneTerms : Prop
  termsNonnegative : Prop
  condensedSeries : ℕ → ℝ
  condensationConverges : Prop
  originalConverges : Prop

structure CauchyCondensationEvidence {S : SequenceSpace} (C : CauchyCondensationPackage S) where
  condensationConvergesClosed : C.condensationConverges
  originalConvergesClosed : C.originalConverges

def CauchyCondensationClosed {S : SequenceSpace} (C : CauchyCondensationPackage S) : Prop :=
  C.condensationConverges ∧ C.originalConverges

theorem cauchy_condensation_closed_from_evidence {S : SequenceSpace} (C : CauchyCondensationPackage S) (E : CauchyCondensationEvidence C) :
    CauchyCondensationClosed C := by
  exact And.intro E.condensationConvergesClosed E.originalConvergesClosed

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse