class HomeController < ApplicationController

  def index
    @title = "Vendetta"
    @page = "pages"

    render 'pages/index'

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

  def league_stats
    @title = "League Stats"
    respond_to do |format|
      format.html
    end
  end

end
