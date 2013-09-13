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
    
    it 'インデックスが表示される' do
      #p assigns(:scores) #配列で表示される
      #p @record
      assigns(:scores).should == @record
    end
    
  end

  describe 'GET index sort' do

    before do
      get :index, sort: 'sort_score'
      @record = scores(:sample_2, :sample_3, :sample_1)
      
    end
    
    it 'スコア順に表示される' do
      assigns(:scores).should == @record
    end
    
  end


end
