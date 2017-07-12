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
      it { is_expected.to redirect_to signup_url }
    end
  end
end
