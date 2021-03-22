class Email < ActiveRecord::Base
  validates_uniqueness_of :address, :message => '이미 등록된 주소 입니다.'
  validates_presence_of :address, :message => '주소를 입력해 주세요.'
  validates_format_of :address, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => '이메일 형식이 바르지 않습니다. 주소 앞뒤에 공백이 들어간건 아닌지 확인해주십시오.'
end
