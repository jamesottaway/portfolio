require 'spec_helper'

describe 'photo.slim' do
  let(:category) { mock 'Category', :title => 'Category Title', :slug => 'category_slug' }

  subject { render 'layout.slim', { :@categories => [category] } }

  it { should include %Q{<title>James Ottaway</title>} }
  it { should include %Q{<nav id="categories">} }
  it { should include %Q{<a href="/category/#{category.slug}">#{category.title}</a>} }
  it { should include %Q{</nav>} }

  describe 'custom title' do
  	let(:title) { 'Custom Title' }
	subject { render 'layout.slim', { :@title => title, :@categories => [category] } }
  	it { should include %Q{<title>#{title}</title>} }
  end
end
