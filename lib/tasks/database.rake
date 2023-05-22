namespace :database do
  task import: :environment do
    ImportService.new.import
  end
end
