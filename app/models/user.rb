class User < ApplicationRecord
  before_save :salted
  
  def salted
    if self.id.blank?
      self.password = "aaaaa" + self.password
    end
  end
end
