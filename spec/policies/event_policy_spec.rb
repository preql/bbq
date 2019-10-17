require 'rails_helper'

RSpec.describe EventPolicy, type: :policy do
  let(:user) { User.create(email: 'boss@bb.ru', name: 'Женька') }
  let(:user_not_owner) { User.create(email: 'neboss@bb.ru', name: 'Inotarchitect') }
  let(:event) { user.events.build(title: 'Лучшие тусовки') }

  subject { described_class }

  context "when user anonymous" do
    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(nil, event) }
    end
  end

  context "when user is not owner of event" do
    permissions :edit?, :update?, :destroy? do
      it { is_expected.not_to permit(user_not_owner, event) }
    end
  end

  context "when user is owner of event" do
    permissions :edit?, :update?, :destroy? do
      it { is_expected.to permit(user, event) }
    end
  end
end
