class ResultsController < ApplicationController

  def index
    @title = "Scores"
    @page = "results"

    @results = get_hockey_data "results"

    respond_to do |format|
      format.html { render 'pages/results' }
      format.json { render :json => @results }
    end
  end

end
