require 'spec_helper'

describe 'photo.slim' do
  let(:photo) { Photo.new 'title', 'http://src/' }

  subject { render 'photo.slim', :@photo => photo }

  it { should include %Q{<title>#{photo.title}</title>} }
  it { should include %Q{<h1 id="title">#{photo.title}</h1>} }
  it { should include %Q{<img id="photo" src="#{photo.src}" />} }
end