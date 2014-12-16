require "dracarys/version"
require "dracarys/middleware"
require "dracarys/railtie" if defined?(Rails::Railtie)

module Dracarys
  def self.store
    Thread.current[:dracarys] ||= []
  end

  def self.init!
    teardown!
  end

  def self.clear!
    Thread.current[:dracarys] = []
  end

  def self.push(breakpoint)
    store << [breakpoint, Time.now.utc.to_i]
  end

  def self.get_request_uid
    @request_uid ||= (defined? $request_uid) ? $request_uid : gen_request_uid
  end

  def self.clear_request_uid
    @request_uid = nil
  end

  def gen_request_uid
    (rand(100).to_s + Time.now.to_i.to_s).to_i.to_s(30)
  end

  def self.dump!
    store.dup
    teardown!
  end

  def self.teardown!
    clear!
    clear_request_uid
  end
end
