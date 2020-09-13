class User < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

    validates :email, presence: true, 
                        uniqueness: true, 
                        format: {with: VALID_EMAIL_REGEX}
    validates :username, presence: true, 
                            uniqueness: {case_sensitive: false}
    has_many :articles
end
