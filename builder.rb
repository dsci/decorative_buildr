module DecorativeBuildr 
  # A building module which could be included in any 
  # class to concat multiple strings with a seperator/
  # line ending.
  #   
  #   @example
  #   class Sample
  #     include Util::Builder  
  #   end 
  #
  #   sample = Sample.new
  #   sample.build_info(:line_ending => "<br/>") do |builder|
  #     builder.add "One"
  #     builder.add "Two"
  #   end
  #
  #
  # The result should be something like this:
  #   
  #   @example
  #   One<br/>Two<br/>
  #
  # @author Daniel Schmidt
  module Builder
    
    def add(line, options={})
      @infos << rescue_nil_string(line,options) << @line_ending
    end
    
    # Concats multiple string with a line ending. It receives a block. 
    # @param [Hash] opt Optional configuration hash with :line_ending key, which is \n by default.
    # @return [String] The concated String 
    def build_info(opt={},&block)
      raise "Arguments in invalid form" unless opt.is_a?(Hash)
      @infos        = rescue_nil_string(@infos)
      @line_ending  = opt.fetch(:line_ending, "\n")
      @pre          = opt.fetch(:pre, "")
      @after        = opt.fetch(:after, "")
      block.call(self)
      @infos = "#{@pre}#{@line_ending}#{@infos}" unless @pre.empty?
      @infos = "#{@infos}#{@line_endings}#{@after}" unless @after.empty?
      return @infos
    end
    
    private
    
    def rescue_nil_string(string, options=nil)
      line = string.nil? ? "" : string
      unless options.nil?
        if options.has_key?(:tag)
          tag = options[:tag]
          line = string.nil? ? "<#{tag}></#{tag}" : "<#{tag}>#{string}</#{tag}>"
        end
      end
      return line
    end
    
  end
end