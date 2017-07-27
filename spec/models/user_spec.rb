# require 'rails_helper'
#
# RSpec.describe User, type: :model do
#   let!(:user) { build(:user) }
#   subject { user }
#   describe '#invalid' do
#     context 'when name blank' do
#       let(:name) { " " }
#       it { is_expected.to be_invalid }
#     end
#
#     context 'when name is too long' do
#       let(:name) { "a" * 30 }
#       it { is_expected.to be_invalid }
#     end
#
#     context 'when gender blank' do
#       let(:gender) { " " }
#       it { is_expected.to be_invalid }
#     end
#
#     context 'when gender is too long' do
#       let(:name) { "a" * 10 }
#       it { is_expected.to be_invalid }
#     end
#
#     context 'when age blank' do
#       let(:age) { " " }
#       it { is_expected.to be_invalid }
#     end
#
#     context 'when age is too long' do
#       let(:name) { " " * 4 }
#       it { is_expected.to be_invalid }
#     end
#   end
# end
