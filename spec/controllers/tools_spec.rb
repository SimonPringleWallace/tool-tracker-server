# frozen_string_literal: true

require 'rails_helper'
RSpec.describe ToolsController do
  def tool_params
    {
      name: 'Hammer',
      quantity: 4,
      available: true
    }
  end

  def tool
    Tool.first
  end

  before(:all) do
    Tool.create!(tool_params)
  end

  after(:all) do
    Tool.delete_all
  end

  describe 'GET index' do
    #  use before to run the following after each of the 'it' blocks
    before(:each) { get :index}
    it 'is succesful' do
      expect(response.status).to eq(200)
    end

    it 'renders a JSON response' do
    # take the JSON response, parse into a ruby object
    # we can manipulate the object and compare it to the database
    tools_response = JSON.parse(response.body)

    expect(tools_response).not_to be_nil
    expect(tools_response.first['name']).to eq(tool[:name])
    end
  end

  describe 'GET show' do
    before(:each) { get :show, params: { id: tool.id } }
    it 'is successful' do
      expect(response.status).to eq(200)
    end

    it 'renders a JSON response' do
      tool_response = JSON.parse(response.body)

      expect(tool_response).not_to be_nil
      expect(tool_response['id']).to eq(tool.id)
      expect(tool_response['name']).to eq(tool_params[:name])
    end
  end

# binding.pry

  describe 'DELETE destroy' do
    it 'is successful and returns an empty response' do
      delete :destroy, params: { id: tool.id }
      expect(response.body).to be_empty

      expect(tool).to be_nil
    end
  end

  describe 'PATCH update' do
    def tool_diff
      { quantity: 12 }
    end

    before(:each) do
      patch :update, params: { id: tool.id, tool: tool_diff }
    end

    it 'is successful' do
      expect(response.status).to eq(200)
    end

    it 'renders a JSON response' do
      tool_response = JSON.parse(response.body)

      expect(tool_response['quantity']).to eq(tool_diff[:quantity])
    end
  end

  describe 'POST create' do
    before(:each) do
      post :create, params: { tool: tool_params }
    end

    it 'is successful' do
      expect(response).to be_success
      expect(response.status).to eq(201)
    end

    it 'renders a JSON response' do
      tool_response = JSON.parse(response.body)

      expect(tool_response['name']).to eq(tool_params[:name])
      expect(tool_response['quantity']).to eq(tool_params[:quantity])
      expect(tool_response['available']).to eq(tool_params[:available])
    end
  end
end
