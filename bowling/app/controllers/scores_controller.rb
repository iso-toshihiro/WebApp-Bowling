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
    @name = params[:player_name]
    @date = params[:game_date]
    @down_pins = params[:down_pin]
    get_scores = Score_calcuration.new (@down_pins)
    get_scores.calcurate_scores
    @total = get_scores.scores
  end

  def display_score
  end

  def update
  end

  def destroy
  end
end
