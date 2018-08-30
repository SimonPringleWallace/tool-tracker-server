# frozen_string_literal: true

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

  describe 'GET /articles/:id' do
    skip 'shows one article' do
      # make a get request to articles with the id of the article that was
      # created before running this test
      get "/articles/#{article.id}"

      expect(response).to be_success

      article_response = JSON.parse(response.body)

      expect(article_response['id']).to eq(article.id)

      expect(article_response['title']).to eq(article_params[:title])
    end
  end

  describe 'DELETE /articles/:id' do
    skip 'deletes an article' do
    delete "/articles/#{article.id}"

    expect(response).to be_success
    expect(response.status).to eq(204)
    expect(response.body).to be_empty
    expect(article).to be_nil
    end
  end

  describe 'PATCH /articles/:id' do
    def article_diff
      { title: 'Two Stupid Tricks' }
    end
  skip 'updates an article' do
     patch "/articles/#{article.id}", params:{article: article_diff }
     article_response = JSON.parse(response.body)
expect(response).to be_success
expect(article_response['title']).to eq(article_diff[:title])
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
