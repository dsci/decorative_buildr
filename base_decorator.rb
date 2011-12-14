module DecorativeBuildr
  class BaseDecorator
  
    def initialize(decorated)
      @decorated = decorated
    end
  
    def method_missing(method,*args)
      @decorated.send(method,args)
    end
  end  
end