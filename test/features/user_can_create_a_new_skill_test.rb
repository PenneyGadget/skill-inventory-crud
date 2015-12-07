require_relative '../test_helper'

class UserCanCreateANewSkill < FeatureTest

  def test_user_can_create_a_skill
    visit '/skills/new'

    fill_in('skill[title]', :with => "Coffee")
    fill_in('skill[description]', :with => "Drinking it")
    click_button "Submit"

    assert page.has_content? "Coffee"
  end

end
