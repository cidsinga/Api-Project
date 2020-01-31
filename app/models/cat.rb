class Cat < ApplicationRecord

  scope :kid_friendly -> { where(kid_friendly: "true")}

end
