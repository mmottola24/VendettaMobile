class HomeController < ApplicationController

  def index
    @title = "Vendetta"
    @page = "home"

    data = get_hockey_data 'vendetta_schedule'

    reg_dates = get_dates data['regular']

    playoff_dates = get_dates data['playoffs']

    @games = (get_games reg_dates, data['regular']) + (get_games playoff_dates, data['playoffs'])

    #Get latest around the league
    @results = get_hockey_data 'results'

    dates = Array.new
    unless @results.nil?
      @results.each do |date, games|
        dates.push date
      end
      dates.sort! # because i cant reply on the order of @results
      dates.reverse!
    end

    @dates = dates

    render 'pages/index'

  end

end
