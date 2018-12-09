require 'rails_helper'

RSpec.describe Api::UsersController do
  describe 'GET #email/users_exists' do
    subject { get :email_exists, params: { email: email } }
    let(:email) { 'test@test.com' }

    context 'when email is available' do
      it do
        expect(subject).to be_successful
        expect(JSON.parse(subject.body)).to eq(false)
      end
    end

    context 'when email is not available' do
      let(:user) { create :user }
      let(:email) { user.email }
      it do
        expect(subject).to be_successful
        expect(JSON.parse(subject.body)).to eq(true)
      end
    end
  end
end
