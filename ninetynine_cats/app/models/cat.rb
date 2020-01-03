# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
COLORS = ['brown', 'gray', 'white', 'black', 'orange', 'calico']

class Cat < ApplicationRecord

    validates :birth_date, :color, :name, :sex, :description, presence: true
    validates :color, inclusion: COLORS 
    validates :sex, inclusion: ["M", "F"] 

    def age
        # birth_date
        Time.now.year - self.birth_date.year
    end

end
