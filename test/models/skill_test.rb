require_relative '../test_helper'

class SkillTest < Minitest::Test

  def test_assigns_attributes_correctly
    skill = Skill.new({ :id          => 1,
                        :title       => "Rocks",
                        :description => "Penney can climb them"})

    assert_equal "Rocks", skill.title
    assert_equal "Penney can climb them", skill.description
    assert_equal 1, skill.id
  end

end
