require 'rails_helper'
describe User do
  it 'finds a user with omniauth' do
    user = User.create({
    provider: "google",
    uid: "12345678910",
    name: 'Jesse',
    oauth_token: 'abcdefg12345',
    oauth_expires_at: DateTime.now})

    fake_user = OpenStruct.new({
      provider: "google",
      uid: "12345678910",
      info: OpenStruct.new({
        email: "jesse@mountainmantechnologies.com",
        name: "Jesse",
        last_name: "Spevack"
      }),
      credentials: OpenStruct.new({
        token: "abcdefg12345",
        refresh_token: "12345abcdefg",
        expires_at: DateTime.now,
      })
    })

    found_user =  User.from_omniauth(fake_user)

    expect(found_user.name).to eq('Jesse')

  end
end
