require 'spec_helper'

describe 'photo.slim' do
  let(:inner) { Proc.new {} }
  
  subject { render 'layout.slim', {}, inner }

  it { should include %Q{<title>James Ottaway</title>} }
end
