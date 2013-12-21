class Comment < ActiveRecord::Base
  belongs_to :article
  before_save { self.body = body.downcase }

  validates :body, length: { minimum: 6 }
end
