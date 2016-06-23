require 'faker'

class Users

  attr_reader :first_name, :users

  def initialize
    @first_name = Faker::Name.first_name
    @email = Faker::Internet.email(@first_name)
    @password = Faker::Internet.password
    @users = []

  end

  def to_s
    string = "First name: #{@first_name}\n"
    string << "Email: #{@email}\n"
    string << "Password: #{@password}\n"
    string << "--------------------------\n"
    string
  end

  def add_new_user(first_name)
    new_user = Users.new
    @first_name = first_name
    @users << new_user
  end




end