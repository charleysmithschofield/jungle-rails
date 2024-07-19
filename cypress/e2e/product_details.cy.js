// Test navigation to the product detail page when User selects a product
describe('Product Details Navigation', () => {
  it('should navigate to the product detail page when a product is clicked', () => {
    cy.visit('/'); // Go to the home page

    // Click the first product link
    cy.get('article').first().find('a').click();

    // Verify that the URL includes '/products/' indicating the product detail page
    cy.url().should('include', '/products/');
  });
});
