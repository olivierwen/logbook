class Flight < ApplicationRecord
  belongs_to :pilot, counter_cache: true
  validates :startplace, :stopplace, :date, :presence => true

  def self.search(search)
    where("startplace LIKE ? OR stopplace LIKE ? OR description LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
  end
end
