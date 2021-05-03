class NotificationType < ActiveYaml::Base
  include ActiveHash::Enum
  set_root_path "config/divisions"
  set_filename "notification_type"
  enum_accessor :type
end
