jQTouch 4 Ruby
=====================

Introduction
------------

jQTouch for Ruby is a ruby DSL to easy create jQTouch mobile applications.

Requirements
------------

- gem install builder (http://rubygems.org/gems/builder)
- jQuery Library (http://jquery.com/)
- jQTouch Javascript Library (http://jqtouch.com/)

Example
-------

Create a ruby file 'myfirstapp.rb' and add the following code:

    require 'jqtouch'

    JQTouch.app "My first App" do
      page :index do
        toolbar "Index" do
          button :about, "about"
        end
        list do
          item "Info", "more info", :info, :arrow
          item "About", "this site", :about, :arrow
        end
      end
      page :about do
        toolbar "About" do
          button :back, "Back"
        end
        info "
          <h1>About this app</h1>
          <p>Here you can write your own HTML content</p>
        "
      end
      page :info do
        toolbar "Info" do
          button :back, "Back"
        end
        info "
          <h1>Info Page</h1>
          <p>Write something about you!</p>
        "
      end
    end

Then run this file and safe the output into an html file:

    $ ruby myfirstapp.rb > myfirstapp.htm
    
Now open the created html file in a browser or on your mobile phone.

Have fun :)

Copyright
---------

2011 by Mathias Karstädt