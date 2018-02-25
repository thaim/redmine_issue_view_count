# frozen_string_literal: true

class ViewCounter < ActiveRecord::Base
  belongs_to :issue, required: true
end
