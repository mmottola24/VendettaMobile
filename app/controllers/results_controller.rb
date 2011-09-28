class ResultsController < ApplicationController

  def index
    @title = "Scores"
    @page = "results"

    @results = get_hockey_data "results"

    dates = Array.new
    unless @results.nil?
      @results.each do |date, games|
        dates.push date
      end
      dates.sort! # because i cant reply on the order of @results
      dates.reverse!
    end

    @dates = dates

    respond_to do |format|
      format.html { render 'pages/results' }
      format.json { render :json => @results }
    end
  end

end
