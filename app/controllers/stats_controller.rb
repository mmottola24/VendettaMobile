class StatsController < ApplicationController

  def index

    @title = "Team Stats"
    @page = "stats"

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

  def league
    @title = "League Stats"
    $page = "league_stats"

    type =  params[:type]

    if type.nil? or type.blank?
      type = 'all'
    end

    data = get_hockey_data('regular_stats')

    @data = Hash.new

    if type == 'all'
      @categories = ['pts','g', 'a']
      @categories.each do |category|
        @data[category] = list_category data, category, 5
      end

    else
      @data[type.to_s] = list_category data, type, 0
      @categories = [type]
    end

    @type = type

    respond_to do |format|
      format.html { render 'pages/league_stats' }
    end
  end

  def list_category data, type, limit
    rows = Array.new
    data["stats"][type.to_s].each do |key, player|
      unless player.nil?
        key = key.to_i
        if limit == 0 || key <= limit
          rows[key - 1] = player
        end
      end
    end

    rows

  end


end
