class Contact < ApplicationRecord
  validates :name, :user, presence: true
  belongs_to :user
end
