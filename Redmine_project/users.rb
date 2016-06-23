require 'faker'

class Users

  attr_reader :users, :first_name, :password, :username, :last_name, :email

  def initialize
    @username = Faker::Name.first_name
    @first_name = Faker::Name.first_name
    @last_name = Faker::Name.last_name
    @password = Faker::Internet.password
    @email = Faker::Internet.email(@first_name)
    @users = []
  end


end