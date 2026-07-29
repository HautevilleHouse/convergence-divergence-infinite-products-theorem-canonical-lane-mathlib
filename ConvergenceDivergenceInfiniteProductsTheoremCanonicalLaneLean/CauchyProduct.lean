import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

structure CauchyProductPackage where
  seriesA : ℕ → ℝ
  seriesB : ℕ → ℝ
  cauchyProduct : ℕ → ℝ
  productConverges : Prop
  abelTheorem : Prop
  dirichletConvergence : Prop

def cauchyProduct (a b : ℕ → ℝ) (n : ℕ) : ℝ :=
  ∑ k in Finset.range (n + 1), a k * b (n - k)

theorem cauchy_product_absolutely_convergent (a b : ℕ → ℝ) (ha : Summable (λ n => |a n|)) (hb : Summable (λ n => |b n|)) :
    Summable (λ n => cauchyProduct a b n) ∧ ∑' n, cauchyProduct a b n = (∑' n, a n) * (∑' n, b n) := by
  have hsuma : Summable a := Summable.of_nonneg_of_le (λ n => abs_nonneg (a n)) (λ n => le_abs_self (a n)) ha
  have hsumb : Summable b := Summable.of_nonneg_of_le (λ n => abs_nonneg (b n)) (λ n => le_abs_self (b n)) hb
  have hprod : Summable (λ n => cauchyProduct a b n) := by
    have h : ∀ n, |cauchyProduct a b n| ≤ ∑ k in Finset.range (n+1), |a k| * |b (n - k)| := by
      intro n
      calc
        |cauchyProduct a b n| = |∑ k in Finset.range (n+1), a k * b (n - k)| := rfl
        _ ≤ ∑ k in Finset.range (n+1), |a k * b (n - k)| := abs_sum_le_sum_abs _ _
        _ = ∑ k in Finset.range (n+1), |a k| * |b (n - k)| := by
          refine Finset.sum_congr rfl (λ x hx => ?_)
          rw [abs_mul]
    sorry
  have hsum_eq : ∑' n, cauchyProduct a b n = (∑' n, a n) * (∑' n, b n) := by
    calc
      ∑' n, cauchyProduct a b n = ∑' n, ∑ k in Finset.range (n+1), a k * b (n - k) := rfl
      _ = (∑' n, a n) * (∑' n, b n) :=by
        have ha_abs : Summable (λ n : ℕ => |a n|) := ha
        have hb_abs : Summable (λ n : ℕ => |b n|) := hb
        exact tsum_mul_tsum_of_summable_norm ha hb
    
  exact And.intro hprod hsum_eq

theorem mertens_theorem (a b : ℕ → ℝ) (ha : Summable a) (hb_conv : Summable b) (h_cond : ∑' n, b n ≠ ∞) :
    Summable (λ n => cauchyProduct a b n) ∧ ∑' n, cauchyProduct a b n = (∑' n, a n) * (∑' n, b n) := by
  sorry

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse