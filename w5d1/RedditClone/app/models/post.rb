# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, :author, presence: true
  validates :subs, presence: { message: "must have at least one sub" }

  belongs_to :author,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  has_many :post_subs,
    class_name: :PostSub,
    primary_key: :id,
    foreign_key: :post_id,
    dependent: :destroy

  has_many :subs,
    through: :post_subs,
    source: :sub

end
