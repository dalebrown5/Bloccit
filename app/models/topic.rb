class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  scope :public_view, -> { where(public: true) }
  scope :private_view, -> { where(public: false) }
  scope :visible_to, -> (user) { user ? all : public_view }
end
