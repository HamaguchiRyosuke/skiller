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
    before { post :create, params: { account: { email: account.email } } }
    context 'when email blank' do
      let!(:account_email) { " " }
      it { is_expected.to render_template :new }
    end
  end

  describe 'DELETE #destroy' do
    let!(:account_count) { Account.count }
    before { delete :destroy, params: { id: account.id } }
    context 'delete success' do
      it { expect(Account.count).to_not eq account_count }
      it { expect(flash).to_not be_empty }
      it { is_expected.to redirect_to root_url }
    end

    context 'delete failed' do
    end
  end
end
