Given /^I have a bunch of photos$/ do
    photos = 5.times.map { |i| {'title' => 'My Photo', 'src' => 'http://portfolio/my_photo', 'thumb' => 'http://portfolio/thumb', 'id' => "photo_#{i}", 'category' => 'Scenic'} }
    @portfolio = {'photos' => photos}
    File.open('portfolio.yml', 'w') { |f| f.write(@portfolio.to_yaml) }
end

Given /^I have a photo$/ do
    @photo = {'title' => 'My Photo', 'src' => 'http://portfolio/my_photo', 'thumb' => 'http://portfolio/thumb', 'id' => 'my_photo', 'category' => 'Scenic'}
    @portfolio = {'photos' => [@photo]}
    File.open('portfolio.yml', 'w') { |f| f.write(@portfolio.to_yaml) }
end

Then /^I should see my photo thumbnails$/ do
  on(HomePage) { |page|
    @portfolio['photos'].each { |photo|
      page.photo_for_id(photo['id']).should exist
      page.photo_for_id(photo['id']).img.src.should == photo['thumb']
    }
  }
end

Then /^I should see my photo$/ do
  on(PhotoPage) do |page|
    browser.title.should start_with @photo['title']
    page.title.should == @photo['title']
    page.photo.src.should == @photo['src']
  end
end

Then /^I should see the photo thumbnails in the category$/ do
  on(CategoryPage) do |page|
    photos_for_category(@photo['category']).each do |photo|
      page.photo_for_id(photo['id']).img.src.should == photo['thumb']
    end
  end
end
