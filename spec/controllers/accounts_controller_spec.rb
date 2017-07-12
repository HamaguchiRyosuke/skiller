require 'rails_helper'

RSpec.describe AccountsController, type: :controller do

  describe "GET #new" do
    subject { response }
    context 'when signup success' do
      before { get :new }
      it { is_expected.to have_http_status(:success) }
      it { is_expected.to render_template :new }
    end
  end
end
