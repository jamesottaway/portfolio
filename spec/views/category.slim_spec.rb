require 'spec_helper'

describe 'category.slim' do
  let(:category) { Portfolio::Category.new 'Title' }
  let(:photo) { mock 'Photo', :title => 'Cool Photo', :id => 'cool', :thumb => 'http://cool/photo/' }

  subject { render 'category.slim', :@category => category, :@photos => [photo] }

  it { should include %Q{<section class="category" id="#{category.slug}">} }
  it { should include %Q{<h2>#{category.title}</h2>} }
  it { should include %Q{<section id="photos">} }
  it { should include %Q{<article class="photo" id="#{photo.id}">} }
  it { should include %Q{<h3><a href="/#{photo.id}">#{photo.title}</a></h3>} }
  it { should include %Q{<a href="/#{photo.id}"><img src="#{photo.thumb}" /></a>} }
  it { should include %Q{</article>} }
  it { should include %Q{</section>} }
end
