class OrgSearchService
  def initialize
  end

  def search(param)
    if param['name']
      Organization.where('name LIKE ?', "%#{param['name']}%")
    elsif  param['state']
      state =  param['state'].downcase
      Organization.where('name LIKE ?', "%#{state}%")
    elsif  param['city']
      state =  param['city'].downcase
      Organization.where('name LIKE ?', "%#{city}%")
    end
  end
end
