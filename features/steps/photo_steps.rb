Given /^I have a bunch of photos$/ do
    pending
end

Given /^I have a photo$/ do
    @photo = {'title' => 'My Photo', 'src' => 'http://portfolio/my_photo', 'id' => 'my_photo'}
    portfolio = {'photos' => [@photo]}
    File.open('portfolio.yml', 'w') { |f| f.write(portfolio.to_yaml) }
end

Then /^I should see my photos$/ do
    pending
end

Then /^I should see my photo$/ do
  on(:photo) do |page|
    page.browser.title.should =~ /^#{@photo['title']}/
    page.title.should == @photo['title']
    page.photo.src.should == @photo['src']
  end
end
