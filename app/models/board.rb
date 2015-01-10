class Board < ActiveRecord::Base
  belongs_to :user
  has_many :lessons
  accepts_nested_attributes_for :lessons, reject_if: lambda {|attributes| attributes['content'].blank?}, allow_destroy: true
end
