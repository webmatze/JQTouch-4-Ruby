require 'rubygems'
require 'builder'

module JQTouch
  def self.app(name = 'MyApp', &block)
    application = App.new(name)
    application.instance_eval(&block) if block
    puts application.to_s
  end
  
  class App
    attr_accessor :name, :pages
    
    def initialize(name)
      @name = name.to_s
      @pages = []
    end
    
    def page(name = 'Page', &block)
      new_page = Page.new(name)
      new_page.instance_eval(&block) if block
      @pages << new_page
      return new_page
    end
    
    def to_s
      b = Builder::XmlMarkup.new(:indent => 2)
      html = b.html {
        b.head {
          b.title @name
          b.link({:type => "text/css", :rel => "stylesheet", :media => "screen", :href => "jqtouch/jqtouch.css"})
          b.link({:type => "text/css", :rel => "stylesheet", :media => "screen", :href => "themes/apple/theme.css"})
          b.script({:type => "text/javascript", :src => "jqtouch/jquery-1.4.2.min.js"},"")
          b.script({:type => "text/javascript", :src => "jqtouch/jqtouch.js"},"")
          b.script({:type => "text/javascript"},"
      var jQT = $.jQTouch({
          icon: 'app.png',
          statusBar: 'black'
      });
    ")
        }
        b.body {
          @pages.each do |page|
            page.build(b)
          end
        }
      }
      html
    end
  end
  
  class Page
    attr_accessor :name, :toolbar, :contents
    
    def initialize(name)
      @name = name.to_s
      @contents = []
    end
    
    def toolbar(name = 'Toolbar', &block)
      @toolbar = Toolbar.new(name)
      @toolbar.instance_eval(&block) if block
      return @toolbar
    end
    
    def list(title = nil, css_class = :rounded, &block)
      @contents << List.new(title, css_class)
      @contents.last.instance_eval(&block) if block
      return @contents.last
    end
    
    def info(text)
      @contents << text
    end
    
    def build(b)
      b.div({:id => @name.to_s}) { 
        @toolbar.build(b) if @toolbar
        @contents.each do |c|
          if c.respond_to? 'build'
            c.build(b)
          else
            b.div({:class => "info"}) { |i|
              i << c
            }
          end
        end
      }
    end
  end
  
  class Toolbar
    attr_accessor :name, :buttons
    
    def initialize(name)
      @name = name
      @buttons = []
    end
    
    def button(target = :back, name = 'Back')
      @buttons << Button.new(target, name)
    end
    
    def build(b)
      b.div({:class => "toolbar"}) {
        b.h1(@name.to_s)
        @buttons.each do |button|
          button.build(b)
        end
      }
    end
  end
  
  class Button
    attr_accessor :target, :name
    
    def initialize(target, name)
      @target = target.to_s
      @name = name.to_s
    end
    
    def build(b)
      css_classes = "button"
      css_classes << " back" if @target.to_s == "back"
      href = "#"
      href << @target if @target.to_s != "back"
      b.a({:class => css_classes, :href => href}, @name.to_s)
    end
  end
  
  class List
    attr_accessor :css_class, :items, :title
    
    def initialize(title, css_class)
      @css_class = css_class
      @title = title
      @items = []
    end
    
    def item(name = "", small = nil, target = nil, item_class = "", small_class = "")
      item = Item.new(name, small, target, item_class, small_class)
      @items << item
    end
    
    def build(b)
      b.h2(@title.to_s) if @title
      b.ul({:class => @css_class.to_s}) {
        @items.each do |item|
          item.build(b)
        end
      }
    end
  end
  
  class Item
    attr_accessor :item_class, :small_class, :name, :small, :target
    
    def initialize(name, small, target, item_class, small_class)
      @name = name
      @small = small
      @target = target
      @item_class = item_class
      @small_class = small_class
    end
    
    def build(b)
      b.li({:class => @item_class}) {
        if @target
          b.a({:href => "##{@target.to_s}"}) {
            b << @name.to_s
            b.small({:class => @small_class}, @small.to_s) if @small && @small != ""          
          }
        else
          b << @name.to_s
          b.small({:class => @small_class}, @small.to_s) if @small && @small != ""          
        end
      }
    end
  end
  
end