require 'spec_helper'
require 'test_helper'

describe StaticPagesController do

  describe "#home" do
    it "responds successfully with an HTTP 200 status code" do
      get :home
      response.should be_success
      response.code.should eq('200')
    end

    it "renders the home template" do
      get :home
      response.should render_template('home')
    end

    it 'is show 3 articles on page' do
      articles = 40.times { FactoryGirl.create(:article) }

      get :home
      controller.articles.size.should eq(3)
    end
  end

  describe '#search' do
    it "responds successfully with an HTTP 200 status code" do
      get :search
      response.should be_success
      response.code.should eq('200')
    end

    it "renders the search template" do
      get :search
      response.should render_template('search')
    end
  end
end
