# frozen_string_literal: true

module RedmineIssueView
  module IssuePatch
    extend ActiveSupport::Concern

    included do
      has_one :issue_view_counter, dependent: :destroy
    end

    def view_count
      issue_view_counter&.count || 0
    end
  end

  ActiveSupport::Reloader.to_prepare do
    Issue.include IssuePatch
  end
end
