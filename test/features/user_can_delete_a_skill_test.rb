require_relative '../test_helper'

class UserCanDeleteASkill < FeatureTest

  def test_user_can_delete_a_skill
    SkillInventory.create({title: "Yarn", description: "Knitting it"})
    
    visit "/skills"
    assert page.has_content? "Yarn"

    click_button("(Delete this dumbass skill)")
    assert_equal "/skills", current_path

    refute page.has_content? "Yarn"
  end

end
