class Category < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :title, presence: true, uniqueness: {case_sensitive: false,
                                   message: 'must be unique'}

end
