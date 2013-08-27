module NetAtlas
  module Base
    def self.included(base)
      base.class_eval do
        http_basic do |email, password|
          user = User.find_by_email(email)
          user && user.valid_password?(password)
        end
        helpers do
          def current_user
            @current_user ||= User.find_by_email(env['REMOTE_USER'])
          end
        end

        before do
          User.stamper = current_user
          Authorization.current_user = current_user
        end
        after do
          User.reset_stamper
        end

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
          conditions = params[:q] ? params[:q].dup : {}
          conditions[:data_streams_poller_id_eq] = params[:poller_id] if params[:poller_id]
          limit = params[:limit] || 100
          offset = params[:offset] || 0
          base.resource_class.search(conditions).result.limit(limit).offset(offset)
        end

        get ':id' do
          begin
            res = base.resource_class.find(params[:id])
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
