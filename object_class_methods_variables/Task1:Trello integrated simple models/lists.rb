require 'faker'

class Lists
  def initialize
    @list_name = Faker::Lorem.sentence
    @cards = []
    @checklist = []
    @comments = []
    @done_cards = []

  end

  def to_s
    string = "List name: #{@list_name}\n"
    string << "-------------------------\n"
    string
  end




  def create_new_list(list_name)
    new_list = Lists.new
    @list_name = list_name
  end

end

