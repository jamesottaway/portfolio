require 'spec_helper'

describe 'category.slim' do
  let(:category) { Portfolio::Category.new 'Title' }
  let(:photo) { mock 'Photo', :title => 'Cool Photo', :id => 'cool', :thumb => 'http://cool/photo/' }

  subject { render 'category.slim', :@category => category, :@photos => [photo] }

  it { should include %Q{<h1 id="title">#{category.title}</h1>} }
  it { should include %Q{<img id="#{photo.id}" src="#{photo.thumb}" />} }
  it { should include %Q{<a href="/#{photo.id}">#{photo.title}</a>} }
end
