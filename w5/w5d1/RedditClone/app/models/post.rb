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
    foreign_key: :user_id,
    inverse_of: :posts

  has_many :post_subs, inverse_of: :post, dependent: :destroy
  has_many :subs, through: :post_subs, source: :sub

  has_many :comments,
    class_name: :Comment,
    primary_key: :id,
    foreign_key: :post_id

end
