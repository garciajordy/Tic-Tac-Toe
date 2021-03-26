# Class to make users
class User
  attr_reader :name

  attr_writer :marker

  def initialize(name)
    name += "\'s" if name[-1] != 's' && !name.empty?
    @name = name
  end

  def mark
    @marker
  end
end
