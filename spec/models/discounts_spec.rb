require 'rails_helper'

RSpec.describe Discount do
  describe 'associations' do
    it {should belong_to :merchant}
  end
end 
