class Like < ApplicationRecord
  belongs_to :listener
  belongs_to :album
end
