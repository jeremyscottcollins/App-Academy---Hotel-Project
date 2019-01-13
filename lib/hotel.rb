require_relative "room"

class Hotel
  def initialize(name, hash)
    @name = name
    @rooms = {}

    hash.each do |room_name, capacity|
        @rooms[room_name] = Room.new(capacity)
    end
  end

  def name
    @name.split.map(&:capitalize).join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(room_name)
    return true if @rooms.include?(room_name)
    return false
  end

  def check_in(person, room_name)
    if self.room_exists?(room_name)
      if @rooms[room_name].add_occupant(person)
        puts "check in successful"
      else
        puts "sorry, room is full"
      end
    else
      puts "sorry, room does not exist"
    end
  end

  def has_vacancy?
    @rooms.values.any? { |room| room.available_space > 0 }
  end

  def list_rooms
    @rooms.each { |name, room| puts "#{name} : #{room.available_space}"}
  end
end
