When /^I visit the home page$/ do
    visit :home do |page|
    	page.visit_category @photo['category']
    end
end

When /^I view that photo$/ do
    goto(photo_url(@photo['id']))
end

When /^I navigate to the category$/ do
    pending # express the regexp above with the code you wish you had
end
