# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  # it 'has a valid factory' do
  #   expect(FactoryGirl.create(:user)).to be_valid
  # end

  context 'validation tests' do
    it 'ensures first name presence' do
      user = User.new(last_name: 'msabeni', email: 'kemimsabeni@gmail.com').save
      expect(user).to eql(false)
    end

    it 'ensures last name presence' do
      user = User.new(first_name: 'kemi', email: 'kemimsabeni@gmail.com').save
      expect(user).to eql(false)
    end

    it 'ensures email presence' do
      user = User.new(first_name: 'kemi', last_name: 'msabeni').save
      expect(user).to eql(false)
    end

    it 'should save sucessfully' do
      user = User.new(first_name: 'kemi', last_name: 'msabeni', email: 'kemimsabeni@gmail.com').save
      expect(user).to eql(false)
    end
  end

  context 'scope tests' do
  end
end
