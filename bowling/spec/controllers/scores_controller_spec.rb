#coding: utf-8
require 'spec_helper'

describe ScoresController do
  fixtures :scores

  describe 'GET index' do

    before do
      get :index
      @record = scores(:exam, :xam)
      
    end
    
    it 'スコア表示' do
      #p assigns(:scores) #配列表示になっている
      #p @record
      assigns(:scores).should == @record
    end
    
  end

  describe 'GET index sort' do

    before do
      get :index
      @record = scores(:xam, :exam)
      
    end
    
    it 'スコア表示' do
      assigns(:scores).should == @record
    end
    
  end


end
