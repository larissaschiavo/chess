# PHASE 2
def convert_to_int(str)

  begin
    Integer(str)
  rescue ArgumentError
    return str
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    raise StandardError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue StandardError
    puts "I don't like #{maybe_fruit}"
    retry if maybe_fruit == "coffee"
  end
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    begin
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
    raise NoFriendshipError if yrs_known < 5
    raise FriendshipInputError if name == "" || fav_pastime == ""
    rescue NoFriendshipError
      p "we are not friends"
      raise GenericAppError
    rescue FriendshipInputError
      p "no input given"
      raise GenericAppError
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known} years. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end

  class NoFriendshipError < StandardError
  end

  class FriendshipInputError < StandardError
  end

  class GenericAppError < StandardError
  end
