class BasePage < WatirPageHelper::Page
  def photo_for_id id
    browser.img(:id => id)
  end

  def photo_for_id id
    browser.li(:id => id)
  end
end
