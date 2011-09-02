class ScheduleController < ApplicationController
  def index
    @title = 'League Schedule'
    @page = 'league_schedule'

    data = get_hockey_data 'league_schedule'


  end

  def team
    @title = 'Team Schedule'
    @page = 'team_schedule'

    data = get_hockey_data 'vendetta_schedule'

    dates = Array.new
    games = Array.new

    unless data['regular'].nil?
      data['regular'].each do |date, game|
        dates.push date
      end

      unless dates.blank?
        dates.sort!
        dates.each do |day|
          data['regular'][day].each do |game|
            games.push game

          end
        end
      end

    end

    dates = Array.new

    unless data['playoffs'].nil?
      data['playoffs'].each do |date, game|
        dates.push date
      end

      unless dates.blank?
        dates.sort!
        dates.each do |day|
          data['playoffs'][day].each do |game|
            game['season'] = "playoffs"
            games.push game
          end
        end
      end
    end
            ap games
    @games = games

    respond_to do |format|
      format.html { render 'pages/team_schedule' }
      format.json { render :json => data }
    end

  end

end
