require 'rails_helper'

RSpec.describe AccountsController, type: :controller do
  let!(:account) { create(:account) }
  describe "GET #new" do
    before { get :new }
    subject { response }
    context 'when signup success' do
      it { is_expected.to have_http_status(:success) }
      it { is_expected.to render_template :new }
    end
  end

  describe 'POST #create' do
    let!(:account_email) { account.email }
    let!(:account_pass) { account.password }
    before { post :create, params: { account: { email: account_email, password: account_pass } } }

    context 'when email blank' do
      let!(:account_email) { " " }
      it { expect(flash).to_not be_nil }
      it { is_expected.to render_template :new }
    end

    context 'when email is strange' do
      let!(:account_email) { "aaa@aaa" }
      it { expect(flash).to_not be_nil }
      it { is_expected.to render_template :new }
    end

    context 'when password blank' do
      let!(:account_pass) { " " }
      it { expect(flash).to_not be_nil }
      it { is_expected.to render_template :new }
    end

    context 'when password is too short' do
      let!(:account_pass) { "a" * 5 }
      it { expect(flash).to_not be_nil }
      it { is_expected.to render_template :new }
    end
  end

  describe 'DELETE #destroy' do
    context 'when change account_count' do
      let!(:account_count) { Account.count }
      it { expect { delete :destroy, params: { id: account.id } }.to change{ Account.count }.by(-1) }
    end

    context 'when success delete' do
      before { delete :destroy, params: { id: account.id } }
      it { expect(flash).to_not be_empty }
      it { is_expected.to redirect_to root_url }
    end

    context 'delete failed' do
    end
  end
end
