<?php

function responseCallback($dialog, $response)
{
	switch ($response)
	{
		case Gtk::RESPONSE_OK:
			echo "You chose file path ", $dialog->get_filename();
			break;
		case Gtk::RESPONSE_CANCEL:
			echo "You selected cancel";
	}
	$dialog->destroy();
}

$dialog = new GtkFileChooserDialog(
	'Pick a file...',                # Dialog title
	NULL,	                           # Parent
	Gtk::FILE_CHOOSER_ACTION_OPEN,   # File chooser action (open a file)
	array (                          # Button title, button response, ...
		'Open', Gtk::RESPONSE_OK,
		'Cancel', Gtk::RESPONSE_CANCEL
	)
);
$dialog->connect('response', 'responseCallback');
$response = $dialog->run();