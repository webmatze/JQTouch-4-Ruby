require 'jqtouch'

JQTouch.app "webmazte.de" do
  
  page :index do
    toolbar "Index" do
      button :about, "about"
    end
    list do
      item "About", "", :about, :arrow
      item "Projects", 10, :projects, :arrow, :counter
    end
    list "Second List" do
      item "this has no function", "here can be"
      item "this either", "some text"
    end
  end
  
  page :about do
    toolbar "About" do
      button :back, "Back"
      button :projects, "Projects"
    end
    info "<h2>Here you can use HTML Tags</h2>"
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
      <h2>My Projects</h2>
      <p>This is a page where I will show you all my projects.</p>
      <p>Have fun!</p>
    "
  end
  
end