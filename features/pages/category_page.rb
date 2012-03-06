class CategoryPage < BasePage
	h2(:title) { browser.section(:class => 'category').h2 }
end