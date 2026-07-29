import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

structure InfiniteProductDef where
  indexSet : ℕ
  terms : ℕ → ℝ
  partialProducts : ℕ → ℝ
  infiniteProduct : ℝ
  converges : Prop
  convergesToNonZero : Prop
  absoluteConvergence : Prop
  conditionalConvergence : Prop

def partialProductFormula (a : ℕ → ℝ) (n : ℕ) : ℝ :=
  if n = 0 then 1 else ∏ i in Finset.range n, (1 + a i)

theorem partial_product_recursive (a : ℕ → ℝ) (n : ℕ) :
    partialProductFormula a (n + 1) = partialProductFormula a n * (1 + a n) := by
  simp [partialProductFormula, Finset.prod_range_succ]

theorem convergence_of_series_implies_convergence_of_product (a : ℕ → ℝ) :
    (Summable (fun n : ℕ => Real.log (1 + a n))) → (∃ (p : ℝ), Filter.Tendsto (λ n => ∏ i in Finset.range n, (1 + a i)) Filter.atTop (𝓝 p)) := by
  intro h
  have hsum := h
  have hlog := Real.summable_log_of_summable h
  sorry

theorem product_convergence_zero_iff_series_diverges (a : ℕ → ℝ) (ha : ∀ n, a n ≠ -1) :
    (Filter.Tendsto (λ n => ∏ i in Finset.range n, (1 + a i)) Filter.atTop (𝓝 0)) ↔ ¬(Summable (fun n : ℕ => Real.log (1 + a n))) := by
  sorry

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse