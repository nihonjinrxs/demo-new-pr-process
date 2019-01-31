class Greeter
  def greet
    'Hello!'
  end
  def greet_by_name name
    return self.greet if name == '' or name.class != String
    "Hello, #{name}!"
  end
end