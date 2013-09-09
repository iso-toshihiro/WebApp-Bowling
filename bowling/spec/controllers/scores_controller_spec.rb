# coding: utf-8
require 'spec_helper'

describe ScoresController do
  describe "GET new" do
    before do
      get :new, from: ''
    end

    it "プレイヤーの名前は’ユーザー’" do
      assigns(:player_name).should == 'ユーザー'
    end

    it "日付は’2013-08-25 12:00:00’" do
      assigns(:game_date).should == '2013-08-25 12:00:00'
    end

    it "テンプレートはnew" do
      response.should render_template('new')
    end
    
  end

end

