require 'rails_helper'

describe Account, type: :model do
  let!(:account) { build(:account) }
  subject { account }
  describe '#valid' do
    it { is_expected.to be_valid }
  end

  describe '#invalid' do
    context 'when empty email' do
      let!(:account_email) { account.email = " " }
      it { is_expected.to be_invalid }
    end

    context 'when too long email than 255 characters' do
      let!(:account_email) { account.email = "a" * 244 + "@example.com" }
      it { is_expected.to be_invalid }
    end

    context 'when duplicated email' do
      let!(:duplicate_account) { account.dup }
      before { duplicate_account.save }
      it { is_expected.to be_invalid }
    end

    context 'when lower-case email' do
      let(:mixed_case_email) { "Foo@ExAmPle.CoM" }
      before do
        account.email = mixed_case_email
        account.save
      end
      it { expect(mixed_case_email.downcase).to eq account.reload.email }
    end

    context 'when empty password' do
      let!(:account_pass) { account.password = " " * 6 }
      let!(:account_confirm_pass) { account.password_confirmation = " " * 6 }
      it { is_expected.to be_invalid }
    end

    context 'when too short password than 6 characters' do
      let!(:account_pass) { account.password = "a" * 5 }
      let!(:account_confirm_pass) { account.password_confirmation = "a" * 5 }
      it { is_expected.to be_invalid }
    end

  describe '#authenticated' do
    subject { account.authenticated?(:remember, token) }
    context 'when remember_token exist' do
      before { account.remember }
      let!(:token) { account.remember_token }
      it { is_expected.to be_truthy }
    end

    context 'when remember_token empty' do
      let!(:token) { " " }
      it { is_expected.to be_falsey }
    end
  end
  end
end
