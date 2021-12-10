class Song < ApplicationRecord
  belongs_to :album

  validates_presence_of :name

  has_one_attached :file
end
