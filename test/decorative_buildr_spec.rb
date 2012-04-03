require 'minitest/autorun'

require File.expand_path(File.join(File.dirname(__FILE__),'..','decorative_buildr.rb'))

$LOAD_PATH.unshift(File.dirname(__FILE__))

class TestBuildr
  include DecorativeBuildr::Builder

  def initialize
    @lines = ["one", "two"]
  end

  def without_hooks(opt={})
    if opt.has_key?(:line_ending)
      build_info(:line_ending => opt[:line_ending]) do |builder|
        @lines.each{|line| builder.add line}
      end
    else
      build_info do |builder|
        @lines.each{|line| builder.add line}
      end
    end
  end

  def info(hooks={})
    procs = []
    build_info(:pre => hooks[:pre], :after => hooks[:after]) do |builder|
      if hooks.has_key?(:tag)
        @lines.each{|line| builder.add line, :tag => hooks[:tag]}
      else
        @lines.each{|line| builder.add line}
      end
    end

  end

end

describe "DecorativeBuildr" do

  describe "with pre hooks" do

    describe "and with tag hooks" do

      subject{TestBuildr.new.info(:pre => "<ul>", :after => "</ul>", :tag => "li")}

      ["<ul>","</ul>","<li>","</li>"].each do |tag|
        it{subject.must_include tag}
      end

    end

    describe "and without tag hooks" do

      subject{TestBuildr.new.info(:pre => "<p>", :after=> "</p>")}

      ["<p>","</p>"].each do |tag|
        it{subject.must_include tag}
      end

      ["<ul>","</ul>","<li>","</li>"].each do |tag|
        it{subject.wont_include tag}
      end

    end

  end

  describe "without pre hooks" do

    subject{TestBuildr.new.without_hooks}

    it{subject.must_include "one\n"}
    it{subject.must_include "two\n"}

  end

  describe "with line_endings" do
    subject{TestBuildr.new.without_hooks(:line_ending => "<br/>")}

    it{subject.must_include "one<br/>"}
    it{subject.must_include "two<br/>"}

  end

end