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

end
