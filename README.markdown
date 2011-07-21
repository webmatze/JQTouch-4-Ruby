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
          item "Info", :info, :arrow
         end
      end
      page :about do
        toolbar "About" do
          button :back, "Back"
        end
      end
      page :info do
        toolbar "Info" do
          button :back, "Back"
        end
      end
    end

Then run this file and safe the output into an html file:

    $ ruby myfirstapp.rb > myfirstapp.htm
    
Now open the created html file in a browser or on your mobile phone.

Have fun :)

Copyright
---------

2011 by Mathias Karstädt