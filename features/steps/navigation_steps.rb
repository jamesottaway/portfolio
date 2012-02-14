When /^I visit the home page$/ do
    visit :home
end

When /^I view that photo$/ do
    goto(photo_url(@photo['id']))
end

When /^I navigate to a category$/ do
    on :home do |page|
    	page.visit_category @photo['category']
    end
end
