require 'spec_helper'

describe 'photo.slim' do
  let(:inner) { Proc.new {} }
  subject { render 'layout.slim' }
  it { should include %Q{<title>James Ottaway</title>} }

  describe 'custom title' do
  	let(:title) { 'Custom Title' }
	subject { render 'layout.slim', { :@title => title } }
  	it { should include %Q{<title>#{title}</title>} }
  end
end
