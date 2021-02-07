class CommunicationStyle < ActiveYaml::Base
  include ActiveHash::Enum
  set_root_path "config/divisions"
  set_filename "communication_style"
  enum_accessor :type
end