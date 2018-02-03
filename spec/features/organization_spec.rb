require 'rails_helper'
describe Organization do
  it  'exists ' do
    org = Organization.create

    expect(org).to  be_a Organization
  end
end
