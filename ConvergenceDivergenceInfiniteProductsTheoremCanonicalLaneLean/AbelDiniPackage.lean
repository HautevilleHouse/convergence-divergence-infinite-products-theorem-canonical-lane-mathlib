import convergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean.InfiniteProductPackage

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

structure AbelDiniPackage (S : SequenceSpace) where
  positiveTerms : Prop
  divergenceCondition : Prop
  seriesDivergence : Prop
  productDivergence : Prop

structure AbelDiniEvidence {S : SequenceSpace} (A : AbelDiniPackage S) where
  seriesDivergenceClosed : A.seriesDivergence
  productDivergenceClosed : A.productDivergence

def AbelDiniClosed {S : SequenceSpace} (A : AbelDiniPackage S) : Prop :=
  A.seriesDivergence ∧ A.productDivergence

theorem abel_dini_closed_from_evidence {S : SequenceSpace} (A : AbelDiniPackage S) (E : AbelDiniEvidence A) :
    AbelDiniClosed A := by
  exact And.intro E.seriesDivergenceClosed E.productDivergenceClosed

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse