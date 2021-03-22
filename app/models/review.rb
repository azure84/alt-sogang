require 'digest/sha1'

class Review < ActiveRecord::Base
  belongs_to :courses
  attr_accessor :password


  validates_presence_of :user, :password, :comment, :course_id, :message => "내용을 입력해야 합니다"

  def password
    @password
  end

  def password=(pwd)
    @password = pwd
    create_new_salt
    self.hashed_pw = Review.encrypted_password(self.password, self.salt)
  end

  def course
    Course.find(course_id)
  end

  def self.encrypted_password(pw, salt)
    string_to_hash = pw + "alt-sogang"+ salt
    Digest::SHA1.hexdigest(string_to_hash)
  end

  def create_new_salt
    self.salt=self.object_id.to_s + rand.to_s
  end

  def self.authenticate(id, pwd)
    review=self.find(id)
    if review
      expected_password=encrypted_password(pwd, review.salt)
      if review.hashed_pw != expected_password
        review = nil
      end
      review
    end
  end


end
