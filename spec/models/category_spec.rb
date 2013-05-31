# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Category do
  let(:category) { FactoryGirl.create(:category) }

  subject { category }

  context 'is respond and valid' do 
    it { should respond_to(:title) }
    it { should respond_to(:name) }
    it { should respond_to(:articles) }

    it { should be_valid }
  end
  
  context 'is not valid' do
    it 'without title' do
      category.title = ''
      should be_invalid
    end

    it 'without name' do
      category.name= ''
      should be_invalid
    end
  end
end
