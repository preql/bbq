class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :event, presence: true

  validates :user_name, presence: true, unless: -> {user.present?}
  validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/,
            unless: -> {user.present?}

  validates :user, uniqueness: {scope: :event_id}, if: -> {user.present?}

  validates :user_email, uniqueness: {scope: :event_id}, unless: -> {user.present?}
  validate :author?, on: :create

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  def author?
    errors.add(:base, :must_not_be_an_author) if user == event.user
  end
end
