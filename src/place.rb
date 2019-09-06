# frozen_string_literal: true

# create new place instance object
class Place
  attr_reader :name, :location, :created_by
  attr_accessor :visits, :rating
  def initialize(hash)
    @created_by = hash[:created_by]
    @name = hash[:name]
    @location = hash[:location]
    @rating = hash[:rating]
    @visits = hash[:visits]
  end
  def increase_visits
    @visits = @visits.to_i + 1
  end
  def self.all
    ObjectSpace.each_object(self).to_a
    end
end
