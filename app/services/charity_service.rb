class CharityService
  def connection(client_id,client_secret,state, city)
   response = Faraday.get("https://api.data.charitynavigator.org/v2/Organizations?app_id=#{client_id}&app_key=#{client_secret}&state=#{state}&city=#{city}&minRating=3&sizeRange=1")
    if response.status == 200
      get_json(JSON.parse(response.body))
    else
       flash[:notice]  = "that doesn't seem to exist "
    end
  end

  def get_json(response)
    response.map do |charity|
      address = [charity['mailingAddress']['stateOrProvince'], charity['mailingAddress']['city'],charity['mailingAddress']['postalCode'],charity['mailingAddress']['streetAddress1']]
      Organization.find_or_create_by(name: charity['charityName'],
        city: charity[ 'mailingAddress']['city'],
        address: address,
        score: charity['currentRating']['score'],
        stars: charity['currentRating']['ratingImage']['large'],
        cause_image: charity['category']['image'],
        mission: charity['mission'],
        url: charity['websiteURL'],
        cat_name:  charity['category']['categoryName'])
      end
  end
end
