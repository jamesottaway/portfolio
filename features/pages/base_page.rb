class BasePage
  include WatirPageHelper

  def initialize browser, visit = false
    @browser = browser
    goto if visit
    expected_element if respond_to? :expected_element
    has_expected_title? if respond_to? :has_expected_title?
  end

  def photo_for_id id
    img(:id => id)
  end

  def photo_article_for_id id
    article(:id => id)
  end

  def method_missing sym, *args, &block
    @browser.send sym, *args, &block
  end
end
