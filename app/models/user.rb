# encoding: utf-8

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable, :timeoutable  
  attr_accessible :id, :username, :nickname, :email, :password, :password_confirmation, :encrypted_password, :salt, :nation_num, :mobile_num, :device_id, :point, :coupon, :service_provider, :client_version, :flag, :photo, :photo_cache, :user_point_counter_attributes, :user_referral_attributes, :user_target_address_attributes  
  # in China validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email"
  validates_length_of :username, :within => 4..60, :allow_blank=>true
  validates_length_of :password, :within => 4..255, :allow_blank=>true
  validates_uniqueness_of :username #, :nickname, :email  
  validates_presence_of :username # in Chian , :nation_num, :mobile_num  :nickname, :email, :device_id, :service_provider
  validates_confirmation_of :password
  has_one :user_target_address, :class_name=>'UserTargetAddress', :dependent=>:destroy
  has_one :user_referral, :dependent=>:destroy
  has_one :address, :through=> :user_target_address, :dependent=>:destroy
  has_one :user, :through=> :user_referral, :as=>:recommend_user, :dependent=>:destroy
  has_one :device, :dependent=>:nullify
  has_many :user_target, :class_name=>'UserTarget', :dependent=>:destroy
  has_many :target, :through=> :user_target, :dependent=>:destroy    
  has_many :user_point, :class_name=>'Point', :dependent=>:destroy
  has_many :user_login_log, :dependent=>:destroy
  has_many :ad_user, :dependent=>:destroy
  
  mount_uploader :photo, UserUploader
  nilify_blanks :only => [:nickname, :email]

  def password=(pass)
    @password=pass
    self.salt = User.random_string(10)
    self.encrypted_password = User.encrypt(@password, self.salt)
  end

  def self.random_string(len)
    #generate a random password consisting of strings and digits
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
    return newpass
  end

  protected

  def self.encrypt(pass, salt)
    require 'digest/sha1'  
    Digest::SHA1.hexdigest(pass+salt+'sleeping-lion')
  end
end