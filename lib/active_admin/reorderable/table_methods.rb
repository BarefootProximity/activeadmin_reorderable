module ActiveAdmin
  module Reorderable
    module TableMethods

      def reorder_column
        column '', :class => 'reorder-handle-col' do |resource|
          reorder_handle_for(resource)
        end
      end

      private

      def reorder_handle_for(resource)
        url = active_admin_resource_for(resource.class).route_reorder_instance_path resource
        span(reorder_handle_content, :class => 'reorder-handle', 'data-reorder-url' => url)
      end

      def reorder_handle_content
        '&equiv;&equiv;'.html_safe
      end

    end

    ::ActiveAdmin::Views::TableFor.send(:include, TableMethods)
  end
end

