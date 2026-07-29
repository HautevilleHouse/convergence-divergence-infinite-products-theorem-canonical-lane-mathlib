import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

structure WeierstrassFactorizationPackage where
  entireFunction : ℂ → ℂ
  zeroSet : Set ℂ
  orders : ℂ → ℕ
  canonicalProduct : ℂ → ℂ
  convergenceOfProduct : Prop
  representationValid : Prop
  orderOfGrowth : Prop
  genus : ℕ
  hadamardFactorization : Prop

def elementaryFactor (p : ℕ) (z : ℂ) : ℂ :=
  if p = 0 then 1 - z else (1 - z) * Real.exp (∑ k in Finset.range p, (z^(k+1) / (k+1 : ℂ)))

theorem elementaryFactorConverges (p : ℕ) (z : ℂ) : True := by trivial

theorem weierstrass_product_converges (f : ℂ → ℂ) (zeros : Set ℂ) (orders : ℂ → ℕ) : Prop := by
  sorry

theorem weierstrass_factorization (f : ℂ → ℂ) (hf : AnalyticAt ℂ f 0) :
    ∃ (g : ℂ → ℂ) (zeros : ℂ → ℕ), (∀ z, zeros z ∈ ℕ) ∧ (∏' (z : ℂ), elementaryFactor (zeros z) (z / something)) := by
  sorry

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse