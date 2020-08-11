class ShortenedURL < ApplicationRecord
    validates :user_id, presence: true
    validates :long_url, presence: true, uniqueness: true

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    has_many :visits,
        primary_key: :id,
        foreign_key: :short_url_id,
        class_name: :Visit

    has_many :visitors,
        -> { distinct },
        through: :visits,
        source: :visitor

    def self.random_code
        loop do
            random_code = SecureRandom.urlsafe_base64(16)
            return random_code unless ShortenedUrl.exists?(short_url: random_code)
        end
    end

    def self.create_for_user_and_long_url!(user, long_url)
        ShortenedURL.create!(user_id: user.id, long_url: long_url, short_url: ShortenedURL.random_code)
    end

    def num_clicks
        visits.count
    end

    def num_uniques
        visitors.count
    end

    def num_recent_uniques
        visits.select('user_id').where('created at > ?', 10.minutes.ago).distinct.count
    end

end