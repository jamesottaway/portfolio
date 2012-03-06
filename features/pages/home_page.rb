class HomePage < BasePage
  direct_url 'http://localhost:9292/'
  expected_title 'James Ottaway'

  def visit_category category_name
    browser.link(:text => category_name).click
  end	
end