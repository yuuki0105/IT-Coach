class Term < ActiveYaml::Base
  include ActiveHash::Enum
  set_root_path "config/divisions"
  set_filename "term"
  enum_accessor :type
end