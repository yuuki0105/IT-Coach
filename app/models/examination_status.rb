class ExaminationStatus < ActiveYaml::Base
  include ActiveHash::Enum
  set_root_path "config/divisions"
  set_filename "examination_status"
  enum_accessor :type
end
