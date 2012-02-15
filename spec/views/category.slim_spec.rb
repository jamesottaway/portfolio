require 'spec_helper'

describe 'category.slim' do
  let(:category) { Portfolio::Category.new 'Title' }

  subject { render 'category.slim', :@category => category }

  it { should include %Q{<h1 id="title">#{category.title}</h1>} }
end
