require 'rails_helper'

RSpec.describe User, type: :model do
  let(:first_name) { 'David' }
  let(:last_name) { 'Johnson' }
  let(:status) { 'Active' }
  let(:email) { 'david@test.com' }

  describe '#create' do
    context 'user is initialized with valid data' do
      it 'should create user' do
        user = User.new(
          first_name: first_name,
          last_name: last_name,
          status: status,
          email: status
        )

        expect(user.save).to eq(true)
        expect(User.count).to eq(1)
      end
    end

    context 'user is initialized with invalid data' do
      it 'should not create if first name is not present' do
        user = User.new(
          last_name: last_name,
          status: status,
          email: status
        )

        expect(user.save).to eq(false)
        expect(User.count).to eq(0)
      end

      it 'should not create if last name is not present' do
        user = User.new(
          first_name: first_name,
          status: status,
          email: status
        )

        expect(user.save).to eq(false)
        expect(User.count).to eq(0)
      end

      it 'should not create if status is not present' do
        user = User.new(
          first_name: first_name,
          last_name: last_name,
          email: status
        )

        expect(user.save).to eq(false)
        expect(User.count).to eq(0)
      end

      it 'should not create if email is not present' do
        user = User.new(
          first_name: first_name,
          last_name: last_name,
          status: status,
        )

        expect(user.save).to eq(false)
        expect(User.count).to eq(0)
      end
    end
  end
end
