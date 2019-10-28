class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,
         omniauth_providers: [:facebook, :vkontakte]

  has_many :events, dependent: :destroy
  has_many :comments
  has_many :subscriptions, dependent: :destroy

  validates :name, presence: true, length: {maximum: 35}

  after_commit :link_subscriptions, on: :create

  mount_uploader :avatar, AvatarUploader

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  def self.find_for_facebook_oauth(access_token)
    id = access_token.extra.raw_info.id

    create_from_oauth(
      url: "https://facebook.com/#{id}",
      email: access_token.info.email,
      name: access_token.info.name,
      provider: :facebook
    )
  end

  def self.find_for_vkontakte_oauth(access_token)
    create_from_oauth(
      email: access_token.info.email,
      name: access_token.info.name,
      url: access_token.info.urls[:Vkontakte],
      provider: :vkontakte
    )
  end

  private

  def self.create_from_oauth(params)
    email = params[:email]

    where(email: email).first_or_create! do |user|
      user.email = email
      user.name = params[:name]
      user.url = params[:url]
      user.provider = params[:provider]
      user.password = Devise.friendly_token.first(16)
    end
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email)
      .update_all(user_id: self.id)
  end
end
