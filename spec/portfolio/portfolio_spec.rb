require 'spec_helper'

describe Portfolio::Portfolio do
  first_photo = {'title' => 'First Photo', 'src' => 'photo_src_1', 'thumb' => 'thumb_1', 'id' => 'photo_1', 'category' => 'Scenic'}
  second_photo = {'title' => 'Second Photo', 'src' => 'photo_src_2', 'thumb' => 'thumb_2', 'id' => 'photo_2', 'category' => 'Scenic'}
  other_photo = {'title' => 'Other Photo', 'src' => 'photo_src_other', 'thumb' => 'thumb_3', 'id' => 'photo_other', 'category' => 'Other'}

  photos = { 'photos' => [first_photo, second_photo, other_photo] }

  before { YAML.stub(:load_file).with('portfolio.yml').and_return(photos) }

  describe 'photo-related methods ' do
    describe '#photos' do
      subject { Portfolio::Portfolio.new.photos }

      its(:size) { should == 3 }
    end

    describe '#find_photo_by_id' do
      photos['photos'].each do |photo|
        describe photo['id'] do
          subject { Portfolio::Portfolio.new.find_photo_by_id(photo['id']) }

          its(:title) { should == photo['title'] }
          its(:src) { should == photo['src'] }
          its(:thumb) { should == photo['thumb'] }
          its(:id) { should == photo['id'] }
          its(:category) { should == photo['category'] }
        end
      end
    end

    describe '#find_photos_by_category' do
      describe 'Scenic' do
        subject { Portfolio::Portfolio.new.find_photos_by_category('Scenic') }

        its(:size) { should == 2 }

        describe '#first' do
          subject { Portfolio::Portfolio.new.find_photos_by_category('Scenic').first }

          its(:title) { should == first_photo['title'] }
        end

        describe '#last' do
          subject { Portfolio::Portfolio.new.find_photos_by_category('Scenic').last }

          its(:title) { should == second_photo['title'] }
        end
      end
    end
  end

  describe 'category-related methods ' do
    describe '#categories' do
      subject { Portfolio::Portfolio.new.categories }

      its(:size) { should == 2 }
    end

    describe '#find_category_by_slug' do
      photos['photos'].map { |photo| Portfolio::Category.new(photo['category']) }.each do |category|
        describe category.slug do
          subject { Portfolio::Portfolio.new.find_category_by_slug(category.slug) }

          its(:title) { should == category.title }
        end
      end
    end
  end
end