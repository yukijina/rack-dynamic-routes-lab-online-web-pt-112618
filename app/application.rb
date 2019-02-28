class Application
  
  def call(env)
    resp = Rack::Response.new 
    req = Rack::Request.new(env)

    if req.path.match("/items")
      item_name = req.path.split("/items/").last
      #req.path => "/items/Figs", req.path.split("/items/") => ["", "Figs"]
      
      item = @@items.find{|item| item.name == item_name}
        if item.nil?
          resp.write "Item not found\n"
          resp.status = 400
        else  
          resp.write "#{item.price}\n"
          resp.status = 200
        end
    else
      resp.write "Route not found\n"
      resp.status = 404
    end
    resp.finish
  end 
end 