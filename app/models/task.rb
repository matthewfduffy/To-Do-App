class Task < ActiveRecord::Base
    validates :title, :description, presence: true
end
