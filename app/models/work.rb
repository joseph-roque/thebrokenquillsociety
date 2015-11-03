class Work < ActiveRecord::Base

  # Associations
  belongs_to :user
  has_many :comments, dependent: :delete_all

  # Tagging
  acts_as_taggable

  # Verifying minimum length of the title
  validates :title,
    presence: { message: 'Your work must have a title.'},
    length: { maximum: 255, too_long: 'Your title can be a maximum %{count} characters'}

  # Verifying that a body was provided
  validates :body,
    presence: { message: 'You cannot submit a blank work.' }

  validates :tag_list,
    presence: { message: 'You must provide at least one tag.'}

end