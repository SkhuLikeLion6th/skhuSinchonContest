class Changetype < ActiveRecord::Base
    has_many :areas, dependent: :destroy
end
