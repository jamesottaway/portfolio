require 'spec_helper'

describe 'category.slim' do
  let(:category) { Portfolio::Category.new 'Title' }
  let(:photo) { mock 'Photo', :title => 'Cool Photo', :id => 'cool', :src => 'http://cool/photo/' }

  subject { render 'category.slim', :@category => category, :@photos => [photo] }

  it { should include %Q{<h1 id="title">#{category.title}</h1>} }
  it { should include %Q{<img src="#{photo.src}" />} }
  it { should include %Q{<a href="/#{photo.id}">#{photo.title}</a>} }
end
