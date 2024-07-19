class User < ApplicationRecord

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: 6}, on: :create
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  # Class method to authenticate a user by email and password
  def self.authenticate_with_credentials(email, password)
    # Find user by email, ignoring case sensitivity and leading/trailing spaces
    user = User.find_by('LOWER(email) = ?', email.strip.downcase)

    # Return user if password matches, otherwise return nil
    user && user.authenticate(password) ? user : nil
  end
end
