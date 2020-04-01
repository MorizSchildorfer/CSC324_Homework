class GenerationDatum < ApplicationRecord
  validates :seed, uniqueness: { scope: [:width ,:height, :river_length]}
  validates :seed, presence: true, numericality: {only_integer: true}
  validates :width, presence: true, numericality: {greater_than: 0, only_integer: true}
  validates :height, presence: true, numericality: {greater_than: 0, only_integer: true}
  validates :river_length, presence: true, numericality: {greater_than: -1, only_integer: true}
end
