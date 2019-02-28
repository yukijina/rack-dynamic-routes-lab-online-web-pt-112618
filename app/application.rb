class Application
  
  def call(env)
    resp = Rack::Response.new 
    req = Rack::Request.new(env)
#binding.pry
    if req.path.match("/items")
      item_name = req.path.split("/items/").last
      #req.path => "/items/Figs", req.path.split("/items/") => ["", "Figs"]
      
      item = @@items.find{|item| item.name == item_name}
        if item.name = item_name
          resp.write "#{item.price}\n"
          resp.status = 200
        else
          resp.write "Item not found\n"
          resp.status = 400
        end
      end
      
    else
      resp.write "Route not found\n"
      resp.status = 404
    end
    resp.finish
  end 
end 