class ScheduleController < ApplicationController
  def index
    @title = 'League Schedule'
    @page = 'league_schedule'

    data = get_hockey_data 'league_schedule'

    dates = (get_dates data['regular']) + (get_dates data['playoffs'])

    @dates = dates.sort

    if data['playoffs'].nil?
      @games = data['regular']
    else
      @games = data['regular'].merge(data['playoffs'])
    end

    respond_to do |format|
      format.html { render 'pages/league_schedule' }
      format.json { render :json => @games }
    end

  end

  def team
    @title = 'Team Schedule'
    @page = 'team_schedule'

    data = get_hockey_data 'vendetta_schedule'

    reg_dates = get_dates data['regular']

    playoff_dates = get_dates data['playoffs']

    @dates = reg_dates + playoff_dates

    @games = (get_games reg_dates, data['regular']) + (get_games playoff_dates, data['playoffs'])

    respond_to do |format|
      format.html { render 'pages/team_schedule' }
      format.json { render :json => @dates }
    end

  end

end
