Given /^I have a bunch of photos$/ do
    photos = 5.times.map { |i| {'title' => 'My Photo', 'src' => 'http://portfolio/my_photo', 'id' => "photo_#{i}", 'category' => 'Scenic'} }
    @portfolio = {'photos' => photos}
    File.open('portfolio.yml', 'w') { |f| f.write(@portfolio.to_yaml) }
end

Given /^I have a photo$/ do
    @photo = {'title' => 'My Photo', 'src' => 'http://portfolio/my_photo', 'id' => 'my_photo', 'category' => 'Scenic'}
    @portfolio = {'photos' => [@photo]}
    File.open('portfolio.yml', 'w') { |f| f.write(@portfolio.to_yaml) }
end

Then /^I should see my photos$/ do
  on(:home) { |page|
    5.times { |i|
      page.photo_for_id("photo_#{i}").should exist
    }
  }
end

Then /^I should see my photo$/ do
  on(:photo) do |page|
    browser.title.should =~ /^#{@photo['title']}/
    page.title.should == @photo['title']
    page.photo.src.should == @photo['src']
  end
end

Then /^I should see the photos in the category$/ do
  on(:category) do |page|
    photos_for_category(@photo['category']).each do |photo|
      page.photo_for_id(photo['id']).src.should == photo['src']
    end
  end
end
