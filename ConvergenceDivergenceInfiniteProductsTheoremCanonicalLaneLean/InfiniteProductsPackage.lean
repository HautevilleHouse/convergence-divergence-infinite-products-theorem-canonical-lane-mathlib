import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean

structure InfiniteProductsPackage where
  productType : Type u
  termSequence : Type v
  partialProduct : Type w
  convergenceDefinition : Prop
  absoluteConvergenceDefinition : Prop

structure InfiniteProductsEvidence (P : InfiniteProductsPackage) where
  convergenceDefinitionClosed : P.convergenceDefinition
  absoluteConvergenceDefinitionClosed : P.absoluteConvergenceDefinition

def InfiniteProductsClosed (P : InfiniteProductsPackage) : Prop :=
  P.convergenceDefinition ∧ P.absoluteConvergenceDefinition

theorem infinite_products_closed_from_evidence (P : InfiniteProductsPackage) (E : InfiniteProductsEvidence P) :
    InfiniteProductsClosed P := by
  exact And.intro E.convergenceDefinitionClosed E.absoluteConvergenceDefinitionClosed

end ConvergenceDivergenceInfiniteProductsTheoremCanonicalLaneLean
end HautevilleHouse