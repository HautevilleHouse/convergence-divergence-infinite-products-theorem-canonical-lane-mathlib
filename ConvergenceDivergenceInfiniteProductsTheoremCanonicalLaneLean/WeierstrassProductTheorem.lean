import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean.InfiniteProductConvergence

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

structure WeierstrassProductPackage {P : InfiniteProduct} (C : InfiniteProductConvergencePackage P) where
  entireFunctionWithGivenZeros : Prop
  productConvergesUniformly : Prop
  representationOfEntireFunction : Prop

structure WeierstrassProductEvidence {P : InfiniteProduct} {C : InfiniteProductConvergencePackage P} (W : WeierstrassProductPackage C) where
  entireFunctionWithGivenZerosClosed : W.entireFunctionWithGivenZeros
  productConvergesUniformlyClosed : W.productConvergesUniformly
  representationOfEntireFunctionClosed : W.representationOfEntireFunction

def WeierstrassProductClosed {P : InfiniteProduct} {C : InfiniteProductConvergencePackage P} (W : WeierstrassProductPackage C) : Prop :=
  W.entireFunctionWithGivenZeros ∧ W.productConvergesUniformly ∧ W.representationOfEntireFunction

theorem weierstrass_product_closed_from_evidence
    {P : InfiniteProduct} {C : InfiniteProductConvergencePackage P} (W : WeierstrassProductPackage C)
    (E : WeierstrassProductEvidence W) : WeierstrassProductClosed W := by
  exact And.intro E.entireFunctionWithGivenZerosClosed
    (And.intro E.productConvergesUniformlyClosed E.representationOfEntireFunctionClosed)

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse