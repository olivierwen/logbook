class Flight < ApplicationRecord
  belongs_to :pilot, counter_cache: true
  validates :startplace, :stopplace, :date, :presence => true
end
