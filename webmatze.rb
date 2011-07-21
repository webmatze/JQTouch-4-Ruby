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
  end
  page :projects do
    toolbar "Projects" do
      button :back, "Back"
    end
  end
end