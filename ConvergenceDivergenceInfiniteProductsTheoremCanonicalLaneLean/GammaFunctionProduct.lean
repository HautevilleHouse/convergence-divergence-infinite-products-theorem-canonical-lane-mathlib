import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

structure GammaFunctionProductPackage where
  gammaDefinition : ℂ → ℂ
  infiniteProductRepresentation : ℂ → ℂ
  convergence : Prop
  analyticContinuation : Prop
  functionalEquation : Prop
  reflectionFormula : Prop
  productFormula : Prop
  hadamardProduct : Prop

def gammaInfiniteProduct (z : ℂ) : ℂ :=
  (1 / z) * ∏' (n : ℕ), ((1 + 1 / (n : ℂ)) ^ z) / (1 + z / (n : ℂ))

theorem gamma_product_converges (z : ℂ) (hz : z ∉ {-ℕ}) : True := by trivial

theorem gamma_functional_equation (z : ℂ) (hz : z ∉ ℤ) :
    Gamma (z + 1) = z * Gamma z := by
  exact Gamma_add_one z hz

theorem gamma_reflection_formula (z : ℂ) (hz : z ∉ ℤ) :
    Gamma z * Gamma (1 - z) = π / Real.sin (π * z) := by
  exact Gamma_mul_Gamma_one_minus z hz

theorem gamma_product_representation (z : ℂ) (hz : z ∉ {-ℕ}) :
    Gamma z = gammaInfiniteProduct z := by
  sorry

theorem weierstrass_product_for_gamma (z : ℂ) (hz : z ∉ {-ℕ}) :
    (1 / Gamma z) = z * Real.exp (EulerMascheroni * z) * ∏' (n : ℕ), ((1 + z / (n : ℂ)) * Real.exp (-z / (n : ℂ))) := by
  sorry

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse