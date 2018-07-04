class Programming < ApplicationRecord
    belongs_to :account 
    validates :title, presence: true
    validates :question, presence: true
    validates :account_id, presence: true
    
        def self.search(search) #self.でクラスメソッドとしている
          if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
            Programming.where(['title LIKE ?', "%#{search}%"])
          else
            Programming.all #全て表示。
          end
        end
end
