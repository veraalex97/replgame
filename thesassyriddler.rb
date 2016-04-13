#**********to make it look prettier************
def spaces(number_of_spaces)
  number_of_spaces.times do
    puts " ",nil
  end
end
#IMPORTANT NOTE TO PLAYER:
spaces(3)
puts "Before Starting 'The Sassy Riddler' user must have figlet installed"
puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

#*********Banner for the puns Riddle *************
def puns_ban
	system 'figlet Play on Words'
end

system 'figlet The Sassy Riddler'
#***********gets player's input******************************

def wait_for_player
	gets.chomp.downcase.delete(' ')
end

#******************Draw boxes********************************
def box(label)
	puts " |#{label}| "
	puts " --" + "-" * label.length
end

def boxes
	box("Apples")
	spaces(1)
	box("Oranges")
	spaces(1)
	box("Apples+Oranges")
end
#******************* When logic riddle is A or H *************
def answer_hint_logic
logic_riddle = false
hint_counter = 0

until logic_riddle

puts "Type [A] to answer, or [H] for a hint."
spaces (2)
answer = wait_for_player


	if answer == "a"
		puts "Let's hear your answer! Which box should you pick?"
		users_answer_logic = gets.chomp.downcase.delete(' ').gsub("+", "and")
		if users_answer_logic.include? "applesandoranges"
			puts "That's Right!"
			
			logic_riddle = true	
		else
			puts "That's not exactly what I was looking for..."
			logic_riddle = true
		end

	elsif answer == "h"
		if hint_counter < 1
			spaces(2)
		puts "If each box is INCORRECTLY labeled,"
		puts "choosing from a specific box will reveal what it should be labeled."
		boxes
		hint_counter += 1
		elsif hint_counter == 1
			spaces(2)
		puts "I'm gonna be REAL explicit here:"
		boxes
		puts "Neither the apples box nor the oranges box will eliminate doubt with just one fruit picked."	
		hint_counter += 1
		elsif hint_counter == 2
			spaces(5)
			puts "Consider Google. Google is a magical tool."
			spaces(3)
			hint_counter += 1
		else hint_counter == 3
			spaces(9)
			puts "Wow, you are so dense. Let's get on with it, already. It was 'apples and oranges' "
			logic_riddle = true
			hint_counter +=1
		end

	end

end	
end

#**********************************************
def my_pun
	puts "

	   	 'I always run; I never walk.
		I often murmur, but I never talk.
		I have a bed, but I never sleep;
		I have a mouth, but I never eat.'

	"
end
#******************************************************
def puns_hints(response)
	case response 
	when "a"
		
		puts "[A]: Are you an object that can be found inside a house?"
		spaces(4)
		puts "Nope, it would be pretty hard to find me there!"

	when "b"
		puts "[B]: Can you be found in nature?"
		spaces(4)
		puts "Yes, there are plenty of me in nature"
	when "c"
		puts "[C]: Can I hold you in my hand?"
		spaces(4)
		puts "I'd love to be held... but alas, no you cannot."
	when "d"
		puts "[D]: Are you alive?"
		spaces(4)
		puts "What IS 'alive' really?"
		puts "But, no, I cannot claim that I am living by definition."
		
	else
		spaces(2)
		puts "...that"
		spaces(4)
		puts "That wasn't an option!"
	end
end

#*********method for choosing a option*************
	def user_pun (response)
		if response.include? "river" 
			spaces(3)
			system 'figlet CORRECT'
			puts "Alright, I guess YOU know me."
			spaces(1)
			puts "Impressive that a dunce like you could ever guess."
		else 
			spaces(3)
			system 'figlet SORRY'
			puts "What did I say?"
			puts "No one understands me..."
			
		end
	end
#******************* Method for Answer or Hints of pun *************
def answer_hint_pun

pun_riddle = false
hint_counter = 0


until pun_riddle
	my_pun

	puts "Can you guess what I am?"
	puts "Type [A] to answer, or [H] for a hint."
	spaces (2)
answer  = gets.chomp.downcase

	if  answer == "a"
		spaces(3)	
		system 'figlet what am i?'	
		my_pun
		puts "You think you KNOW me?! Ain't NOBODY know me."
		spaces(2)
		puts "Enter your answer:"
		user_pun (wait_for_player)
		pun_riddle = true
		
	elsif answer == "h"
		my_pun
		spaces(2)
		if hint_counter < 2
		puts "I don't blame you. I sound like a lunatic. I mean, I am, but that's not the answer."
		end
		if hint_counter < 6
			
			spaces(2)
			puts "For your hint, you can ask any of these questions to find out what I am."
			spaces(1)
			puts "Choose any of these yes or no questions by pressing [A], [B], [C], or [D]."
			puts "[A]: Are you an object?"
			puts "[B]: Can you be found in nature?"
			puts "[C]: Can I hold you in my hand?"
			puts "[D]: Are you alive?"
			spaces(2)
			puns_hints(wait_for_player)
			hint_counter +=1
			
		else
			spaces(2)
			puts "You must have gone through all the hints possible now."
			puts "I uh... I have places to be, man."
			pun_riddle = true
		end
	end

