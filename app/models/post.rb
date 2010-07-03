module KeywordBehaviour

  def names
    self.map(&:name)
  end

  def to_s
    names.join(" ")
  end

end

module KeywordingBehaviour
    
  def update_from(string)
    
    new_keywords = find_or_create_from(string)
    current_keywordings = self

    destroyed_keywordings = []
    current_keywordings.each do |keywording|
      destroyed_keywordings << keywording.destroy unless new_keywords.include? keywording.keyword
    end

    current_keywordings = current_keywordings - destroyed_keywordings    
    current_keywords = current_keywordings.map(&:keyword)
    
    new_keywords.each do |keyword|
      self.create :keyword => keyword unless current_keywords.include? keyword
    end
  end
  

  def find_or_create_from(string)
    
    keyword_names = parse(string)
    keywords = []
    
    keyword_names.each do |name|
      keywords << Keyword.find_or_create_by_name(name)    
    end
    
    return keywords
  end

  def parse(string)
    string.split(" ")
  end    
end


class Post < ActiveRecord::Base
  
  
  validates :topic, :presence => true
  validates :body, :presence => true
  
  has_many :keywordings, :extend => KeywordingBehaviour
  has_many :keywords, :through => :keywordings, :extend => KeywordBehaviour
  
  scope :published, where('published_at IS NOT NULL')
  default_scope :order => "published_at DESC"
  
  def toggle_publish!
    if published_at
      update_attribute(:published_at, nil)
    else
      update_attribute(:published_at, Time.now.utc)
    end
  end
  
  def keywords=(string)
    keywordings.update_from(string)
  end
  
  def to_param
    "#{id}-#{topic.parameterize}"
  end
  
  def published?
    not published_at.blank?
  end
end
