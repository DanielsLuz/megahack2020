class NotificationsWorker
  include Sidekiq::Worker

  def perform(*args)
    puts "sending notification"
  end
end
