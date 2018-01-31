class OrganizationsController < ApplicationController

  def index
    @organization = Organization.new
    @orgs = Organization.all.paginate(:page => params[:page])
  end

  def create
    state = params['organization']['state'].upcase
    city = params['organization']['city'].downcase
    response = Faraday.get("https://api.data.charitynavigator.org/v2/Organizations?app_id=#{ENV['client_id']}&app_key=#{ENV['client_secret']}&state=#{state}&city=#{city}&minRating=3&sizeRange=1")
    if response.status == 200
    @response_body = JSON.parse(response.body)
        @response_body.map do |charity|
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
      else
        flash[:notice]  = "that doesn't seem to exist "
      end
      redirect_to organizations_path
    end

  def show
    @org = Organization.find(params[:id])
  end

end
