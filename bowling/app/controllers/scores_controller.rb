class ScoresController < ApplicationController
  def index
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
  end

  def display_score
  end

  def update
  end

  def destroy
  end
end
