class Greeter
  @@greeting_styles = {
    pirate: 'Yar! Ahoy',
    victorian: 'Ever so delightful to meet thee',
    aussie: "G'day"
  }
  def self.greeting_styles(style = nil)
    return @@greeting_styles if style.nil?
    return @@greeting_styles[style] if @@greeting_styles.has_key? style
    ''
  end
  
  def greet
    'Hello!'
  end
  def greet_by_name name
    return self.greet if name == '' or name.class != String
    "Hello, #{name}!"
  end
  def greet_as name, options
    return self.greet_by_name name unless 
      options.class == Hash and 
      options.has_key? :as and 
      !options[:as].nil?
    styled_greeting = self.class.greeting_styles(options[:as])
    if name.class != String or name == ''
      ending = '!'
    else 
      ending = ", #{name}!"
    end
    return "Hello#{ending}" if styled_greeting.nil? or styled_greeting == ''
    "#{styled_greeting}#{ending}"
  end
end