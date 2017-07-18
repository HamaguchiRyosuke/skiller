require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let!(:account) { create(:account) }
  subject { response }
  describe "GET #new" do
    before { get :new }
    context 'when returns http success' do
      it { is_expected.to have_http_status(:success) }
    end
  end

  describe "POST #create" do
    let!(:login_email) { account.email }
    let!(:login_pass) { account.password }
    before { post :create, params: { session: { email: login_email, password: login_pass } } }

    context 'when login with correct information' do
      it { is_expected.to redirect_to root_url }
      it { expect(session[:account_id]).to eq account.id }
    end

    context 'when login with wrong email' do
      let(:login_email) { "aaa@aaa" }
      it { expect(flash).to_not be_nil }
      it { is_expected.to render_template 'new' }
      it { expect(session[:account_id]).to be_nil }
    end

    context 'when login with wrong password' do
      let(:login_pass) { "a" }
      it { expect(flash).to_not be_nil }
      it { is_expected.to render_template 'new' }
      it { expect(session[:account_id]).to be_nil }
    end

    context 'when login by not activated account' do
      let!(:account) { create(:account, activated: false) }
      before do
        post :create, params: { session: { email:login_email, password: login_pass } }
      end

      it { expect(flash).to_not be_empty }
      it { is_expected.to redirect_to root_url }
      it { expect(session[:user_id]).to be_nil }
    end
  end

  describe "DELETE #destroy" do
    before { delete :destroy }
    it { is_expected.to redirect_to root_url }
    it { expect(session[:account_id]).to be_nil }
  end
end
