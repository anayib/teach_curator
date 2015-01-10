class Board < ActiveRecord::Base

  belongs_to :user
  has_many :lessons, :dependent => :destroy
  accepts_nested_attributes_for :lessons, reject_if: lambda {|attributes| attributes['title'].blank?}, allow_destroy: true
end
