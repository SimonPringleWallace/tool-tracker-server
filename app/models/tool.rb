class Tool < ApplicationRecord
# validates :name, exclusion: { in: %w( < > ),
# message: "your use of tags is sketchy..." }
validates :available, inclusion: { in: [true, false] }
# validates :quantity, numericality: true

  belongs_to :user
end
