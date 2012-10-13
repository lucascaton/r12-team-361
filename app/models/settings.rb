class Settings < Settingslogic
  namespace Rails.env
  source "#{Rails.root}/config/application.yml"
end