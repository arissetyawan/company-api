class Company < ApplicationRecord
  validates :name , length: { maximum: 20, minimum: 5 }, allow_blank: false, uniqueness: true
end
