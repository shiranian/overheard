#Overheard


Podcast prototype app for some friends.

Choose your current mood and Overheard will recommend users new podcast based on their individual feedback from previous podcasts.

Interesting way to think about persisting data and trying to act as if a mobile application

Adding Styling:

All html files are located under app/views/ you will see a few directories under /views /Devise/ contains all of the views that have to do with user sign in, registration, etc You only care about two of these: Devise/registrations/new.html.erb is for registering for the app Devise/sessions/new.html.erb is the sign in page

/layouts/application.html.erb Anything in this file will show up on any html file across the project, where it says yield is where the other files get yielded into and rendered, For example you could put a footer or nav bar in this file either below or above the yield and it will show up on every single page of the app

moods/new.html.erb is the page for choosing which type of podcast user wants to listen to

All of the podcast views are under /podcasts

Stylesheets you can find the main stylesheet to use under app/assets/stylesheets/application.css.scss

Images images can be found under app/assets/images
images can be referenced their name as long as they are stored here for example: images/name.png can be rendered with: image_tag("person.png")
