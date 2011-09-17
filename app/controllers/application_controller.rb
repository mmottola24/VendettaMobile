class ApplicationController < ActionController::Base
  protect_from_forgery

  require 'httparty'

  def get_hockey_data filename

    json = HTTParty.get 'http://bhocks.michaelencode.com/BHI-Data/data/' + filename + '.json'

    data = JSON.parse json.body

  end

  def get_dates data
    dates = Array.new
    unless data.nil?
      data.each do |date, game|
        dates.push date
      end
    end
    return dates
  end

  def get_games dates, data
    games = Array.new

    unless dates.blank? && data.blank?
      dates.sort!
      dates.each do |day|
        data[day].each do |game|
          games.push game
        end
      end
    end

    return games

  end

end
