require 'score_calcuration'

class ScoresController < ApplicationController
  def index
    @scores = Score.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def confirm
    @name = params[:player_name]
    if params[:current_time] == "on"
      @date = Time.now
    else
      @date = params[:game_date]
    end
    @down_pins = params[:down_pin]
    get_scores = Score_calcuration.new (@down_pins)
    get_scores.calcurate_scores
    @total = get_scores.scores
  end

  def update
  end

  def destroy
  end
end
