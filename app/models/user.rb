class User < ApplicationRecord

  has_many :posts
  has_many :likes, dependent: :destroy, through: :comments
  has_one_attached :image


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def resize_image
    resized_image = MiniMagick::Image.read(avatar.download)
    resized_image = resized_image.resize "400x400"
    v_filename = avatar.filename
    v_content_type = avatar.content_type
    avatar.purge
    avatar.attach(io: File.open(resized_image.path), filename:  v_filename, content_type: v_content_type)
  end
end
