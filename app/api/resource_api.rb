module NetAtlas
  module Base
    def self.included(base)
      base.class_eval do
        def self.resource_class=(klass)
          @resource_class = klass
        end
        def self.resource_class
          @resource_class
        end
        def self.resource_root
          @resource_class.to_s.underscore.to_sym
        end
        format :json
        get do
          limit = params[:limit] || 100
          offset = params[:offset] || 0
          base.resource_class.scoped.limit(limit).offset(offset).search(params[:q]).result.all
        end

        get ':id' do
          begin
            res = base.resource_class.find(params[:id])
            Rails.logger.debug "params = #{params.inspect}"
            Rails.logger.debug "res = #{res.as_json.inspect}"
            res.as_json
          rescue ActiveRecord::RecordNotFound
            error! "Resource not found!", 404
          end
        end

        post do
          attributes = params[base.resource_root].slice(*base.resource_class.accessible_attributes.to_a)
          base.resource_class.create!(attributes)
        end

        put ':id' do
          begin
            resource = base.resource_class.find(params[:id])      
            attributes = params[base.resource_root].slice(*base.resource_class.accessible_attributes.to_a)
            resource.update_attributes(attributes)
            resource.save
            Rails.logger.debug "resource = #{resource.inspect}"
            resource
          rescue ActiveRecord::RecordNotFound
            error! "Resource not found!", 404
          end
        end

        delete ":id" do
          begin
            resource = base.resource_class.find(params[:id])
            resource.destroy
          rescue ActiveRecord::RecordNotFound
            error! "Resource not found!", 404
          end
        end
      end
    end
  end
end
