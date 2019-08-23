require "active_record"
require "active_support/concern"
require "active_support/lazy_load_hooks"

require "active_record/bulk_insert/version"

module ActiveRecord
  module BulkInsert
    extend ActiveSupport::Concern

    class_methods do
      def bulk_insert(objects)
        puts objects
      end
    end
  end
end

ActiveSupport.on_load(:active_record) do
  ActiveRecord::Base.include(ActiveRecord::BulkInsert)
end
