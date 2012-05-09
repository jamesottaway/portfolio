require 'spec_helper'

describe 'category.slim' do
  let(:category) { Portfolio::Category.new 'Title' }
  let(:photo) { mock 'Photo', :title => 'Cool Photo', :id => 'cool', :thumb => 'http://cool/photo/' }

  subject { render 'category.slim', :@category => category, :@photos => [photo] }

  it { should include %Q{<h2 id="title">#{category.title}</h2>} }
  it { should include %Q{<ul class="thumbnails" id="#{category.slug}">} }
  it { should include %Q{<li class="thumbnail" id="#{photo.id}">} }
  it { should include %Q{<a href="/#{photo.id}">#{photo.title}</a>} }
  it { should include %Q{<a href="/#{photo.id}"><img src="#{photo.thumb}" /></a>} }
end
