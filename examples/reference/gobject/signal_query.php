<?php
var_dump(GObject::signal_query('delete-event', GtkWindow::gtype));
/* Returns:
array(6) {
  [0]=>
  int(31)
  [1]=>
  string(12) "delete-event"
  [2]=>
  object(GType)#1 (2) {
    ["type"]=>
    int(142760632)
    ["name"]=>
    string(9) "GtkWidget"
  }
  [3]=>
  int(2)
  [4]=>
  object(GType)#2 (2) {
    ["type"]=>
    int(20)
    ["name"]=>
    string(8) "gboolean"
  }
  [5]=>
  array(1) {
    [0]=>
    object(GType)#3 (2) {
      ["type"]=>
      int(148319049)
      ["name"]=>
      string(8) "GdkEvent"
    }
  }
}
*/
?>