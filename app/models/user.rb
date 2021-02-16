# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  name                   :string(255)      not null
#  email                  :string(255)      not null
#  encrypted_password     :string(255)      not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  identity_verified      :boolean          default(FALSE), not null
#  profile                :text(65535)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,
         # Omniauthを使用するためのオプション
         :omniauthable, omniauth_providers: %i[facebook]

  # アソシエーション
  has_many :sns_accounts, dependent: :destroy
  has_one :coach, dependent: :destroy
  has_many :user_skills, dependent: :destroy
  has_many :skills, through: :user_skills
  has_many :rooms, dependent: :destroy
  has_many :messages, dependent: :destroy

  # 自分がフォローしている人
  has_many :user_follows, class_name: "UserFollow", foreign_key: "user_id", dependent: :destroy
  has_many :follows, through: :user_follows, source: :follower

  # 自分をフォローしている人(自分がフォローされている人)
  has_many :user_followers, class_name: "UserFollow", foreign_key: "follow_id", dependent: :destroy
  has_many :followers, through: :user_followers, source: :user

  has_one_attached :image
  accepts_nested_attributes_for :user_skills

  validates :name, presence: true, length: { maximum: 60 }
  validates :profile, length: { maximum: 255 }
end
