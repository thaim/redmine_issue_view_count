module RedmineIssueViewCount
  module IssueQueryPatch
    module Include
      extend ActiveSupport::Concern

      included do
        self.available_columns << QueryAssociationColumn.new(
          :issue_view_counter,
          :count,
          caption: :field_issue_view_counter_count,
          sortable: "#{IssueViewCounter.table_name}.count"
        )
      end
    end

    module Prepend
      def joins_for_order_statement(order_options)
        return super unless order_options && order_options.include?('issue_view_counters')
        [super, "LEFT OUTER JOIN #{IssueViewCounter.table_name} ON #{IssueViewCounter.table_name}.issue_id = #{queried_table_name}.id"].join(' ')
      end
    end

    ActiveSupport::Reloader.to_prepare do
      IssueQuery.include Include
      IssueQuery.prepend Prepend
    end
  end
end
