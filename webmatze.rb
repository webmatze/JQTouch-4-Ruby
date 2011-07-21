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
    end
    content <<-html
        <p>here can be some HTML Content<p>
        <p>You can write <strong>multiple lines</strong> of code<p>
    html
    content "<h1>Or you can use this form</h1>"
  end
  
  page :projects do
    toolbar "Projects" do
      button :back, "Back"
    end
    content "
      <h1>My Projects</h1>
      <p>This is a page where I will show you all my projects.</p>
      <p>Have fun!</p>
    "
  end
  
end