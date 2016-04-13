# the game duh
# version 0.1.5 the re-write.


def choose_weapon
	# stores weapons in array
	# have an annoying bug where the weapons don't cycle correctly edit; fixed
	weapons = ['dagger', 'wand', 'gun', 'crossbow', 'sickle']

	# player is asked to choose a weapon
	puts "Choose your starting weapon by typing it's designated number: "

	# Simple and basic looping through array

	(0...weapons.length).each do |i|
		puts "#{i+1} - #{weapons[i]}"
	end
	print ">> "

	choice = gets.chomp.to_i - 1
	@selected_weapon = weapons[choice]

	puts "You selected: #{@selected_weapon}"
	start_game
end

def start_game
	# This assigns player and monster HP
	@player_health = 100
	@monster_health = 100

	puts "\nAre you ready to play? Y/N"
	print "> "

	confirm = gets.chomp.upcase
	if confirm == 'Y'
		enter_room
	else
		puts "Game over"
	end
end

def enter_room
	# This informs the player where they are.
	puts "You seem to wake up in a rather small room."
	puts "You see a large door. It seems to be locked though."
	puts "You see a table in front of you."
	puts "You find a coin. Hmmm....\n\n"
	coin_toss
end

def coin_toss
	puts "You pick up the coin. Time for some coin tossing."
	# randomly generated numbers between 0 and 2
	# and rounds to 0 or 1

	coin = rand(2).floor

	# This asks the user to pick a coin side. (Heads or Tails, duh)
	print "\nPick a side (heads or tails):\n> "
	choice = gets.chomp.upcase

	# normal if statemets. Checking to see if the player guess coin toss right or not
	# this seems a bit repetitive though, keep in mind to try to improve later
	if choice.include?('H') && coin == 0
		puts "It's heads, seems like luck is on your side."
		treasure_room
	elsif choice.include?('H') && coin == 1
		puts "It's Tails! Let's try again."
		coin_toss
	elsif choice.include?('T') && coin == 0
		puts "It was heads! Let's try again."
		coin_toss
	elsif choice.include?('T') && coin == 1
		puts "It's tails, seems like luck is on your side."
		treasure_room
	end
end

def treasure_room
	puts "\nThe huge door opens. What? The coin?..Really?"
	puts "Walking forward, with your #{@selected_weapon} ready."
	puts "As you walk, something catches your eye."
	puts "!!! Seems to be a treasure chest! Talk about luck!"
	puts "Spoke too soon. Monster incoming 10 o' clock. Now that's some luck alright."
	puts "It's an ogre! He's armored to the teeth and seems to be carrying some type of club!"
	puts "There's no avoiding this. Seems like I have to defeat this guy in order to check out that chest."
	puts "\nAre you prepared to fight? Y/N"
	choice = gets.chomp.upcase
	if choice == 'Y'
		attack_monster
	else
		death
	end
end

def attack_monster
	# this generates a random number between 0 and 6 and rounds to 0 - 5

	player_roll = rand(6).floor

	player_damage = player_roll * 5
	puts "\nYou deal #{player_damage} damage."

	@monster_health -= player_damage

	if @monster_health <= 0
		puts "\nYou defeated the monster!"
		treasure_chest
	else
		puts "Monster's health: #{@monster_health}hp"
		defend_monster
	end
end

def defend_monster


	monster_roll = rand(6).floor

	monster_damage = monster_roll * 5
	puts "\nMonster deals #{monster_damage} damage."

	@player_health -= monster_damage

	if @player_health <= 0
		death
	else
		puts "Your health: #{@player_health}hp"
		puts "\nContinue attacking? Y/N"
		choice = gets.chomp.upcase
		if choice == 'Y'
			attack_monster
		else
			death
		end
	end
end

def treasure_chest
	puts "\nYou're finally able to approach the chest."
	puts "'Hm..a bit heavy. This must be good.'"
	puts "You use all your strength to open this chest. You see a shining light!"
	puts "With suspense killing you...you try to lean forward."
	puts "\nDo you want to take a closer look? Y/N"
	choice = gets.chomp.upcase
	if choice == 'Y'
		victory
	else
		puts "What?! Are you sure?? You've gotten so far! Y/N"
		choice = gets.chomp.upcase
		if choice == 'Y'
			victory
		else
			puts "WELL, YOU'RE DEAD."
			exit(0)
		end
	end
end

def victory
	puts "Congrats! It was a diamond! but a little too small for such a bright light don't ya think?"
	# exit(0)
	puts "Want to play again? Y/N"
	choice = gets.chomp.upcase
	if choice == 'Y'
		choose_weapon
	else
		exit(0)
	end
end

def death
	puts "The monster defeated you."
	puts "Game over."
	puts "\nWant to play again? Y/N"
	choice = gets.chomp.upcase
	if choice == 'Y'
		choose_weapon
	else
		exit(0)
	end
end

choose_weapon
