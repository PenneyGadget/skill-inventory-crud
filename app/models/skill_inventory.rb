require 'yaml/store'

class SkillInventory

  def self.database
    if ENV["RACK_ENV"] == "test"
      @database ||= Sequel.sqlite("db/skill_inventory_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/skill_inventory_development.sqlite3")
    end
  end

  def self.table(id)
    database.from(:skills).where(id: id)
  end

  def self.create(skill)
    database[:skills].insert(skill)
  end

  def self.raw_skills
    database.transaction do
      database["skills"] || []
    end
  end

  def self.all
    raw_skills = database.from(:skills).to_a
    raw_skills.map { |data| Skill.new(data) }
  end

  def self.find(id)
    data = table(id).to_a.first
    Skill.new(data)
  end

  def self.update(id, data)
   table(id).update(data)
  end

  def self.delete(id)
    table(id).delete
  end

  def self.delete_all
    database.transaction do
      database['skills'] = []
      database['total'] = 0
    end
  end

end
