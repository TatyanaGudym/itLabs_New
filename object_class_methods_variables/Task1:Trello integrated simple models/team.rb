require 'faker'

class Team

  attr_reader :teams, :members

  def initialize
    @name = Faker::Name.name
    @description = Faker::Lorem.sentence
    @teams = []
    @members = []
  end


  def add_user_to_team(user)
    @members << user
  end

  def to_s
    string = "Team name: #{@name}\n"
    string << "Description: #{@description}\n"
    string << "---------------------------\n"
    string
  end

end