require 'spec_helper'

describe Portfolio::Data do
  let(:photo) { {'title' => 'Photo Title', 'src' => 'photo_src', 'id' => 'photo_id', 'category' => 'Scenic'} }
  let(:photos) { { 'photos' => [photo] } }

  before do
    YAML.should_receive(:load_file).with('portfolio.yml').and_return(photos)
  end

  describe '#photos' do
    subject { Portfolio::Data.new.photos }

    its(:size) { should be 1 }

    describe 'photo' do
      subject { Portfolio::Data.new.photos.first }

      its(:title) { should be photo['title'] }
      its(:src) { should be photo['src'] }
      its(:id) { should be photo['id'] }
      its(:category) { should be photo['category'] }
    end
  end

  describe '#find_by_id' do
    subject { Portfolio::Data.new.find_by_id(photo['id']) }

    its(:title) { should be photo['title'] }
    its(:src) { should be photo['src'] }
    its(:id) { should be photo['id'] }
    its(:category) { should be photo['category'] }
  end

  describe '#categories' do
    let(:photos) { {'photos' => [{'category' => 'ABC'}, {'category' => 'ABC'}]} }

    subject { Portfolio::Data.new.categories }

    its(:first) { should == 'ABC' }
    its(:size) { should == 1 }
  end
end
