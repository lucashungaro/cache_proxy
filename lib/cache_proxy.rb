require "active_support"

module CacheProxy
  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end

  module Common
    def cache_proxy(key, options = {}, &block)
      options.reverse_merge!({
        :cached => true,
        :cache_expires_in => 30.days
      })

      repository = options[:repository] || Rails.cache

      if options[:cached]
        repository.fetch(key, :expires_in => options[:cache_expires_in], &block)
      else
        yield
      end
    end
  end

  module ClassMethods
    include Common
  end

  module InstanceMethods
    include Common
  end
end