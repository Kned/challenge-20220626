
require 'sidekiq-scheduler'
class ImportUpdate
  include Sidekiq::Worker

  def perform(*args)
    ImportService.new.update
  end
end
