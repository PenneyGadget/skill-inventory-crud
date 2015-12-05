require_relative '../test_helper'

class SkillInventoryTest < Minitest::Test

  def create_skills(num)
    num.times do |n|
      SkillInventory.create(:title => "a title #{n+1}", :description => "a description #{n+1}")
    end
  end

  def test_a_skill_is_created
    create_skills(1)
    skill = SkillInventory.all.last

    assert_equal "a title 1", skill.title
    assert_equal "a description 1", skill.description
    assert_equal SkillInventory.all.first.id, skill.id
  end

  def test_all_method_collects_all_our_skills
    create_skills(2)
    skills = SkillInventory.all
    skill1, skill2 = skills[0], skills[1]

    assert_equal 2, skills.length
    assert_equal "a title 1", skill1.title
    assert_equal "a description 2", skill2.description
  end

  def test_find_method_finds_our_skills_and_their_details
    create_skills(3)
    id = SkillInventory.all.last.id
    skill = SkillInventory.find(id)

    assert_equal "a title 3", skill.title
    assert_equal 3, SkillInventory.all.length
    assert_equal "a description 3", skill.description
    assert_equal Skill, skill.class
  end

  def test_update_method_updates_skills_correctly
    SkillInventory.create(:title => "words", :description => "using them")
    id = SkillInventory.all.last.id

    SkillInventory.update(id, {:title => "words", :description => "using them real good"})
    updated = SkillInventory.find(id)

    assert_equal "using them real good", updated.description
  end

  def test_delete_method_deletes_a_skill_and_others_remain
    create_skills(3)
    skills_before = SkillInventory.all

    assert_equal 3, skills_before.length

    id = SkillInventory.all.last.id
    SkillInventory.delete(id)
    skills_after = SkillInventory.all

    assert_equal 2, skills_after.length
    refute skills_after.any? { |skill| skill.id == 3 }
    assert skills_after.none? { |skill| skill.title == "a title 3"}
  end

end
