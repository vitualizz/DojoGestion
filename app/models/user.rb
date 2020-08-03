class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  TYPES = ['Student', 'Teacher', 'Parent']

  validates :username, uniqueness: true
  validates_presence_of :fname, :lname, :type

  TYPES.each do |type|
    define_method "is_#{type.downcase}?" do
      self.type == type
    end
  end
 
  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end

  def full_name
    self.fname + ' ' + self.lname
  end
end
