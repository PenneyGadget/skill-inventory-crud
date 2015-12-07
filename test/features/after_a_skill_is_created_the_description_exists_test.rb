require_relative '../test_helper'

class UsersSkillHasADescriptionOnShowPage < FeatureTest

  def test_users_skill_has_a_description_on_show_page
    SkillInventory.create({title: "Yarn", description: "Knitting it"})
    id = SkillInventory.all.last.id

    visit "/skills/#{id}"

    assert page.has_content? "Knitting it"
  end

end
