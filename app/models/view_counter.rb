# frozen_string_literal: true

class ViewCounter < ActiveRecord::Base
  belongs_to :issue, required: true
  has_many :view_counts, dependent: :destroy
end
