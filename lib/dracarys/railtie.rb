module Dracarys
  class Railtie < ::Rails::Railtie
    initializer "dracarys.insert_middleware" do |app|
      if ActionDispatch.const_defined? :RequestId
        app.config.middleware.insert_after ActionDispatch::RequestId, Dracarys::Middleware
      else
        app.config.middleware.insert_after Rack::MethodOverride, Dracarys::Middleware
      end
    end
  end
end
