# frozen_string_literal: true

class ToolSerializer < ActiveModel::Serializer
  attributes :id, :name, :quantity, :available
end
