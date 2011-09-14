class HomeController < ApplicationController

  def index
    @title = "Vendetta"
    @page = "pages"

    render 'pages/index'

  end

end
