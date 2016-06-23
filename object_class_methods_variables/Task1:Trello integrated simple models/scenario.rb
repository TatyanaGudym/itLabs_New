#users
#boards
#lists
#cards
#comments
#Create 10 any unit tests for this classes and their methods

require_relative "lists"
require_relative "comments"
require_relative "cards"
require_relative "boards"
require_relative "team"
require_relative "users"



#create new user
user = Users.new
user.users << user
puts user.users


# add new user with a name and puts the list of all users
new_user = user.add_new_user("Tanya")
puts "========================"
puts "ALL USERS"
puts "========================"
puts user.users

#create new team
team = Team.new
puts "========================"
puts "THE TEAM"
puts "========================"
puts team

#add user to the team
new_team_user = team.add_user_to_team(new_user)
puts "========================"
puts "TEAM MEMBERS"
puts "========================"
puts team.members


#create new board
board = Boards.new
puts "========================"
puts "BOARDS"
puts "========================"
puts board

#create two new lists
list = Lists.new
done_list = Lists.new

puts "========================"
puts "INITIAL LIST"
puts "========================"
puts list
puts "========================"
puts "DONE LIST"
puts "========================"
puts done_list


#create new card
card = Cards.new
card.cards << card
puts "========================"
puts "CARDS"
puts "========================"
puts card.cards

#create new card for the first list
new_card = card.create_new_card(list)
puts "========================"
puts "CARDs with NEW"
puts "========================"
puts card.cards


#move card to other done_list
card.move_to_another_list(done_list)


#show cards in done_list
puts "========================"
puts "CARDS in DONE"
puts "========================"
card.show_cards_in_list(done_list)


#show crads in initial list
puts "========================"
puts "CARDS in INITIAL LIST"
puts "========================"
card.show_cards_in_list(list)



#add checklist to the card
new_checklist = card.add_checklist("Hello checklist!")
puts "========================"
puts "Checklists"
puts "========================"
puts card.checklist


#create new comment
new_comment = Comments.new
new_comment = card.add_new_comment("Hello this is comment")
puts "========================"
puts "Comments"
puts "========================"
puts card.comments


#delete comment
card.delete_comment("Hello this is comment")
puts "========================"
puts "Comments after delete"
puts "========================"
puts card.comments






