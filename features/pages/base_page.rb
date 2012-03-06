class BasePage < WatirPageHelper::Page
  def photo_for_id id
    browser.img(:id => id)
  end

  def photo_article_for_id id
    browser.article(:id => id)
  end
end
