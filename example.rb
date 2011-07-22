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
