# class de la Dose des ingredients entrant dans la compo des cocktails
class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true
  validates_uniqueness_of :cocktail, scope: [:ingredient]
end
