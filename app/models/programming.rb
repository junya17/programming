class Programming < ApplicationRecord
    validates :title, presence: true
    validates :question, presence: true
    validates :answer, presence: true
    validates :url, presence: true

        def self.search(search) #self.でクラスメソッドとしている
          if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
            Programming.where(['title LIKE ?', "%#{search}%"])
          else
            Programming.all #全て表示。
          end
        end
end
