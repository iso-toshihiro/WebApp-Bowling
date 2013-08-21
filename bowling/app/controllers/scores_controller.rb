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
    pins =  params[:dawn_pin]
    @total = pins[0].to_i + pins[1].to_i + pins[2].to_i + pins[3].to_i
  end

  def display_score
  end

  def update
  end

  def destroy
  end
end
