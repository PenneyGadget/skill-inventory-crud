class SkillInventoryApp < Sinatra::Base

  get '/' do
    haml :dashboard
  end

  # see all
  get '/skills' do
    @skills = SkillInventory.all
    haml :index
  end

  # form to create new
  get '/skills/new' do
    haml :new
  end

  # submit new
  post '/skills' do
    SkillInventory.create(params[:skill])
    redirect '/skills'
  end

  # see one
  get '/skills/:id' do |id|
    @skill = SkillInventory.find(id.to_i)
    haml :show
  end

  # form to edit
  get '/skills/:id/edit' do |id|
    @skill = SkillInventory.find(id.to_i)
    haml :edit
  end

  # update task
  put '/skills/:id' do |id|
    SkillInventory.update(id.to_i, params[:skill])
    redirect "/skills/#{id}"
  end

  # delete
  delete '/skills/:id' do |id|
    SkillInventory.delete(id.to_i)
    redirect '/skills'
  end

  not_found do
    haml :error
  end

end
