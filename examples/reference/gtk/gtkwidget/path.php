<?php
//Create our widgets
$wnd   = new GtkWindow();
$box   = new GtkVBox();
$frame = new GtkFrame('Frame');
$btn   = new GtkButton('Button');

//Pack them into each other
$wnd  ->add($box);
$box  ->add($frame);
$frame->add($btn);

//Give some a custom name
$wnd->set_name('My window');
$btn->set_name('demo button');

//And now echo the class path of the button,
// and the normal path
echo 'class_path: "' . $btn->class_path() . "\"\n";
echo 'path:       "' . $btn->path() . "\"\n";

/* Returns:
class_path: "GtkWindow.GtkVBox.GtkFrame.GtkButton"
path:       "My window.GtkVBox.GtkFrame.demo button"
*/
?>