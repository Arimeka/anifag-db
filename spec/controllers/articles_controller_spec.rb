# coding: utf-8
require 'spec_helper'

describe ArticlesController do
  describe "#index" do    
    it "responds successfully with an HTTP 200 status code" do
      get :index
      response.should be_success
      response.code.should eq('200')
    end

    it "renders the show template" do
      get :index
      response.should render_template('index')
    end

    it "loads all articles with default order" do
      first, second = FactoryGirl.create(:article), FactoryGirl.create(:article)
      get :index

      controller.articles.should eq([second, first])
    end

    it 'is paginate 10 articles per page' do
      articles = 40.times { FactoryGirl.create(:article) }

      get :index
      controller.articles.size.should eq(10)
    end
  end

  describe '#show' do
    let(:article) { FactoryGirl.create(:article) }
    
    it "responds successfully with an HTTP 200 status code" do
      get :show, id: article
      response.should be_success
      response.code.should eq('200')
    end

    it "renders the show template" do
      get :show, id: article
      response.should render_template('show')
    end
  end
end
