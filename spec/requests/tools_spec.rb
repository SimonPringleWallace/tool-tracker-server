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

  def tools
    Tool.all
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

  describe 'GET /tools' do
    it 'lists all tools' do
      get '/tools'

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
  it 'updates a tool quantity' do
    patch "/tools/#{tool.id}", params: {tool: tool_diff }
    tool_response = JSON.parse(response.body)
    expect(response).to be_success
    expect(tool_response['quantity']).to eq(article_diff[:quantity])
  end
end

  describe 'POST /articles' do
    skip 'creates an article' do
    post '/articles/', params:{article: article_params}
         article_response = JSON.parse(response.body)
    expect(response).to be_success
    expect(article_response['title']).to eq(article_params[:title])
    expect(article_response['content']).to eq(article_params[:content])
    end
  end
end
