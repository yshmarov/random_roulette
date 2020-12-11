class Share < ApplicationRecord
  belongs_to :piggy_bank
  belongs_to :user
end
