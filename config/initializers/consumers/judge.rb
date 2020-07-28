# frozen_string_literal: true

channel = RabbitMq.consumer_channel
queue = channel.queue('judge', durable: true)

queue.subscribe(manual_ack: true) do |delivery_info, _properties, payload|
  JSON.parse(payload)

  channel.ack(delivery_info.delivery_tag)
end
