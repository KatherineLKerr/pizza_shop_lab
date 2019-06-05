require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza_order')
also_reload('./models/*')

# order to write things in:
# db -> models -> controller -> views

#NEW
get '/pizza-orders/new' do
  erb(:new)
end

#CREATE
post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save
  erb(:create)
end

#INDEX
get '/pizza-orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end

#SHOW
get '/pizza-orders/:id' do
  @order = PizzaOrder.find(params[:id].to_i) #params hash understands both symbols and strings, so could put "id" instead of :id
  erb(:show)
end

#EDIT
get '/pizza-orders/:id/edit' do
  @order = PizzaOrder.find(params[:id].to_i)
  erb(:edit)
end

#UPDATE
post '/pizza-orders/:id' do
  @order = PizzaOrder.new(params) #This is a new Ruby instance not a new order.
  @order.update()
  erb(:update)
end

#DELETE
post '/pizza-orders/:id/delete' do
  @order = PizzaOrder.find(params[:id].to_i)
  @order.delete()
  #REDIRECT
  redirect '/pizza-orders'
end
