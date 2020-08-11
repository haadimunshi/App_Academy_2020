class User < ApplicationRecord
    validates :email, presence: true
    validates :email, uniqueness: true

    has_many :submitted_urls,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :ShortenedURL

    has_many :visits,
        primary_key: :id,
        foreign_key: :visitor_id,
        class_name: :Visit

    has_many :visited_urls,
        -> { distinct },
        through: :visits,
        source: :shortened_url
end