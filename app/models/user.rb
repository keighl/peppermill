class User < ActiveRecord::Base

  attr_accessible :username,
    :email,
    :password,
    :password_confirmation

  authenticates_with_sorcery!

  has_many :todos

  # Callbacks ########################

  before_create :generate_token

  def generate_token
    self.token = SecureRandom.base64(30).tr('+/=lIO0', 'pqrsxyz')
  end

  # Validations #######################

  # Username
  validates_format_of :username, with: /^\d*[a-zA-Z][a-zA-Z0-9]*$/, allow_blank: false
  validates_uniqueness_of :username, case_sensitive: false

  # Email
  validates_uniqueness_of :email, case_sensitive: false
  validates_format_of  :email, with: EMAIL_REGEX, allow_blank: false

  # Password
  validates(:password, {
    on: :create,
    confirmation: true,
    length: { within: 6..40 }
  })

  validates(:password_confirmation, {
    on: :create,
    presence: true
  })

  validates(:password, {
    on: :update,
    presence: true,
    length: { within: 6..40 },
    confirmation: true,
    unless: lambda { |user| user.password.blank? }
  })

  validates(:password_confirmation, {
    on: :update,
    presence: true,
    unless: lambda { |user| user.password.blank? }
  })
end
