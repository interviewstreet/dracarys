module Dracarys
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      Dracarys.init!
      @app.call(env)
    end
  end
end
