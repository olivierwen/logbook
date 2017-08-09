class Flight < ApplicationRecord
  belongs_to :pilot, counter_cache: true
  validates :startplace, :stopplace, :date, :presence => true

  def self.search(search)
    where("startplace ILIKE ? OR stopplace ILIKE ? OR description ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
  end
end
