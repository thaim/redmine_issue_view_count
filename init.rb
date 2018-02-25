# frozen_string_literal: true

require_dependency 'redmine_issue_view_count/hook'

Redmine::Plugin.register :redmine_issue_view_count do
  name 'Redmine Issue View Count Plugin'
  author 'thaim'
  version '0.0.2'
end
