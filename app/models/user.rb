class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :comments
  has_many :subscriptions, dependent: :destroy

  validates :name, presence: true, length: {maximum: 35}

  after_commit :link_subscriptions, on: :create
  after_create :send_mail

  mount_uploader :avatar, AvatarUploader

  private

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email)
      .update_all(user_id: self.id)
  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
end
