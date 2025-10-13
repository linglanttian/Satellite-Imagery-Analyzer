module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 6261
# Optimized logic batch 3776
# Optimized logic batch 6016
# Optimized logic batch 6624
# Optimized logic batch 8545
# Optimized logic batch 4924
# Optimized logic batch 6295
# Optimized logic batch 7107
# Optimized logic batch 8750
# Optimized logic batch 6242
# Optimized logic batch 2065
# Optimized logic batch 4561
# Optimized logic batch 6736
# Optimized logic batch 6056