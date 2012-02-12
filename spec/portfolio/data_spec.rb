require 'spec_helper'

describe Portfolio::Data do
  let(:input_photo) { {'title' => 'Photo Title', 'src' => 'photo_src', 'id' => 'photo_id', 'category' => 'Scenic'} }
  let(:photos) { { 'photos' => [input_photo] } }
  let(:photo) { mock 'Photo' }

  before { YAML.should_receive(:load_file).with('portfolio.yml').and_return(photos) }
  before { Portfolio::Photo.stub(:new).and_return(photo) }

  describe 'photo-related methods' do
    before { Portfolio::Photo.should_receive(:new).with(input_photo['title'], input_photo['src'], input_photo['id'], input_photo['category']).and_return(photo) }

    describe '#photos' do
      subject { Portfolio::Data.new.photos }

      its(:first) { should == photo }
    end

    describe '#find_by_id' do
      before { photo.stub(:id).and_return input_photo['id'] }

      subject { Portfolio::Data.new.find_by_id(input_photo['id']) }

      it { should == photo }
    end
  end

  describe 'category-related methods' do
    let(:category_name) { 'ABC 123' }
    let(:category_slug) { 'abc_123' }
    let(:photos) { {'photos' => [{'category' => category_name}, {'category' => category_name}]} }
    let(:category) { mock 'Category', :slug => category_slug }

    before { Portfolio::Category.should_receive(:new).twice.with(category_name).and_return(category) }

    describe '#categories' do
      subject { Portfolio::Data.new.categories }

      its(:first) { should == category }
      its(:size) { should == 1 }
    end

    describe '#find_by_slug' do
      subject { Portfolio::Data.new.find_by_slug category_slug }

      it { should == category }
    end
  end
end
