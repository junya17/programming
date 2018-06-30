class Programming < ApplicationRecord
    validates :title, presence: true
    validates :question, presence: true
    validates :answer, presence: true
    validates :url, presence: true
end
