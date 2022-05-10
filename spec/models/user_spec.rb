require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    context 'user is initialized with valid data' do
      it 'should create user' do
      end
    end

    context 'user is initialized with invalid data' do
      it 'should not create if first name is not present' do
      end

      it 'should not create if last name is not present' do
      end

      it 'should not create if status is not present' do
      end

      it 'should not create if email is not present' do
      end
    end
  end
end
