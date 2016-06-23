require 'faker'

class Project

  attr_reader :project_name, :identifier, :new_version_name


  def initialize
    @project_name = Faker::Lorem.sentence(3)
    @new_version_name = Faker::Lorem.sentence(3)
    @identifier = 'tanya' + rand(99999).to_s

  end

end