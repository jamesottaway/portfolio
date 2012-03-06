When /^I visit the home page$/ do
    visit HomePage
end

When /^I view that photo$/ do
    goto(photo_url(@photo['id']))
end

When /^I navigate to a category$/ do
    on HomePage do |page|
    	page.visit_category @photo['category']
    end
    on(CategoryPage) do |page|
    	browser.title.should == @photo['category']
    	page.title.should == @photo['category']
    end
end
