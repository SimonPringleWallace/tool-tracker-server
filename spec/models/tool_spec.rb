require 'rails_helper'

RSpec.describe Tool, type: :model do
  it 'is not valid without a name'
  it 'does not have a name containing special characters'
  it 'is not valid without a quantity'
  it 'is not valid without an availability status'
  it "is not valid if 'available' is not a boolean"
end
