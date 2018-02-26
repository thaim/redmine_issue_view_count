# frozen_string_literal: true

class IssueViewCountersController < ApplicationController
  before_action :set_issue

  def create
    @issue.create_issue_view_counter unless @issue.issue_view_counter
    IssueViewCounter.increment_counter :count, @issue.issue_view_counter
    head :ok
  end

  private

  def set_issue
    @issue = Issue.find(params[:id])
  end
end
