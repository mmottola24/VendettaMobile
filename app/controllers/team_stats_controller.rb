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

    #get regular season stats
    regular_stats = Hash.new
    unless data['stats']['regular']['player'].nil?
      player_stats = Array.new
      data['stats']['regular']['player'].each do |key, value|
        player_stats[key.to_i] = value
      end
      goalie_stats = Array.new
      data['stats']['regular']['goalie'].each do |key, value|
        goalie_stats[key.to_i] = value
      end
      regular_stats[:player] = player_stats
      regular_stats[:goalie] = goalie_stats
    end

    #Get playoff stats
    playoff_stats = Hash.new
    unless data['stats']['playoffs']['player'].nil?
      player_stats = Array.new
      data['stats']['playoffs']['player'].each do |key, value|
        player_stats[key.to_i] = value
      end
      goalie_stats = Array.new
      data['stats']['playoffs']['goalie'].each do |key, value|
        goalie_stats[key.to_i] = value
      end
      playoff_stats[:player] = player_stats
      playoff_stats[:goalie] = goalie_stats
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
