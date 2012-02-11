class HomePage < BasePage
  direct_url 'http://localhost:9292/'

  def visit_category category_name
    link(:text => category_name).click
  end
end