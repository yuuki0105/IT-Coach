class WantYenPerHour < ActiveYaml::Base
  include ActiveHash::Enum
  set_root_path "config/divisions"
  set_filename "want_yen_per_hour"
end
