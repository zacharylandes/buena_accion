class Need < ApplicationRecord
  belongs_to :category
  belongs_to :organization, optional: true
end