require 'spec_helper'

describe 'home.slim' do
  let(:category) { mock 'Category', :title => 'Category Title', :slug => 'category_slug' }
  let(:photo) { mock 'Photo', :title => 'Photo Title', :thumb => 'http://thumb', :id => 'my_photo' }

  subject { render 'home.slim', :@categories => [category], :@photos => [photo] }

  it { should include %Q{<article class="photo" id="#{photo.id}">} }
  it { should include %Q{<h3><a href="/#{photo.id}">#{photo.title}</a></h3>} }
  it { should include %Q{<a href="/#{photo.id}"><img src="#{photo.thumb}" /></a>} }
end
