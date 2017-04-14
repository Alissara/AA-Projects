class ShortenedUrl < ActiveRecord::Base
  validates :user_id, :short_url, :long_url, presence: true
  validates :short_url, uniqueness: true

  belongs_to :submitter,
    class_name: 'User',
    primary_key: :id,
    foreign_key: :user_id

  has_many :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :visitor

  has_many :visits,
   primary_key: :id,
   foreign_key: :shortened_url_id,
   class_name: :Visit,
   dependent: :destroy

  has_many :tag_topics,
    through: :taggings,
    source: :tag_topic

  has_many :taggings,
    class_name: 'Tagging',
    primary_key: :id,
    foreign_key: :shortened_url_id

  def self.random_code
    loop do
      random_code = SecureRandom.urlsafe_base64(16)
      return random_code unless ShortenedUrl.exists?(short_url: random_code)
    end
  end

  def self.generate_url(user, long_url)
    ShortenedUrl.create!(
      :user_id => user.id,
      :long_url => long_url,
      :short_url => ShortenedUrl.random_code
    )
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    visits.select("user_id").distinct.count
  end

  def num_recent_uniques
    visits
      .select("user_id")
      .where("created_at > ?", 10.minutes.ago)
      .distinct
      .count
  end

end
