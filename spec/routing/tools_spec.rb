# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routes for tools' do
  it 'routes GET /tools to the tools#index action' do
   expect(get('/tools')).to route_to('tools#index')
 end

  it 'routes GET /tools/:id to the tools#show action' do
   expect(get('/tools/4')).to route_to(
     controller: 'tools',
     action: 'show',
     id: '4'
   )
 end

 it 'routes DELETE /tools/:id to the tools#destroy action' do
   expect(delete('/tools/1')).to route_to(
     controller: 'tools',
     action: 'destroy',
     id: '1'
   )
 end

 it 'routes PATCH /tools/:id to the tools#update action' do
   expect(patch('/tools/1')).to route_to(
     controller: 'tools',
     action: 'update',
     id: '1'
   )
 end

  skip 'routes POST /sign-in to the users#signin action' do
    expect(post('/sign-in')).to route_to('users#signin')
  end

  skip 'routes POST /sign-up to the users#signup action' do
    expect(post('/sign-up')).to route_to('users#signup')
  end
end
