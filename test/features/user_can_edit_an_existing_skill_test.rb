require_relative '../test_helper'

class UserCanEditASkill < FeatureTest

  def test_user_can_edit_their_skills
    SkillInventory.create({title: "Yarn", description: "Knitting it"})
    id = SkillInventory.all.last.id

    visit "/skills"
    click_link "(Edit this sweet skill to be better!)"
    assert_equal "/skills/#{id}/edit", current_path

    fill_in("skill[description]", :with => "Knitting it good")
    click_button("submit")

    assert_equal "/skills/#{id}", current_path
    assert page.has_content? "Knitting it good"
  end

end
