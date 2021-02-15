class ExaminationStatus < ActiveYaml::Base
  include ActiveHash::Enum
  set_root_path "config/divisions"
  set_filename "examination_status"
  enum_accessor :type

  BEFORE_ID = 1
  PASSED_ID = 10
  FAILED_ID = 20

end