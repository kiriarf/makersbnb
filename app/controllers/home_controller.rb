class BnB < Sinatra::Base
  get '/' do
    @spaces = Space.all
    erb(:index)
  end
end
