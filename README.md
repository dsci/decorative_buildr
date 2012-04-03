# DecorativeBuildr

[![Build Status](https://secure.travis-ci.org/dsci/decorative_buildr.png)](http://travis-ci.org/dsci/decorative_buildr)

## Buildr

A building module which could be included in any  class to concat multiple strings with a seperator/line ending.
   
```ruby
class Sample
  include DecorativeBuildr::Builder  
end 

sample = Sample.new
sample.build_info(:line_ending => "<br/>") do |builder|
  builder.add "One"
  builder.add "Two"
end
```

The result should be something like this:
   
```html
One<br/>Two<br/>
```

## Is this useful?

Of course. For little things. ... Of course.
