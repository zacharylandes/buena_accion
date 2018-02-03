require 'rails_helper'
describe Organization do
  it  'exists ' do
    org = Organization.create

    expect(org).to  be_a Organization
  end
  it 'has a lat and long' do
    VCR.use_cassette("user has a lat ") do

    User.create!(name:"zach")
    Category.create(name:"food")
    Organization.create!(
      name:"Winters Health care",
      state: 'ca',
      city: 'winters',
      address: "454 Russell st.",
      user_id: User.first.id
      )

    expect(Organization.last['latitude']).to_not be_nil
    expect(Organization.last['longitude']).to_not be_nil

  end
  end
end
