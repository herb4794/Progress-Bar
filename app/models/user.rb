class User < ApplicationRecord
    before_save :salted

    def salted
        if self.id.blank?
            self.password = "herb" + self.password
    end
end
end
