require 'spec_helper'

describe Portfolio::Category do
	let(:title) { 'My Category' }

	subject { Portfolio::Category.new title }

	its(:title) { should == title }
	its(:slug) { should == 'my_category' }
end