class Singer < ActiveRecord::Base
    has_many :albums, dependent: :destroy
    has_many :member, dependent: :destroy
end
