class Event::Discovery < Event
  def process!
    args = arguments.symbolize_keys
    type = args.delete(:type)
    puts "node is #{node.inspect} type = #{type}"
    unless self.node
      klass = Node.klass(type) 
      puts "klass = #{klass}"
      puts "arguments = #{arguments.inspect}"
      self.node = klass.unique_scope(args).first_or_create(args)
    end
    self.node.update_attributes(args)
    self.node.save!
    save!
  end
end
