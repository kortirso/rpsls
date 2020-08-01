# frozen_string_literal: true

Rails.application.config.after_initialize do
  channel = RabbitMq.consumer_channel
  queue = channel.queue('judge', durable: true)

  queue.subscribe(manual_ack: true) do |delivery_info, _properties, payload|
    Games::CreateService.call(call_ids: JSON.parse(payload))

    channel.ack(delivery_info.delivery_tag)
  end
end
