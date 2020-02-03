class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  TYPES = ['student', 'teacher', 'parent']

  validates :username, uniqueness: true

  TYPES.each do |type|
    define_method "is_#{type}?" do
      self.type == type
    end
  end
 
  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end
end
