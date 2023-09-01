class User < ApplicationRecord
    has_secure_password 
    
    # validates :username, presence: true, uniqueness: true
    validates :password, presence: true, confirmation: true

    # def self.authenticate(username, password)
    #     user = find_by(username: username)
    #     return user if user && user.authenticate(password)
    #     false
    #   end

end
