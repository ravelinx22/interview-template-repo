require 'rails_helper'

RSpec.describe "Admin Users actions", type: :feature do
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
        visit '/admin/users'
        expect(page).to have_css('.user_id', count: 0)
      end
    end

    context 'when users table has data' do
      before do
        @active_user = active_user
        @inactive_user = inactive_user
      end

      it 'should display active and inactive users' do
        visit '/admin/users'

        expect(page).to have_css('.user_id', count: 2)
        expect(
          all(".user_id").first
        ).to have_content(@active_user.id)
        expect(
          all(".user_id").last
        ).to have_content(@inactive_user.id)
      end

      it 'should filter by active users' do
        visit '/admin/users?status=Active'

        expect(page).to have_css('.user_id', count: 1)
        expect(
          first(".user_id")
        ).to have_content(@active_user.id)
      end

      it 'should filter by inactive users' do
        visit '/admin/users?status=Inactive'

        expect(page).to have_css('.user_id', count: 1)
        expect(
          first(".user_id")
        ).to have_content(@inactive_user.id)
      end
    end
  end

  describe '#show' do
    context 'when user exists' do
      before do
        @user = active_user
        visit "/admin/users/#{@user.id}"
      end

      it 'should display its id' do
        expect(page).to have_css('.user_id', count: 1)
        expect(
          first(".user_id")
        ).to have_content(@user.id)
      end

      it 'should display its first name' do
        expect(page).to have_css('.user_first_name', count: 1)
        expect(
          first(".user_first_name")
        ).to have_content(@user.first_name)
      end

      it 'should display its last name' do
        expect(page).to have_css('.user_last_name', count: 1)
        expect(
          first(".user_last_name")
        ).to have_content(@user.last_name)
      end

      it 'should display its status' do
        expect(page).to have_css('.user_status', count: 1)
        expect(
          first(".user_status")
        ).to have_content(@user.status)
      end

      it 'should display its email' do
        expect(page).to have_css('.user_email', count: 1)
        expect(
          first(".user_email")
        ).to have_content(@user.email)
      end

      it 'should display its created at' do
        expect(page).to have_css('.user_created_at', count: 1)
        expect(
          first(".user_created_at")
        ).to have_content(@user.created_at)
      end
    end

    context 'when user does not exist' do
      it 'should display error' do
        #expect(page).to have_content("James")
      end
    end
  end
end
