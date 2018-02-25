# frozen_string_literal: true

class ViewCountersController < ApplicationController
  before_action :set_issue

  def create
    @issue.create_view_counter unless @issue.view_counter
    ViewCounter.increment_counter :count, @issue.view_counter
    head :ok
  end

  private

  def set_issue
    @issue = Issue.find(params[:id])
  end
end
