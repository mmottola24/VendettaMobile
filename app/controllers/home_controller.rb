class HomeController < ApplicationController

  def index
    @title = "Vendetta"
    @page = "pages"

    render 'pages/index'

  end

  def league_stats
    @title = "League Stats"
    respond_to do |format|
      format.html
    end
  end

end
