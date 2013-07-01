require 'spec_helper'

describe CategoriesController do
  describe '#show' do
    let(:category) { FactoryGirl.create(:category) }
    
    it "responds successfully with an HTTP 200 status code" do
      get :show, id: category
      response.should be_success
      response.code.should eq('200')
    end

    it "renders the show template" do
      get :show, id: category
      response.should render_template('show')
    end

    it "loads all articles with default order" do
      first, second = FactoryGirl.create(:article), FactoryGirl.create(:article)
      category.articles = [first, second]
      get :show, id: category

      controller.articles.should eq([second, first])
    end

    it 'is paginate 10 articles per page' do
      articles = []
      40.times { articles << FactoryGirl.create(:article) }
      category.articles = articles

      get :show, id: category
      controller.articles.size.should eq(10)
    end
  end
end
