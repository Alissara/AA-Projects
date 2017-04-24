# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  description  :text             not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ApplicationRecord
  validates :title, :description, :moderator, presence: true
  validates :name, uniqueness: true

  belongs_to :moderator,
    class_name: :User,
    primary_key: :id,
    foreign_key: :moderator_id

  has_many :post_subs,
    class_name: :PostSub,
    primary_key: :id,
    foreign_key: :sub_id,
    dependent: :destroy

  has_many :posts,
    through: :post_subs,
    source: :post


end
