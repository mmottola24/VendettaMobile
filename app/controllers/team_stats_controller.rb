class TeamStatsController < ApplicationController

  def index

    @title = "Team Stats"
    @page = "team_stats"

    data = get_hockey_data 'team_stats'

    seasons = Array.new

    unless data['stats']['regular'].blank?
      seasons.push 'regular'
    end

    unless data['stats']['playoffs'].blank?
      seasons.push 'playoffs'
    end

    regular_stats = Array.new
    unless data['stats']['regular']['player'].nil?
      data['stats']['regular']['player'].each do |key, value|
        regular_stats[key.to_i] = value
      end
    end

    playoff_stats = Array.new
    unless data['stats']['playoffs']['player'].nil?
      data['stats']['playoffs']['player'].each do |key, value|
        playoff_stats[key.to_i] = value
      end
    end

    @seasons = seasons
    @regular_stats = regular_stats
    @playoff_stats = playoff_stats

    if data['stats']['playoffs'].blank?
      @current_season = 'regular'
    else
      @current_season = 'playoffs'
    end

    respond_to do |format|
      format.html { render 'pages/team_stats' }
      format.json { render :json => data }
    end

  end

end
