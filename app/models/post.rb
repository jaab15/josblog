class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, presence: true, uniqueness: {case_sensitive: false,
                                   message: 'must be unique'}


end
