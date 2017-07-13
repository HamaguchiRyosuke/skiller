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


    
  end
end
