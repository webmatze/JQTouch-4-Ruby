require 'jqtouch'

#and now our first test

JQTouch.app "webmazte.de" do
  
  page :index do
    toolbar "Index" do
      button :about, "about"
    end
    list do
      item "About", :about, :arrow
      item "Projects", :projects, :arrow
      item "test"
    end
  end
  
  page :about do
    toolbar "About" do
      button :back, "Back"
      button :projects, "Projects"
    end
    info "<h1>Here you can use HTML Tags</h1>"
    info <<-html
        Or just plain simple text over
        multiple lines
        to tell something about you
        or your app or whatever!
    html
  end
  
  page :projects do
    toolbar "Projects" do
      button :back, "Back"
    end
    info "
      <h1>My Projects</h1>
      <p>This is a page where I will show you all my projects.</p>
      <p>Have fun!</p>
    "
  end
  
end