# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Presence validations' do
    specify { should validate_presence_of(:first_name) }
    specify { should validate_presence_of(:last_name) }
    specify { should validate_presence_of(:email) }
    specify { should validate_presence_of(:age) }
  end

  describe "Inclusion validations" do
    specify { should validate_iclusion_of(:GENDERS) }
  end

  # USE THIS DOCUMENTATION
  # https://matchers.shoulda.io/docs/v4.5.0/
  

end
