require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  subject { response }
  describe "GET #new" do
    before { get :new }
    context 'when returns http success' do
      it { is_expected.to have_http_status(:success) }
    end
  end

  describe "DELETE #destroy" do
    before { delete :destroy }
    it { is_expected.to redirect_to root_url }
    it { expect(session[:account_id]).to be_nil }
  end
end
