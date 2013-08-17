class ServicesController < NodesController
   self.resource_class = Service 
   self.default_scope = -> { Service.includes(:device) }
end
