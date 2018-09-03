require 'rails_helper'
require 'pry'
RSpec.describe Tool, type: :model do
  subject {
    Tool.create(name: 'Hammer', quantity: 4, available: true)
  }
binding.pry
  it "subject is valid" do
    puts subject.name
    puts subject.quantity
    puts subject.available
  expect(subject).to be_valid
  end


  it "is not valid if 'available' is not a boolean" do
  subject.available = true
  expect(subject).to_not be_valid
  end

  it "is not valid if 'quantity' is not an int" do
  subject.quantity = 1
  expect(subject).to_not be_valid
  end

  skip 'does not have a name containing special characters' do
  subject.title ='<script>'
  expect(subject).to_not be_valid

    end
end
