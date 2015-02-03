#Overheard
Podcast prototype app for some friends.  

Choose your current mood and Overheard will recommend users new podcast based on their individual feedback from previous podcasts.

Interesting way to think about persisting data and trying to act as if a mobile application

Adding Styling:

The application is built in Ruby.  The html files all are "html.erb".  Don't worry about this, it just means that the files contain embedded ruby, which is how we dynamically generate html with Ruby.  You might see methods like "link_to("foo", bar_path, class: 'baz').  This renders an anchor tag like so <a href="bar_path" class="baz">foo</a>
If you want feel free to just edit the ruby methods like so, but if this is sort of confusing then you can just create the pages with html and I will go back and convert it to Ruby syntax when you're done.  I will still be able to use all of the same classes and Id's for styling so it won't be *too much work for me. 


Here's a breakdown of each of the files you need to edit:

Anything you want to be present across the whole app (footer, header, nav bar, etc)
puts in app/views/layouts/application.html.erb

you'll see a "yield", that is where every page get loaded into so anything above or below it will be surrounding it.

Sign in page:
app/views/devise/sessins/new.html.erb

Sign up page:
app/views/devie/registrations/new.html.erb

main podcast page where podcasts play from:
app/views/podcasts/show.html.erb

page to add new podcasts:
app/views/podcasts/new.html.erb

firt page app takes you too once user logs in:
app/views/moods/new.html.erb


IMAGES:

put all images under app/assets/image/
that way you can reference them just by their file name and it will automatically look at that path.


Stylesheets
  you can find the main stylesheet to use under app/assets/stylesheets/application.css.scss
 

Important methods:

link_to("text of link", "http://url.com", class: "puts classes in these quotes", id: "put id in here")
returns <a href="http://url.com" class="adsfasfsadf" id="asdfasfads">text of link </a>

image_tag("icon.png", size: "16x10", alt: "Edit Entry")   the second two argument (size, alt) are both optional you could also just do:
image_tag("icon.png")

this will look for the file under app/assets/images/


http://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html
here's link to the form documentation
# => <img src="/assets/icon.png" width="16" height="10" alt="Edit Entry" />
