class Comment < ApplicationRecord
  belongs_to :post

  validates :body, presence: true, uniqueness: {case_sensitive: false,
                                   message: 'must be unique'}

end
