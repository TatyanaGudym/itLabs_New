require 'faker'

class Boards

  def initialize
    @title = Faker::Lorem.sentence
    @lists = []
    @cards = []
  end


  def to_s
    string = "Board title: #{@title}\n"
    string << "----------------------\n"
    string
  end


end