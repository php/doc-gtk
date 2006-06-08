<?php
$window = new GtkWindow;
$window->set_default_size(120,120);

$vbox = new GtkVBox;

// new Button
$button = new GtkButton;
$button->set_label('Icon Test');
$p = GdkPixbuf::new_from_file('images/publica.png');
$a = new GtkImage;
$a->set_from_pixbuf($p);
$button->set_image($a);
$vbox->pack_start($button, false, false);

$window->add($vbox);
$window->show_all();
Gtk::main();
?>
