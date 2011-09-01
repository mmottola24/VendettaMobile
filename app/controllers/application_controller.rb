class ApplicationController < ActionController::Base
  protect_from_forgery

  require 'httparty'

  def get_hockey_data filename

    json = HTTParty.get 'http://bhocks.michaelencode.com/BHI-Data/data/' + filename + '.json'

    data = JSON.parse json.body

  end

end
