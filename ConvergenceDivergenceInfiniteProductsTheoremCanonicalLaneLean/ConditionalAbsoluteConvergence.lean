import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

structure ConditionalAbsoluteConvergencePackage where
  seriesSum : ℝ
  rearrangementSum : ℝ
  conditionallyConvergent : Prop
  absolutelyConvergent : Prop
  rearrangementInvariance : Prop
  riemannRearrangementTheorem : Prop
  sumOfAbsoluteValues : ℝ

theorem rearrangement_invariance_iff_absolute_convergence (a : ℕ → ℝ) (hsum : Summable a) :
    (∀ (σ : ℕ ≃ ℕ), Summable (a ∘ σ) ∧ ∑' n, a (σ n) = ∑' n, a n) ↔ Summable (λ n => |a n|) := by
  constructor
  · intro h
    have hperm := h (Equiv.refl ℕ)
    have hsumabs : Summable (λ n => |a n|) := by
      have hpos : ∀ n, |a n| ≥ 0 := λ n => abs_nonneg _
      have hbound : ∀ n, |a n| ≤ a n + (-a n) := λ n => by
        nlinarith [abs_le.mpr (by
          have := le_total (a n) 0
          cases this with
          | inl hle =>
            have : |a n| = -a n := abs_of_nonpos hle
            have : a n + (-a n) = 0 := by ring
            nlinarith
          | inr hge =>
            have : |a n| = a n := abs_of_nonneg hge
            nlinarith
          )]
      exact Summable.of_nonneg_of_le hpos (λ n => by
        have hsum' := hsum
        sorry) hsum
    exact hsumabs
  · intro h
    have hperm : ∀ (σ : ℕ ≃ ℕ), Summable (a ∘ σ) ∧ ∑' n, a (σ n) = ∑' n, a n := by
      intro σ
      have hsumσ : Summable (a ∘ σ) := by
        have hsumabs' : Summable (λ n => |a n|) := h
        have hsumabsσ : Summable (λ n => |a (σ n)|) := by
          rw [← hsumabs'.comp_of_surjective σ.surjective]
          exact hsumabs'.comp σ
        have : (λ n => |a (σ n)|) = (|a|) ∘ σ := rfl
        have hsum_abs_σ : Summable ((|a|) ∘ σ) := hsumabs'.comp σ
        have h_cauchy : Cauchy (λ N => ∑ n in Finset.range N, a (σ n)) := by
          intro ε hε
          rcases hsumabsσ with ⟨S, hS⟩
          sorry
        exact Summable.cauchy h_cauchy
      have hsum_eq : ∑' n, a (σ n) = ∑' n, a n := by
        have hsum_eq_abs : ∑' n, |a (σ n)| = ∑' n, |a n| := by
          exact hsumabs'.tsum_comp σ
        sorry
      exact And.intro hsumσ hsum_eq
    exact hperm

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse