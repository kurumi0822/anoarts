class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    mount_uploader :image, ImageUploader

  has_many :posts, dependent: :destroy
  validates :name, presence: true
  validates :profile, length: { maximum: 200 }

  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  has_many :comments, dependent: :destroy

  has_many :reactions, dependent: :destroy

  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end

end
