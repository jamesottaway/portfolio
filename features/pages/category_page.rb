class CategoryPage < BasePage
	h1 :title, :id => 'title'

	def photo_for_id id
		img(:id => id)
	end
end