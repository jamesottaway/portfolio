require 'spec_helper'

describe Portfolio::Data do
  let(:photo) { {'title' => 'Photo Title', 'src' => 'photo_src', 'id' => 'photo_id', 'category' => 'Scenic'} }

  before do
    YAML.should_receive(:load_file).with('portfolio.yml').and_return({'photos' => [photo]})
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
end
