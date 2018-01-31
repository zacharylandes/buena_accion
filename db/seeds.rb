# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    response = Faraday.get("https://api.data.charitynavigator.org/v2/Organizations?app_id=6c5afdb1&app_key=ad13a8a763f17abfe983f8fe3619a22e&state=CO&city=denver&minRating=3&sizeRange=1")
    @response = JSON.parse(response.body)
    @response.map do |charity|
      address = [charity['mailingAddress']['stateOrProvince'], charity['mailingAddress']['city'],charity['mailingAddress']['postalCode'],charity['mailingAddress']['streetAddress1']]
      Organization.create!(name: charity['charityName'], address: address)
    end
