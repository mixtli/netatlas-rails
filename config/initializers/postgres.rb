# This gets userstamp plugin to work inside change_table
ActiveRecord::ConnectionAdapters::Table.send(:include, Ddb::Userstamp::MigrationHelper)
ActiveRecord::ConnectionAdapters::PostgreSQLAdapter::TableDefinition.send(:include, Ddb::Userstamp::MigrationHelper)

module ActiveRecord
  module ConnectionAdapters
    class TableDefinition
      def timestamps_with_deleted_at(*args)
        options = args.extract_options!
        timestamps_without_deleted_at(*args)
        column(:deleted_at, :datetime, options)
      end
      alias_method_chain :timestamps, :deleted_at
    end
  end
end
