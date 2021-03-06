# frozen_string_literal: true

require_dependency 'redmine_issue_view_count/hook'
require_dependency 'redmine_issue_view_count/issue_patch'
require_dependency 'redmine_issue_view_count/issue_query_patch'

Redmine::Plugin.register :redmine_issue_view_count do
  name 'Redmine Issue View Count Plugin'
  author 'thaim'
  version '1.0.0'
end
