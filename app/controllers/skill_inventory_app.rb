require 'models/skill_inventory'

class SkillInventoryApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')

  get '/' do
    erb :dashboard
  end

  # see all
  get '/skills' do
    @skills = SkillInventory.all
    erb :index
  end

  # form to create new
  get '/skills/new' do
    erb :new
  end

  # submit new
  post '/skills' do
    SkillInventory.create(params[:skill])
    redirect '/skills'
  end

  # see one
  get 'skills/:id' do |id|
    @skill = SkillInventory.find(id.to_i)
    erb :show
  end

end
