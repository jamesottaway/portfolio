module Portfolio
  module Acceptance
    def photo_url id
      "http://localhost:9292/#{id}"
    end

    def goto url
      browser.goto(url)
      raise 'Page Not Found' if browser.body.text == 'Not Found'
    end

    def photos_for_category category
      @portfolio['photos'].select { |photo| photo['category'] == category }
    end

    def browser
      WatirPageHelper.browser
    end
  end
end