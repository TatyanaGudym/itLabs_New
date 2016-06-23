require 'faker'

class Cards

  attr_reader :comments, :current_list, :cards, :done_list, :checklist

  def initialize
    @card_name =  Faker::Lorem.sentence
    @checklist_item = Faker::Lorem.sentence
    @current_list = []
    @checklist = []
    @comments = []
    @new_list = []
    @cards = []
  end

  def to_s
    string = "Card name: #{@card_name}\n"
    string << "--------------------------\n"
    string
  end

  def create_new_card(list)
    new_card =  Cards.new
    @current_list = list
    @cards << new_card
  end

  def add_checklist(string)
    @checklist_item = string
    @checklist << @checklist_item
  end

  def add_new_comment(comment)
    @write_comment = comment
    @comments << comment
  end


  def delete_comment(comment)
    @comments.delete(comment)
  end

  def move_to_another_list(new_list)
   @current_list = new_list
  end

  def show_cards_in_list(list)
    cards_in_list = @cards.find {|card| card.current_list == list}
    puts cards_in_list
  end

end