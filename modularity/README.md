# modularity

Each Fully realised component must be in a pkg, with a cmd to load it isolated for test harness.

## Widget gallery

https://github.com/emilk/egui has a good example

Use the GIO Component widget, and then load up each demo by importing each main.go without the main . Hence the gio examples must be changed to have a cmd to run isolated and a pkg to be called from the component.
Now we have modularity !!


dark-theme: 
![alt text](https://raw.githubusercontent.com/emilk/egui/master/media/widget_gallery.gif "Logo Title Text 1")


light-theme: 
![alt text](https://raw.githubusercontent.com/emilk/egui/master/media/light_theme.png "Logo Title Text 1")





