# coding: utf-8
describe "the home page" do
  it "contains" do
    visit '/'

    page.should have_content "Последние новости"
    page.should have_content "Последние добавления в базу"
  end
end

feature "Search articles" do
  scenario "Search articles correct information" do
    visit '/search'
    check('Искать только статьи')
    within('.search-text') do
      fill_in('query', :with => 'Lorem')
    end
    click_button('Искать!')

    page.should have_content "Lorem"
  end
end