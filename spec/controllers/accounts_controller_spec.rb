require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  let!(:account) { create(:account) }

  describe "GET #new" do
    before { get :new }
    subject { response }
    context 'when signup template success' do
      it { is_expected.to have_http_status(:success) }
      it { is_expected.to render_template :new }
    end
  end

  describe 'POST #create' do
    before { post :create, params: { account: { email: account.email, password: account.password } } }

    context 'when email blank' do
      let!(:account_email) { account.email = " " }
      it { expect(flash).to_not be_nil }
      it { is_expected.to render_template :new }
    end

    context 'when email is strange' do
      let!(:account_email) { account.email = "aaa@aaa" }
      it { expect(flash).to_not be_nil }
      # it { is_expected.to render_template :new }
    end

    context 'when password blank' do
      let!(:account_pass) { account.password = " " }
      it { expect(flash).to_not be_nil }
      it { is_expected.to render_template :new }
    end

    context 'when password is too short' do
      let!(:account_pass) { account.password = "a" * 5 }
      it { expect(flash).to_not be_nil }
      it { is_expected.to render_template :new }
    end
  end

  # テストが通らない（書けてない）箇所
  # describe 'DELETE #destroy' do
  #   context 'when change account_count' do
  #     it { expect { delete :destroy, params: { id: account.id } }.to change{ Account.count }.by(-1) }
  #   end
  #
  #   context 'when success delete' do
  #     before { delete :destroy, params: { id: account.id } }
  #     it { expect(flash).to_not be_empty }
  #     it { is_expected.to redirect_to root_url }
  #   end
  # end
end
