require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

RSpec.describe UsersHelper, type: :helper do
  describe '#full_name' do
    it 'returns the full name of the user' do
      user = double('User', first_name: 'Test', last_name: 'User')
      expect(helper.full_name(user)).to eq('Test User')
    end
  end
end
