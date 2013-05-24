require "spec_helper"

describe "routes for Articles" do
  it "routes /articles" do
    { :get => "/articles" }.
      should route_to(controller: "articles", action: "index")
  end

  it "routes articles/id" do
    { :get => "/articles/10-some-permalink" }.
    should route_to(
      controller: "articles",
      action: "show",
      id: "10-some-permalink"
    )
  end

  it "does not route to create" do
    { post: "/articles" }.should_not be_routable
  end

  it "does not route to update" do
    { put: "/articles/10-some-permalink" }.should_not be_routable
  end

  it "does not route to delete" do
    { delete: "/articles/10-some-permalink" }.should_not be_routable
  end
end