class ChitterApp < Sinatra::Base
  get '/sessions/new' do
    erb :'/sessions/new'
  end

  post '/sessions/new' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = ['Invalid username/password']
      erb :'sessions/new'
    end
  end
end