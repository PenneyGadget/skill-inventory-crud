require_relative '../test_helper'

class SkillTest < Minitest::Test

  def test_assigns_attributes_correctly
    skill = Skill.new({ "title"       => "climbing",
                        "description" => "Penney can climb them",
                        "id"          => 1 })

    assert_equal "climbing", skill.title
    assert_equal "Penney can climb them", skill.description
    assert_equal 1, skill.id
  end

end
