require 'rails_helper'

RSpec.describe "API Users actions", type: :feature do
  let(:active_user){
    User.create(
      first_name: 'David',
      last_name: 'Johnson',
      status: 'Active',
      email: 'david@test.com'
    )
  }
  let(:inactive_user){
    User.create(
      first_name: 'John',
      last_name: 'Davidson',
      status: 'Inactive',
      email: 'john@test.com'
    )
  }

  describe "#index" do
    context 'when users table is empty' do
      it 'should not display users info' do
      end
    end

    context 'when users table has data' do
      before do
        @active_user = active_user
        @inactive_user = inactive_user
      end

      it 'should display active and inactive users' do
      end

      it 'should filter by active users' do
      end

      it 'should filter by inactive users' do
      end
    end
  end

  describe '#show' do
    context 'when user exists' do
      before do
        @user = active_user
      end

      it 'should display its info' do
      end
    end

    context 'when user does not exist' do
      it 'should display error' do
        #expect(page).to have_content("James")
      end
    end
  end
end
