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

describe Article do
  pending "add some examples to (or delete) #{__FILE__}"
end
