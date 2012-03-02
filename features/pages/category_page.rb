class CategoryPage < BasePage
	h2(:title) { |page| page.section(:class => 'category').h2 }
end