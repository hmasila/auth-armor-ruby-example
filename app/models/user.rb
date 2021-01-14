# frozen_string_literal: true

class User < ApplicationRecord

  GENDERS = ['male', 'female']

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :age, presence: true

  # validates gender includes GENDERS if gender is provided
end
