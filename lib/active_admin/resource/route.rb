module ActiveAdmin
  class Resource
    module Routes
      def route_reorder_instance_path(resource, additional_params = {})
        route_builder.reorder_instance_path(resource, additional_params)
      end

      private

      class RouteBuilder
        def reorder_instance_path(instance, additional_params = {})
          path = resource.resources_configuration[:self][:route_instance_name]
          route_name = route_name(path, action: :reorder)

          routes.public_send route_name, *route_instance_params(instance), additional_params
        end
      end
    end
  end
end
