# frozen_string_literal: true
require 'pry'
require 'rails_helper'

RSpec.describe 'Tools API' do
  def tool_params
    {
      name: 'Hammer',
      quantity: 4,
      available: true
    }
  end
    def user_params
    {
      email: 'alice@example.com',
      password: 'foobarbaz',
      password_confirmation: 'foobarbaz'
    }
  end

  def tools
    Tool.all
  end

  def tool
    Tool.first
  end

  before(:all) do
    post '/sign-up', params: { credentials: user_params }
    post '/sign-in', params: { credentials: user_params }

    @token = JSON.parse(response.body)['user']['token']
    @user_id = JSON.parse(response.body)['user']['id']

    Tool.create!(tool_params)
  end

  def headers
      {
        'HTTP_AUTHORIZATION' => "Token token=#{@token}"
      }
  end

  after(:all) do
    Tool.delete_all
    User.delete_all
  end

  describe 'GET /tools' do
    it 'lists all tools' do
      get '/tools', headers: headers

      expect(response).to be_success

      tools_response = JSON.parse(response.body)
      expect(tools_response.length).to eq(tools.count)
      expect(tools_response.first['name']).to eq(tool_params[:name])
    end
  end

  describe 'GET /tools/:id' do
    it 'shows one tool' do
      # make a get request to articles with the id of the article that was
      # created before running this test
      get "/tools/#{tool.id}"

      expect(response).to be_success

      tool_response = JSON.parse(response.body)

      expect(tool_response['id']).to eq(tool.id)

      expect(tool_response['name']).to eq(tool.name)
    end
  end

  describe 'DELETE /tools/:id' do
    it 'deletes a tool' do
    delete "/tools/#{tool.id}"

    expect(response).to be_success
    expect(response.status).to eq(204)
    expect(response.body).to be_empty
    expect(tool).to be_nil
    end
  end

  describe 'PATCH /tools/:id' do
  def tool_diff
      { quantity: 12 }
    end
  skip 'updates a tool quantity' do
    patch "/tools/#{tool.id}", params: {tool: tool_diff }

    tool_response = JSON.parse(response.body)
    expect(response).to be_success
    expect(tool_response['quantity']).to eq(tool_diff[:quantity])
  end
end

  describe 'POST /tools' do
    skip 'creates a new tool' do
    post '/tools/', params:{tool: tool_params}
         tool_response = JSON.parse(response.body)
    expect(response).to be_success
    expect(tool_response['name']).to eq(tool_params[:name])
    expect(tool_response['quantity']).to eq(tool_params[:quantity])
    expect(tool_response['available']).to eq(tool_params[:available])

    end
  end
end
