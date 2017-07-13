require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    before { get :new }
    context 'when returns http success' do
      it { expect(response).to have_http_status(:success) }
    end
  end

end
