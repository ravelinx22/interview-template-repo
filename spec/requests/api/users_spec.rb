require 'rails_helper'

RSpec.describe "API Users actions", type: :request do
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
      it 'should return empty list' do
        get '/api/users'
        
        expect(response.status).to eq(200)
        expect(json).to eq([])
      end
    end

    context 'when users table has data' do
      before do
        @active_user = active_user
        @inactive_user = inactive_user
      end

      it 'should display active and inactive users' do
        get '/api/users'
        
        expect(response.status).to eq(200)
        expect(json.count).to eq(2)
        expect(json[0]['id']).to eq(@active_user.id)
        expect(json[1]['id']).to eq(@inactive_user.id)
      end

      it 'should filter by active users' do
        get '/api/users?status=Active'

        expect(response.status).to eq(200)
        expect(json.count).to eq(1)
        expect(json[0]['id']).to eq(@active_user.id)
      end

      it 'should filter by inactive users' do
        get '/api/users?status=Inactive'

        expect(response.status).to eq(200)
        expect(json.count).to eq(1)
        expect(json[0]['id']).to eq(@inactive_user.id)
      end
    end
  end

  describe '#show' do
    context 'when user exists' do
      before do
        @user = active_user

        get "/api/users/#{@user.id}"
      end

      it 'should display id' do
        expect(response.status).to eq(200)
        expect(json['id']).to eq(@user.id)
      end

      it 'should display first name' do
        expect(response.status).to eq(200)
        expect(json['first_name']).to eq(@user.first_name)
      end

      it 'should display last name' do
        expect(response.status).to eq(200)
        expect(json['last_name']).to eq(@user.last_name)
      end

      it 'should display status' do
        expect(response.status).to eq(200)
        expect(json['status']).to eq(@user.status)
      end

      it 'should display email' do
        expect(response.status).to eq(200)
        expect(json['email']).to eq(@user.email)
      end

      it 'should display created at' do
        expect(response.status).to eq(200)
        expect(json['created_at']).to eq(@user.created_at.as_json)
      end
    end

    context 'when user does not exist' do
      it 'should display error' do
        get "/api/users/fake"

        expect(response.status).to eq(404)
        expect(json['mssg']).not_to be_nil
      end
    end
  end
end
