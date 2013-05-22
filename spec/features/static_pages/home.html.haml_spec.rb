# coding: utf-8
describe "the home page" do
  it "contains" do
    visit '/'

    page.should have_content "Последние новости"
    page.should include '<a href="#"><h3>Lorem Ipsum</h3></a>'
    page.should include '<p>
                          Lorem ipsum dolor sit amet, consectetur 
                          adipiscing elit. Duis dapibus tincidunt 
                          blandit. Pellentesque ut augue nisl, eu 
                          laoreet nunc. Donec aliquet ante sed massa 
                          tempor eget consectetur diam sagittis. 
                          Curabitur nec justo metus. Nam at orci orci. 
                          Aliquam rutrum risus nibh, ac eleifend quam. 
                          Sed tincidunt feugiat nunc non iaculis. 
                        </p>'
    page.should include '<a href="#">Читать дальше</a>'

    page.should have_content "Последние добавления в базу"
  end
end