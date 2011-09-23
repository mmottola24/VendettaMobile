class HomeController < ApplicationController

  def index
    @title = "Vendetta"
    @page = "home"

    data = get_hockey_data 'vendetta_schedule'

    reg_dates = get_dates data['regular']

    playoff_dates = get_dates data['playoffs']

    @games = (get_games reg_dates, data['regular']) + (get_games playoff_dates, data['playoffs'])

    render 'pages/index'

  end

end
