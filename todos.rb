require "date"

class Todo
  attr_reader :due_date
  attr_accessor :title
  @@all = []

def self.all
  @@all
end

def self.last
  @@all[-1]
end

def self.find(hsh)
  raise(ArgumentError, "I don't know how to find this") unless hsh.is_a? Hash
  meth = hsh.keys[0]
  param = hsh.values[0]
  self.send(meth, param)
end

def self.contains(titl)
  result = []
  self.all.each do |td|
    if td.title.downcase.include?(titl.downcase)
      result.push(td)
    end
  end
  result
end

def self.exactly(titl)
  result = []
  self.all.each do |td|
    if td.title == titl
      result.push(td)
    end
  end
  result
end

def initialize(title, due_date = Date.today)
  raise(ArgumentError, "second argument must be a Date object") unless due_date.is_a? Date
  @title = title
  @due_date = due_date
  @@all << self
end

def due_date=a
  raise(ArgumentError, "gimme a date object u bish") unless a.is_a? Date
  @due_date=a
end
end
