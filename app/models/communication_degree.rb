class CommunicationDegree < ActiveYaml::Base
  include ActiveHash::Enum
  set_root_path "config/divisions"
  set_filename "user_want_ability_degree"
  enum_accessor :type

end