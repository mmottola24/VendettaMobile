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
        if check_date date
          dates.push date
        end
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
          if check_game game
            games.push game
          end
        end
      end
    end

    return games

  end

  def check_date date
    date1 = "2011-06-23"
    time = "8:20 pm"
    now = Time.parse(date1 + ' ' + time)

    tmp_date = now.strftime("%Y-%m-%d")

    if (date >= tmp_date)
      return true
    else
      return false
    end
  end

  def check_game game
    date = "2011-06-23"
    time = "10:20 pm"

    now = Time.parse(date + ' ' + time)
    gametime = Time.parse(game['date'] + ' ' + game['end_time'])

    if (gametime >= now)
      return true
    else
      return false
    end
  end


end
