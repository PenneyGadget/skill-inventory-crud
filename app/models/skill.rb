class Skill

  attr_reader :title, :description, :id

  def initialize(data)
    @title = data[:title]
    @description = data[:description]
    @id = data[:id]
  end

end
