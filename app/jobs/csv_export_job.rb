class CsvExportJob < ApplicationJob
  queue_as :default

  def perform(user)
    file_path = Rails.root.join('public', 'exports', "#{user.email}_profile_export.csv")

    CSV.open(file_path, 'w') do |csv|
      csv << ['Attribute', 'Value']
      csv << ['Name', user.name]
      csv << ['Email', user.email]
      csv << ['Location', user.location]
      csv << ['Hobbies', user.hobbies.pluck(:name).join(", ")]
    end

    ActionCable.server.broadcast("user_#{user.id}_channel", {
      message: "Your CSV export is complete! You can download it here:",
      download_link: "/exports/#{user.email}_profile_export.csv"
    })
  end
end
