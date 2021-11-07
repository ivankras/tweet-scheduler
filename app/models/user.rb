# email:string
# password_digest:string
#
# password:string
# password_confirmation:string
class User < ApplicationRecord
    has_secure_password
    has_many :twitter_accounts
    has_many :tweets

    validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid address" }
end