end

end
puts "Press any key to continue"
wait_for_player
#*********************** Start Game *************************************
spaces(4)
puts '''    
                _______  _        _______  _______  _______  _______   
      |\     /|(  ____ \( \      (  ____ \(  ___  )(       )(  ____ \  
      | )   ( || (    \/| (      | (    \/| (   ) || () () || (    \/  
      | | _ | || (__    | |      | |      | |   | || || || || (__      
      | |( )| ||  __)   | |      | |      | |   | || |(_)| ||  __)     
      | || || || (      | |      | |      | |   | || |   | || (        
      | () () || (____/\| (____/\| (____/\| (___) || )   ( || (____/\  
      (_______)(_______/(_______/(_______/(_______)|/     \|(_______/  
                                                                         '''
puts "Hi there, friend!"
puts "Would you like to play a game with me? (just try to say no)"
spaces(4)


#**********loop until player says yes *****************
continue = false
no_counter = 0

until continue
	
	input = wait_for_player

	case input 
	when "yes"
		spaces(5)
		puts "Wow, you must not have a life."
		puts "Well, me neither! I hope you like riddles..."
		continue = true 
	when "no"
		spaces(9)
		if no_counter < 1
			puts "Did you say 'no'? Oh, my.... Please say 'yes'."
			spaces(2)
			puts "..."
			spaces(2)
			puts "So..."
			spaces(2)
			puts "Would you like to play a game?"
			no_counter += 1
		elsif no_counter == 1
			puts "A bus full of children will go down a cliff unless you say yes."
			spaces(5)
			no_counter +=1
		else
			puts " "
			puts " @_@ "
			puts " "
			puts "You monster!"
			puts "
Well, I don't HAVE a bus full of children, 
so we're just going to play with each other like this never happened...
"			
			puts"        ################################################"
			puts"        ###############                  ###############"
			puts"        ############### ( ..•˘___˘• .. ) ###############"
			puts"        ###############                  ###############"
			puts"        ################################################"
			
			continue = true

		end
	else
		spaces(10)
		puts "That wasn't a clear 'yes' or 'no' so we'll just play, okay?"
		continue = true
	end
end

game_over = false



#***************Player has choice of riddles****************
def riddles_game

spaces(5)
puts " ¯\\_(ツ)_/¯"
puts " "
puts "Would you rather play with logic or with puns?"


option = gets.chomp.downcase.strip


	case option
	when "logic"
		spaces(4)
		puts "________________________________________________ "
	    puts "Ah, a logician."
	    puts "Let's see if you can think you're way through here."
	    puts " "
	    puts "
		'There are three boxes. 
		You cannot see into the boxes. 
		I am your middle man. 
		One is labeled 'APPLES' another is labeled 'ORANGES'. 
		The last one is labeled 'APPLES AND ORANGES'. 
		Each box is labeled incorrectly.
		You're job is to label the boxes correctly.
		:
		I can show you only one fruit from one box.
		This will provide you with enough information
		to label the boxes correctly.
		:
		Which box do you choose for me to pick from?'
	    "
	    answer_hint_logic
	   
		puts "Press [Enter] to continue"
		wait_for_player
		boxes

		puts "Here's the explanation:"
		
		puts "
	The answer is: Take a piece of fruit from the box marked 'apples and oranges'. 
	Suppose the fruit you take is an apple. Then that box must be the box containing 
	just apples. Therefore, the box marked 'oranges' can’t be the box containing just 
	apples, and it can’t be the box containing just oranges either — so it must be the 
	box containing apples and oranges. The remaining box is therefore the box containing 
	just oranges.

	If the fruit you take out is an orange, the solution is derived in a similar 
	fashion: the box marked 'apples and oranges' is the box containing just oranges;
	the box marked 'apples' is the box containing both apples and oranges; and the 
	box marked 'oranges' is the one containing just apples.
			"
		puts "Okay thanks for playing! Start over to play the other riddle!"


	when "puns"
		spaces(4)
		puts "________________________________________________"
		puts "A person of wit, I see! A wordsman."
		puts "Well, Shakespeare, can you answer this?"
	    puts "

	   	 'I always run; I never walk.
		I often murmur, but I never talk.
		I have a bed, but I never sleep;
		I have a mouth, but I never eat.'

	"
	spaces(2)
		puts "What am I?"
		puts "Press any key to continue."
		wait_for_player
		spaces(3)
		answer_hint_pun
		spaces(2)
		puts "Did you have fun? Well, that's because you didn't play the logic riddle."
		spaces(3)
		puts "Start over, and then play the logic riddle!"

	else
		spaces(4)
	    puts "You didn't type 'logic' or 'puns' so..."
	    system 'figlet whatever'
	    puts "I suppose you don't want to play"
	    puts "Start over when you change your mind."
	    spaces(2)
	end


end

until game_over
	riddles_game
	puts "Would you like to start over?"
	if wait_for_player == "no"
		puts "no means no.... +____+  I'm so tired of this anyway."
		puts "Game Over"
		game_over = true
	else
		puts "That's 'yes' enough for me!"
	end
end