module RedmineIssueViewCount
  module IssueQueryPatch
    module Include
      extend ActiveSupport::Concern

      included do
        self.available_columns << QueryAssociationColumn.new(
          :view_counter,
          :count,
          caption: :field_issue_view_counter_count,
          sortable: "#{ViewCounter.table_name}.count"
        )
      end
    end

    module Prepend
      def joins_for_order_statement(order_options)
        return super unless order_options && order_options.include?('view_counters')
        [super, "LEFT OUTER JOIN #{ViewCounter.table_name} ON #{ViewCounter.table_name}.issue_id = #{queried_table_name}.id"].join(' ')
      end
    end

    ActiveSupport::Reloader.to_prepare do
      IssueQuery.include Include
      IssueQuery.prepend Prepend
    end
  end
end
