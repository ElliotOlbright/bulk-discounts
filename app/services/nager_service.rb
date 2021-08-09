class NagerService
  def self.holiday
    endpoint = "https://date.nager.at/api/v3/NextPublicHolidays/US"
    get_data(endpoint)
  end 

  def self.get_data(endpoint) 
    response = Faraday.get(endpoint) 
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.create_holidays 
    holiday[0..2].map do |h|
      Holiday.new(h)
    end 
  end
end  