describe('Add to Cart Feature', () => {
  it('should increase the cart count by 1 when a product is added', () => {
    cy.visit('/'); // Go to the home page

    // Get the initial cart count
    cy.get('a[href="/cart"]').invoke('text').then(initialText => {
      const initialCount = parseInt(initialText.match(/\d+/)[0], 10); // Extract number

      // Click 'Add to Cart' button for the first product
      cy.get('article').first().find('button').click();

      // Check the updated cart count
      cy.get('a[href="/cart"]').invoke('text').then(updatedText => {
        const updatedCount = parseInt(updatedText.match(/\d+/)[0], 10); // Extract number

        // Assert the cart count increased by 1
        expect(updatedCount).to.equal(initialCount + 1);
      });
    });
  });
});
