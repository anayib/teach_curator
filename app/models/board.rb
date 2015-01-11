class Board < ActiveRecord::Base
  enum category: [:Biology, :Mathematics, :Physics, :History]
  belongs_to :user
  has_many :lessons, :dependent => :destroy
  accepts_nested_attributes_for :lessons, reject_if: lambda {|attributes| attributes['title'].blank?}, allow_destroy: true
  scope :search, ->(keyword){joins(:lessons).where("lessons.title LIKE :value OR lessons.description LIKE :value OR boards.title LIKE :value OR boards.description LIKE :value", value: "%#{keyword}%") if keyword.present?}
end
