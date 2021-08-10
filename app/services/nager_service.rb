class NagerService

  def self.get_data(endpoint) 
    connection = Faraday.new(endpoint)
    response = connection.get '/api/v3/NextPublicHolidays/US'
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.holiday
    endpoint = "https://date.nager.at"
    get_data(endpoint)
  end 

  def self.create_holidays 
    holiday[0..2].map do |h|
      Holiday.new(h)
    end 
  end
end  