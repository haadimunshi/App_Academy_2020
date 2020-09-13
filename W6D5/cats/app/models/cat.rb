# require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    STANDARD_COLORS = %w(black white orange brown).freeze
    validates :color, inclusion: STANDARD_COLORS
    validates :sex, inclusion: %w(M F)
    validates :birth_date, :color, :name, :sex, :description, presence: true


    def age
        time_ago_in_words(birth_date)
    end

end