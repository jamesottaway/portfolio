require 'spec_helper'

describe 'home.slim' do
  let(:category) { mock 'Category', :title => 'Category Title', :slug => 'category_slug' }
  let(:categories) { [category] }

  subject { render 'home.slim', :@categories => categories }

  it { should include %Q{<a href="/category/#{category.slug}">#{category.title}</a>} }
end
