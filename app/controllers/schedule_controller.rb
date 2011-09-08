class ScheduleController < ApplicationController
  def index
    @title = 'League Schedule'
    @page = 'league_schedule'

    data = get_hockey_data 'league_schedule'

    dates = (get_dates data['regular']) + (get_dates data['playoffs'])

    @dates = dates.sort

    @games = data['regular'].merge(data['playoffs'])

    respond_to do |format|
      format.html { render 'pages/league_schedule' }
      format.json { render :json => data }
    end

  end

  def team
    @title = 'Team Schedule'
    @page = 'team_schedule'

    data = get_hockey_data 'vendetta_schedule'

    reg_dates = get_dates data['regular']

    playoff_dates = get_dates data['playoffs']

    @games = (get_games reg_dates, data['regular']) + (get_games playoff_dates, data['playoffs'])

    respond_to do |format|
      format.html { render 'pages/team_schedule' }
      format.json { render :json => data }
    end

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
