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
    before(:each) { get :show, params: { id: article.id } }
    skip 'is successful' do
      expect(response.status).to eq(200)
    end

    skip 'renders a JSON response' do
      article_response = JSON.parse(response.body)

      expect(article_response).not_to be_nil
      expect(article_response['id']).to eq(article.id)
      expect(article_response['title']).to eq(article_params[:title])
    end
  end

  describe 'DELETE destroy' do
    skip 'is successful and returns an empty response' do
    delete :destroy, params: { id: article.id }
      expect(response.body).to be_empty

      expect(article).to be_nil
    end
  end

  describe 'PATCH update' do
    def article_diff
      { title: 'Two Stupid Tricks' }
    end

    before(:each) do
      patch :update, params: { id: article.id, article: article_diff }
    end

    skip 'is successful' do
      expect(response.status).to eq(200)
    end

    skip 'renders a JSON response' do
      article_response = JSON.parse(response.body)

      expect(article_response['title']).to eq(article_diff[:title])
    end
  end

  describe 'POST create' do
    before(:each) do
      post :create, params: { article: article_params }
    end

    skip 'is successful' do
      expect(response).to be_success
      expect(response.status).to eq(201)
    end

    skip 'renders a JSON response' do
      article_response = JSON.parse(response.body)

      expect(article_response['title']).to eq(article_params[:title])
      expect(article_response['content']).to eq(article_params[:content])
    end
  end
end
