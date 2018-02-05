class OrgSearchService

  def search(param)
    if !param['name'].empty?
      name = param['name'].capitalize
      Organization.where('name LIKE ?', "%#{name}%")
    elsif  !param['state'].empty?
      state =  param['state'].downcase
      Organization.where('state LIKE ?', "%#{state}%")
    elsif  !param['city'].empty?
      city =  param['city'].capitalize
      Organization.where('city LIKE ?', "%#{city}%")
    else
      Organization.joins(:needs).where('needs.name LIKE ?', "%#{param['needs']}%")
    end
  end

  def order(param)
    if param == "city" || param == "name"
     Organization.joins(:needs).order("#{param} ASC")
   elsif param == "needs.name" || param == "needs.amount"
     Organization.joins(:needs).order("#{param} DESC ")
   end
  end
end
