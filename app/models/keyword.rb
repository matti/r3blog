class Keyword < ActiveRecord::Base
  
  validates :name, :presence => true, :uniqueness => true

  has_many :keywordings, :dependent => :destroy
  has_many :posts, :through => :keywordings
  
end
