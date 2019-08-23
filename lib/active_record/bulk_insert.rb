require "active_record"
require "active_support/lazy_load_hooks"

require "active_record/bulk_insert/version"

module ActiveRecord
  module BulkInsert
    def bulk_insert(objects, ignore_new_record: true)
      result = objects.group_by(&:new_record?).map { |is_new_record, records|
        if is_new_record
          if ignore_new_record
            records.each(&:save!)
          else
            insert_all!(build_attributes(records))
          end
        else
          upsert_all(build_attributes(records))
        end

        records
      }

      result.flatten
    end

    private

      def build_attributes(objects)
        keys = [required_keys, changed_keys(objects)].flatten.uniq

        objects.map { |object| Hash[keys.map { |k| [k, object.public_send(k)] }] }
      end

      def required_keys
        @required_keys ||= columns.map { |column|
          next if column.null

          column.name
        }.compact - [primary_key]
      end

      def changed_keys(objects)
        now = Time.current
        objects.map { |object|
          object.updated_at = now
          object.created_at ||= now
          object.changed_attributes.keys
        }.flatten.uniq.compact
      end
  end
end

ActiveSupport.on_load(:active_record) do
  ActiveRecord::Base.extend(ActiveRecord::BulkInsert)
end
