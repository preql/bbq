class NotificationSentJob < ApplicationJob
  queue_as :default

  def perform(source, subject)
    event = subject.event
    all_emails = (event.subscriptions.map(&:user_email) + [event.user.email] - [subject.user&.email]).uniq

    deliver_method = EventMailer.method(source)
    all_emails.each do |mail|
      deliver_method.call(event, subject, mail).deliver_later
    end
  end
end
