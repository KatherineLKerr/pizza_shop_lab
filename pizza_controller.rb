require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza_order')
also_reload('./models/*')

# order to write things in:
# db -> models -> controller -> views

#INDEX
get '/pizza-orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end

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

#EDIT
get '/pizza-orders/:id/edit' do
  @order = PizzaOrder.find(params[:id].to_i)
  erb(:edit)
end

#SHOW
get '/pizza-orders/:id' do
  @order = PizzaOrder.find(params[:id].to_i) #params hash understands both symbols and strings, so could put "id" instead of :id
  erb(:show)
end

#UPDATE
post '/pizza-orders' do
  @order = PizzaOrder.update(params)
  @order.save
  erb(:update)
end

#DELETE
post '/pizza-orders/:id/delete' do
  @order = PizzaOrder.find(params[:id].to_i)
  @order.delete()
  #REDIRECT
  redirect '/pizza-orders'
end
