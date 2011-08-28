class HomeController < ApplicationController
  require 'httparty'
  def index
    @title = "Vendetta"
  end

  def standings
    @title = "Standings"

    json = HTTParty.get 'http://bhocks.michaelencode.com/BHI-Data/data/standings.json'

    @data = JSON.parse json.body

    seasons = Array.new

    if !@data['standings']['regular'].blank?
        seasons.push 'regular'
    end

    if !@data['standings']['playoffs'].blank?
        seasons.push 'playoffs'
    end

    playoff_standings = Array.new
    @data['standings']['playoffs'].each do |key, value|
      playoff_standings[key.to_i] = value
    end

    regular_standings = Array.new
    @data['standings']['regular'].each do |key, value|
      regular_standings[key.to_i] = value
    end

    @seasons = seasons
    @playoff_standings = playoff_standings
    @regular_standings = regular_standings
    @current_season = @data['league']
    @current_division = @data['division']

    respond_to do |format|
      format.html
    end
  end

  def team_schedule
    @title = "Team Schedule"
    respond_to do |format|
      format.html
    end
  end

  def league_schedule
    @title = "League Schedule"
    respond_to do |format|
      format.html
    end
  end

  def team_stats
    @title = "Team Stats"
    respond_to do |format|
      format.html
    end
  end

  def league_stats
    @title = "League Stats"
    respond_to do |format|
      format.html
    end
  end

end
