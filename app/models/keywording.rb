class Keywording < ActiveRecord::Base
  
  belongs_to :keyword
  belongs_to :post
  
  validates :keyword, :presence => true
  validates :post, :presence => true


end
