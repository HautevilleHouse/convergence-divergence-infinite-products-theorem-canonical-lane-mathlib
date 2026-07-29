import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

structure WeierstrassProductPackage where
  sequence : (Nat -> ℂ)
  product : ℂ
  canFactor : Prop
  order : ℕ

structure WeierstrassProductEvidence (W : WeierstrassProductPackage) where
  productConverges : Prop
  canFactorClosed : W.canFactor

def WeierstrassProductClosed (W : WeierstrassProductPackage) : Prop :=
  W.canFactor ∧ WeierstrassProductClosed.productConverges

theorem weierstrass_product_closed_from_evidence
    (W : WeierstrassProductPackage) (E : WeierstrassProductEvidence W) :
    WeierstrassProductClosed W := by
  exact And.intro E.canFactorClosed E.productConverges

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse