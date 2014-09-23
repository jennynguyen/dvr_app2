class App < ApplicationController
  # session NEW
  get('/') do
    if session[:current_user] # if there is a user set in the session
      redirect to("/viewers/#{session[:current_user][:id]}")
    else
      render(:erb, :'session/new')
    end
  end

  # session CREATE
  post('/session') do
    # look up the user by the name in params
    user = Viewer.find(name: params[:user_name])
    if user.nil? # if there was no user found with that name
      # flash is like session, except it only lasts for ONE MORE request!
      flash[:error] = "No user found with that name!"
      redirect to('/')
    else
      # add a user to the session hash
      current_user_id = user.id
      session[:current_user]  = {id: current_user_id}
      redirect to("/viewers/#{current_user_id}")
    end
  end

  # session DELETE
  delete('/session') do
    # clear out the user from the session
    session[:current_user] = nil
    redirect to('/')
  end

  get('/viewers') do
    # redirect to ('/viewers')
  end

  get('/viewers/new') do
    render(:erb, :"viewers/new")
  end

  get ('/viewers/:id') do
    @viewer = Viewer.find(id:params[:id])
    render(:erb, :"viewers/show")
  end


  get('/viewers') do
    @viewers = Viewer.all
    render(:erb, :"viewers/index" )
  end

  get('/viewers/:id/edit') do
    @id = params["id"]
    render(:erb, :"viewers/edit")
  end

  put('/viewers/:id/edit') do
    viewer = Viewer.find(id:params[:id])
    viewer.name = params["name"]
    viewer.save
    # redirect to("/viewers")
  end


  post('/viewers') do
    new_viewer = params["viewer"]
    v = Viewer.new(new_viewer)
    v.save
    # redirect to ('/viewers')
  end

  delete('/viewers') do
    id = params["delete"]
    # binding.pry
    delete = Viewer.find(id:id)
    # redirect to ('/viewers')
  end






end
