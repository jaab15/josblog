class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  validates :email, presence: true ,
                    uniqueness: true ,
              format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
              # unless: :from_oauth?

  validates :first_name, presence: true

  validates :last_name, presence: true

  has_secure_password


  def full_name
    "#{first_name} #{last_name}".strip.squeeze(' ').titleize
  end

  private


end
