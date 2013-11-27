require 'spec_helper'

describe Presenters::Claim::SocialLandlord do
  it 'can be initialized' do
    expect { Presenters::Claim::SocialLandlord.new }.to_not raise_error
  end

  it 'accepts nested attributes' do
    data = {
      property: create(:property)
    }
    p = Presenters::Claim::SocialLandlord.new(data)
  end
end