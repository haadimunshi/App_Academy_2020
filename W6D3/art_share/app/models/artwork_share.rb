class ArtworkShare < ApplicationRecord
    validates :viewer_id, presence: true
    validates :artwork_id, presence: true
    validates :artwork_id, uniqueness: { scope: :viewer_id,
        message: 'viewer has already had this artwork shared with them' }

    belongs_to :artwork,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :Artwork

    belongs_to :viewer,
        primary_key: :id,
        foreign_key: :viewer_id,
        class_name: :User
end
