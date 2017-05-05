class TagTopic < ActiveRecord::Base
  validates :tag, uniqueness: true

  has_many :taggings,
    class_name: 'Tagging',
    primary_key: :id,
    foreign_key: :tag_id

  has_many :shortened_urls,
    through: :taggings,
    source: :shortened_url

  def popular_links
    data = shortened_urls
    .joins(:visits)
    .group(:short_url)
    .order('COUNT(visits.id) DESC')
    .select('long_url, short_url, COUNT(visits.id) as number_of_visits')
    .limit(5)
  end

end
