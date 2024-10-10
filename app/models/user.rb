# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_one_attached :avatar
  has_one_attached :header

  after_create :set_default_avatar

  def set_default_avatar
    return if avatar.attached?

    avatar.attach(io: File.open(Rails.root.join('/public/seed/user/avatar_default.png')),
                  filename: 'avatar_default.png')
  end
end
