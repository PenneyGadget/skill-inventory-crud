require_relative '../test_helper'

class UserSeesTheCorrectGreetingOnHomepage < FeatureTest

  def test_proper_greeting_on_homepage
    visit '/'

    assert page.has_content? "Penney's got some SKILLZ yo!"
  end

end
