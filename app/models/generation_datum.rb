class GenerationDatum < ApplicationRecord
  validates :width, presence: true, numericality: {greater_than: 0, only_integer: true}
  validates :height, presence: true, numericality: {greater_than: 0, only_integer: true}
  validates :river_length, presence: true, numericality: {greater_than: -1, only_integer: true}
end
