class StandingsController < ApplicationController

  def index

    @title = "Standings"
    @page = "standings"

    data = get_hockey_data 'standings'  #see application controller

    seasons = Array.new

    if !data['standings']['regular'].blank?
        seasons.push 'regular'
    end

    if !data['standings']['playoffs'].blank?
        seasons.push 'playoffs'
    end

    playoff_standings = Array.new
    unless data['standings']['playoffs'].nil?
      data['standings']['playoffs'].each do |key, value|
        playoff_standings[key.to_i] = value
      end
    end

    regular_standings = Array.new
    unless data['standings']['regular'].nil?
      data['standings']['regular'].each do |key, value|
        regular_standings[key.to_i] = value
      end
    end

    @seasons = seasons
    @playoff_standings = playoff_standings
    @regular_standings = regular_standings
    @current_season = data['league']
    @current_division = data['division']

    respond_to do |format|
      format.html { render 'pages/standings' }
      format.json { render :json => data.to_json }
    end

  end

end
