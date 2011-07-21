jQTouch 4 Ruby
=====================

Introduction
------------

jQTouch for Ruby is a ruby DSL to easy create jQTouch mobile applications.

Requirements
------------

- gem install builder
- jQuery Library
- jQTouch Javascript Library

Example
-------

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

Copyright
---------

2011 by Mathias Karstädt