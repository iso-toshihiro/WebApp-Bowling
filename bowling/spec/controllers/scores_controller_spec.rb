# -*- coding: utf-8 -*-
# coding : utf-8

require 'spec_helper'

describe ScoresController do
  fixtures :scores

  describe 'GET index' do

    before do
      get :index
      @record = scores(:sample_1, :sample_2, :sample_3)
    end
    
    it 'インデックスが@scoresに渡されている' do
      assigns(:scores).should == @record
    end
  end

  describe 'GET index sort' do
    it 'スコアが高い順にインデックスが@scoresに渡される' do
      get :index, sort: 'sort_score_desc'
      @record = scores(:sample_2, :sample_3, :sample_1)
      assigns(:scores).should == @record
    end

    it 'スコアが低い順にインデックスが@scoresに渡される' do
      get :index, sort: 'sort_score_asc'
      @record = scores(:sample_1, :sample_3, :sample_2)
      assigns(:scores).should == @record
    end
    
  end

  describe 'GET new' do
    before do
      get :new, from: ''
    end

    it 'プレイヤーの名前は’ユーザー’' do
      assigns(:player_name).should == 'ユーザー'
    end

    it '日付は’2013-08-25 12:00:00’' do
      assigns(:game_date).should == '2013-08-25 12:00:00'
    end

    it 'テンプレートはnew' do
      response.should render_template('new')
    end
  end
    
  describe 'GET new from confirm' do
    before do
      down_pins = 
      get :new, :from=>'confirm', :player_name=>'iso', :game_date=>'2014-11-03 05:33:12', :down_pins=>down_pins

    it 'プレイヤーの名前は’ユーザー’' do
      assigns(:player_name).should == 'iso'
    end

    it "日付は’2014-11-03 05:33:12’" do
      assigns(:game_date).should == '2014-11-03 05:33:12'
    end

    it 'テンプレートはnew' do
      response.should render_template('new')
    end 
  end

end
