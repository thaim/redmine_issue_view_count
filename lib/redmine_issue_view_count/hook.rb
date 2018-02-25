# frozen_string_literal: true

module RedmineIssueViewCount
  class Hook < Redmine::Hook::ViewListener
    render_on :view_issues_show_description_bottom,
              partial: 'issue_view_count/hooks/view_issues_show_description_bottom'
  end
end
