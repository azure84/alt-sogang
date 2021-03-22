require 'digest/sha1'

class User < ActiveRecord::Base
  has_many :reviews,
           :order => "created_at DESC"
  has_many :surveys,
           :order => "created_at DESC"
  has_many :qualitative_surveys,
           :order => "created_at DESC"

  # Max & min lengths for all fields
  NAME_MIN_LENGTH = 2
  NAME_MAX_LENGTH = 20
  PASSWORD_MIN_LENGTH = 5
  PASSWORD_MAX_LENGTH = 40
  EMAIL_MAX_LENGTH = 50
  NAME_RANGE = NAME_MIN_LENGTH..NAME_MAX_LENGTH
  PASSWORD_RANGE = PASSWORD_MIN_LENGTH..PASSWORD_MAX_LENGTH

  # Text box sizes for display in the views
  NAME_SIZE = 20
  PASSWORD_SIZE = 10
  EMAIL_SIZE = 30

  attr_accessor :remember_me
  attr_accessor :current_password

#  attr_accessor :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password, :message => "암호가 일치 하지 않습니다. 암호를 정확히 확인해주세요."

  validates_uniqueness_of :name, :email
  validates_length_of :name, :within => NAME_RANGE, :message => "#{NAME_MIN_LENGTH}글자 이상 #{NAME_MAX_LENGTH}자 이하입니다."
  validates_length_of :password, :within => PASSWORD_RANGE, :message => "#{PASSWORD_MIN_LENGTH}글자 이상 #{PASSWORD_MAX_LENGTH}자 이하입니다."
  validates_length_of :email, :maximum => EMAIL_MAX_LENGTH

  validates_format_of :name,
                      :with => /^[\w_]*$/i,
                      :message => "영문, 한글, 숫자, 밑줄만 가능합니다"
  validates_format_of :email,
                      :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                      :message => '이메일 형식이 바르지 않습니다.'


  def validate
    errors.add_to_base("암호가 비었습니다") if hashed_password.blank?
  end

  def password
    @password
  end

  def password=(pwd)
    @password = pwd
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end

  def self.authenticate(email, pwd)
    user=self.find_by_email(email)
    if user
      expected_password=encrypted_password(pwd, user.salt)
      if user.hashed_password != expected_password
        user = nil
      else
        user.password = pwd unless user.nil?
        #방금 찾아낸 user 액티브레코드 객체에는 password값이 nil이다 그래서 한번은 넣어줘야 한다.
        #그래야 login!할때 remember!로 저장할 수 있다.
      end
      user
    end
  end

  # Log a user in.
  def login!(session)
    session[:user_id] = id
  end

  # Log a user out.
  def self.logout!(session, cookies)
    session[:user_id] = nil
    cookies.delete(:authorization_token)
  end

  # Clear the password (typically to suppress its display in a view).
  def clear_password!
    self.password = nil
    self.password_confirmation = nil
    self.current_password = nil
  end

  # Remember a user for future login.
  def remember!(cookies)
    cookie_expiration = 14.days.from_now
    cookies[:remember_me] = {:value => "1",
                             :expires => cookie_expiration}
    self.authorization_token = unique_identifier
    save!
    cookies[:authorization_token] = {:value => authorization_token,
                                     :expires => cookie_expiration}
  end

  # Forget a user's login status.
  def forget!(cookies)
    cookies.delete(:remember_me)
    cookies.delete(:authorization_token)
  end

  # Return true if the user wants the login status remembered.
  def remember_me?
    remember_me == "1"
  end

  # Return true if the password from params is correct.
  def correct_password?(params)
    self.current_password = params[:user][:current_password]
    self.password == self.current_password
  end

  # Generate messages for password errors.
  def password_errors(params)
    # Use User model's valid? method to generate error messages
    # for a password mismatch (if any).
    self.password = params[:user][:password]
    self.password_confirmation = params[:user][:password_confirmation]
    valid?
    # The current password is incorrect, so add an error message.
    errors.add(:current_password, "가 일치하지 않습니다")
  end


  private

  def self.encrypted_password(pwd, salt)
    pwd = "" if pwd.nil?
    string_to_hash = pwd + "alt-sogang"+ salt
    Digest::SHA1.hexdigest(string_to_hash)
  end

  def create_new_salt
    self.salt=self.object_id.to_s + rand.to_s
  end

  # Generate a unique identifier for a user.
  def unique_identifier
    Digest::SHA1.hexdigest("#{email}:#{password}")
  end

end
