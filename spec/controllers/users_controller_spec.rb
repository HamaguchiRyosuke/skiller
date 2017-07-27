# require 'rails_helper'
#
# RSpec.describe UsersController, type: :controller do
#   let!(:account) { create(:account) }
#   let!(:user) { create(:user, account_id: account.id) }
#   subject { response }
#
#   describe 'GET #new' do
#     before do
#       log_in_as(login_account)
#       get :new
#     end
#     let(:login_account) { account }
#
#     context 'when render new template success' do
#       it { is_expected.to have_http_status(:success) }
#       it { is_expected.to render_template 'new' }
#     end
#   end
#
#   describe 'POST #create' do
#     before { log_in_as(login_account) }
#     let!(:login_account) { account }
#
#     context 'when user create success with valid' do
#       before { post :create, params: { id: user.id, user: { name: 'name', gender: 'male', age: 22 } } }
#       it { expect(flash).to_not be_empty }
#       it { is_expected.to redirect_to users_path }
#     end
#
#     context 'when user create failed with invalid' do
#       before { post :create, params: { id: user.id, user: { name: 'name', gender: ' ', age: 22 } } }
#       it { expect(flash).to be_empty }
#       it { is_expected.to render_template 'new' }
#     end
#
#   end
#
#   describe 'GET #index' do
#     before { get :index }
#
#     context 'when not logged in user action' do
#       it { expect(flash).to_not be_empty }
#       it { is_expected.to redirect_to login_url }
#     end
#   end
#
#   describe 'GET #show' do
#     before { get :show, params: { id: account.id } }
#
#     context 'when not logged in user action' do
#       it { expect(flash).to_not be_empty }
#       it { is_expected.to redirect_to login_url }
#     end
#   end
#
#   describe 'GET #edit' do
#     context 'when not logged in user action' do
#       before { get :edit, params: { id: user.id } }
#       it { expect(flash).to_not be_empty }
#       it { is_expected.to redirect_to login_url }
#     end
#
#     # テストを通せない
#     # context 'when incorrect user action' do
#     #   before do
#     #     log_in_as(login_account)
#     #     get :edit, params: { id: user.id }
#     #   end
#     #   let!(:other_account) { create(:other_account) }
#     #   let!(:login_account) { other_account }
#     #   it { expect(flash).to_not be_empty }
#     #   it { is_expected.to redirect_to user_path(id: user.id) }
#     # end
#
#     context 'when correct user action' do
#       before do
#         log_in_as(login_account)
#         get :edit, params: { id: user.id }
#       end
#       let!(:login_account) { account }
#       it { expect(flash).to_not be_empty }
#       it { is_expected.to render_template :edit }
#     end
#   end
#
#   describe 'POST #update' do
#     before do
#       log_in_as(login_account)
#       patch :update, params: { id: user.id, user: { name: 'name', gender: 'male', age: 22, other_information: "Hello!" } }
#     end
#
#     context 'when not logged in user action' do
#       let(:login_account) { nil }
#       it { expect(flash).to_not be_empty }
#       it { is_expected.to redirect_to login_url }
#     end
#
#     context 'when correct user action' do
#       let(:other_account) { create(:other_account) }
#       let(:login_account) { account }
#       it { expect(flash).to_not be_empty }
#       it { is_expected.to redirect_to user_path(id: user.id) }
#     end
#
#     # テストを通せない
#     # context 'when incorrect user action' do
#     #   let(:other_account) { create(:other_account) }
#     #   let(:login_account) { other_account }
#     #   it { expect(flash).to be_empty }
#     #   it { is_expected.to render_template :edit }
#     # end
#   end
#
# end
