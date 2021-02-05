class Message < ApplicationRecord
  attr_accessor :name, :email, :phone_number, :message
  validates :name, :email, :message, presence: true
end
