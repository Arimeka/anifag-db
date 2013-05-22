# coding: utf-8
describe "the home page" do
  it "contains" do
    visit '/'

    page.should have_content "Последние новости"
    page.should have_content "Последние добавления в базу"
  end
end