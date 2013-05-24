# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  content     :text             not null
#  title       :string(255)      not null
#  description :text             not null
#  permalink   :string(255)      not null
#  source      :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'
require 'test_helper'

describe Article do
  let(:article) { FactoryGirl.create(:article) }
  let(:first) { FactoryGirl.create(:article) } 
  let(:second) { FactoryGirl.create(:article) } 

  subject { article }

  context 'is respond and valid' do 
    it { should respond_to(:title) }
    it { should respond_to(:content) }
    it { should respond_to(:description) }
    it { should respond_to(:permalink) }
    it { should respond_to(:source) }

    it { should be_valid }
  end

  it 'default order by created_at' do
    first
    second
    expect(Article.all).to eq([second, first])
  end

  it 'have right to_param' do
    article.permalink = 'test'
    article.to_param.should eq "#{article.id}-test"
  end
  
  context 'is not valid' do
    it 'without title' do
      article.title = ''
      should be_invalid
    end

    it 'without content' do
      article.content = ''
      should be_invalid
    end

    it 'without description' do
      article.description = ''
      should be_invalid
    end

    it 'without permalink' do
      article.permalink = ''
      should be_invalid
    end

    it 'without source' do
      article.source = ''
      should be_invalid
    end
  end

  context 'source url' do
    ok = %w{ http://www.example.com/ https://example.com www.example.com example.com }
    bad = %w{ example www_example_com }

    ok.each do |url|
      it "'#{url}' valid" do
        article.source = url
        should be_valid
      end
    end

    bad.each do |url|
      it "'#{url}' is not valid" do
        article.source = url
        should be_invalid
      end
    end
  end  
end
