require 'spec_helper'

describe 'home.slim' do
  let(:category) { mock 'Category', :title => 'Category Title', :slug => 'category_slug' }
  let(:photo) { mock 'Photo', :thumb => 'http://thumb', :id => 'my_photo' }

  subject { render 'home.slim', :@categories => [category], :@photos => [photo] }

  it { should include %Q{<a href="/category/#{category.slug}">#{category.title}</a>} }
  it { should include %Q{<a href="/#{photo.id}">} }
  it { should include %Q{<img id="#{photo.id}" src="#{photo.thumb}" />} }
end
