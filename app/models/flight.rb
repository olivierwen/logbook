class Flight < ApplicationRecord
  belongs_to :pilot, counter_cache: true
end
