require 'spec_helper'

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
  end

end
