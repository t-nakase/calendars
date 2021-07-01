class Blog < ApplicationRecord
    belongs_to :user

    validates :title, presence: true, length: { maximum: 20 }
    validates :content, presence: true, length: { maximum: 64 }
end
