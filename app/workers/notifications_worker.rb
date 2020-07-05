class NotificationsWorker
  include Sidekiq::Worker

  def perform(*args)
    next_orders.each do |order|
      puts "Sending notification"
    end
  end

  def next_orders
    next_time_slot = Owner.first.next_time_slot
    return unless next_time_slot

    Order.where(time_slot_id: next_time_slot.id, completed: false)
  end
end
