
  <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:doc="http://nwlash.com/xsl/documentation/1.0"
                version="1.0">



  <xsl:template name="get_id_from_name">

  <xsl:param name="classname" />

  <xsl:choose>

 <xsl:when test="$classname='GtkAccelGroup'">
<xsl:text>gtk.gtkaccelgroup</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkAccelLabel'">
<xsl:text>gtk.gtkaccellabel</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkAdjustment'">
<xsl:text>gtk.gtkadjustment</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkAlignment'">
<xsl:text>gtk.gtkalignment</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkArrow'">
<xsl:text>gtk.gtkarrow</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkAspectFrame'">
<xsl:text>gtk.gtkaspectframe</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkBin'">
<xsl:text>gtk.gtkbin</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkBox'">
<xsl:text>gtk.gtkbox</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkBoxChild'">
<xsl:text>gtk.gtkboxchild</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkButton'">
<xsl:text>gtk.gtkbutton</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkButtonBox'">
<xsl:text>gtk.gtkbuttonbox</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkCalendar'">
<xsl:text>gtk.gtkcalendar</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkCheckButton'">
<xsl:text>gtk.gtkcheckbutton</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkCheckMenuItem'">
<xsl:text>gtk.gtkcheckmenuitem</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkCList'">
<xsl:text>gtk.gtkclist</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkCListRow'">
<xsl:text>gtk.gtkclistrow</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkColorSelection'">
<xsl:text>gtk.gtkcolorselection</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkColorSelectionDialog'">
<xsl:text>gtk.gtkcolorselectiondialog</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkCombo'">
<xsl:text>gtk.gtkcombo</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkContainer'">
<xsl:text>gtk.gtkcontainer</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkCTree'">
<xsl:text>gtk.gtkctree</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkCTreeNode'">
<xsl:text>gtk.gtkctreenode</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkCurve'">
<xsl:text>gtk.gtkcurve</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkData'">
<xsl:text>gtk.gtkdata</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkDialog'">
<xsl:text>gtk.gtkdialog</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkDrawingArea'">
<xsl:text>gtk.gtkdrawingarea</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkEditable'">
<xsl:text>gtk.gtkeditable</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkEntry'">
<xsl:text>gtk.gtkentry</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkEventBox'">
<xsl:text>gtk.gtkeventbox</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkFileSelection'">
<xsl:text>gtk.gtkfileselection</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkFixed'">
<xsl:text>gtk.gtkfixed</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkFixedChild'">
<xsl:text>gtk.gtkfixedchild</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkFontSelection'">
<xsl:text>gtk.gtkfontselection</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkFontSelectionDialog'">
<xsl:text>gtk.gtkfontselectiondialog</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkFrame'">
<xsl:text>gtk.gtkframe</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkGammaCurve'">
<xsl:text>gtk.gtkgammacurve</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkHandleBox'">
<xsl:text>gtk.gtkhandlebox</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkHBox'">
<xsl:text>gtk.gtkhbox</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkHButtonBox'">
<xsl:text>gtk.gtkhbuttonbox</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkHPaned'">
<xsl:text>gtk.gtkhpaned</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkHRuler'">
<xsl:text>gtk.gtkhruler</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkHScale'">
<xsl:text>gtk.gtkhscale</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkHScrollbar'">
<xsl:text>gtk.gtkhscrollbar</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkHSeparator'">
<xsl:text>gtk.gtkhseparator</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkImage'">
<xsl:text>gtk.gtkimage</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkInputDialog'">
<xsl:text>gtk.gtkinputdialog</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkInvisible'">
<xsl:text>gtk.gtkinvisible</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkItem'">
<xsl:text>gtk.gtkitem</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkItemFactory'">
<xsl:text>gtk.gtkitemfactory</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkLabel'">
<xsl:text>gtk.gtklabel</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkLayout'">
<xsl:text>gtk.gtklayout</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkList'">
<xsl:text>gtk.gtklist</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkListItem'">
<xsl:text>gtk.gtklistitem</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkMenu'">
<xsl:text>gtk.gtkmenu</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkMenuBar'">
<xsl:text>gtk.gtkmenubar</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkMenuItem'">
<xsl:text>gtk.gtkmenuitem</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkMenuShell'">
<xsl:text>gtk.gtkmenushell</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkMisc'">
<xsl:text>gtk.gtkmisc</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkNotebook'">
<xsl:text>gtk.gtknotebook</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkObject'">
<xsl:text>gtk.gtkobject</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkOptionMenu'">
<xsl:text>gtk.gtkoptionmenu</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkPacker'">
<xsl:text>gtk.gtkpacker</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkPaned'">
<xsl:text>gtk.gtkpaned</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkPixmap'">
<xsl:text>gtk.gtkpixmap</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkPlug'">
<xsl:text>gtk.gtkplug</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkPreview'">
<xsl:text>gtk.gtkpreview</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkProgress'">
<xsl:text>gtk.gtkprogress</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkProgressBar'">
<xsl:text>gtk.gtkprogressbar</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkRadioButton'">
<xsl:text>gtk.gtkradiobutton</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkRadioMenuItem'">
<xsl:text>gtk.gtkradiomenuitem</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkRange'">
<xsl:text>gtk.gtkrange</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkRuler'">
<xsl:text>gtk.gtkruler</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkScale'">
<xsl:text>gtk.gtkscale</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkScrollbar'">
<xsl:text>gtk.gtkscrollbar</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkScrolledWindow'">
<xsl:text>gtk.gtkscrolledwindow</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkSelectionData'">
<xsl:text>gtk.gtkselectiondata</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkSeparator'">
<xsl:text>gtk.gtkseparator</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkSocket'">
<xsl:text>gtk.gtksocket</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkSpinButton'">
<xsl:text>gtk.gtkspinbutton</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkStatusbar'">
<xsl:text>gtk.gtkstatusbar</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkStyle'">
<xsl:text>gtk.gtkstyle</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkTable'">
<xsl:text>gtk.gtktable</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkTableChild'">
<xsl:text>gtk.gtktablechild</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkTearoffMenuItem'">
<xsl:text>gtk.gtktearoffmenuitem</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkText'">
<xsl:text>gtk.gtktext</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkTipsQuery'">
<xsl:text>gtk.gtktipsquery</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkToggleButton'">
<xsl:text>gtk.gtktogglebutton</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkToolbar'">
<xsl:text>gtk.gtktoolbar</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkTooltips'">
<xsl:text>gtk.gtktooltips</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkTree'">
<xsl:text>gtk.gtktree</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkTreeItem'">
<xsl:text>gtk.gtktreeitem</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkVBox'">
<xsl:text>gtk.gtkvbox</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkVButtonBox'">
<xsl:text>gtk.gtkvbuttonbox</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkViewport'">
<xsl:text>gtk.gtkviewport</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkVPaned'">
<xsl:text>gtk.gtkvpaned</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkVRuler'">
<xsl:text>gtk.gtkvruler</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkVScale'">
<xsl:text>gtk.gtkvscale</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkVScrollbar'">
<xsl:text>gtk.gtkvscrollbar</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkVSeparator'">
<xsl:text>gtk.gtkvseparator</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkWidget'">
<xsl:text>gtk.gtkwidget</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkWindow'">
<xsl:text>gtk.gtkwindow</xsl:text>
</xsl:when>
<xsl:when test="$classname='GdkAtom'">
<xsl:text>gdk.gdkatom</xsl:text>
</xsl:when>
<xsl:when test="$classname='GdkBitmap'">
<xsl:text>gdk.gdkbitmap</xsl:text>
</xsl:when>
<xsl:when test="$classname='GdkColor'">
<xsl:text>gdk.gdkcolor</xsl:text>
</xsl:when>
<xsl:when test="$classname='GdkColormap'">
<xsl:text>gdk.gdkcolormap</xsl:text>
</xsl:when>
<xsl:when test="$classname='GdkCursor'">
<xsl:text>gdk.gdkcursor</xsl:text>
</xsl:when>
<xsl:when test="$classname='GdkDragContext'">
<xsl:text>gdk.gdkdragcontext</xsl:text>
</xsl:when>
<xsl:when test="$classname='GdkEvent'">
<xsl:text>gdk.gdkevent</xsl:text>
</xsl:when>
<xsl:when test="$classname='GdkFont'">
<xsl:text>gdk.gdkfont</xsl:text>
</xsl:when>
<xsl:when test="$classname='GdkGC'">
<xsl:text>gdk.gdkgc</xsl:text>
</xsl:when>
<xsl:when test="$classname='GdkPixmap'">
<xsl:text>gdk.gdkpixmap</xsl:text>
</xsl:when>
<xsl:when test="$classname='GdkVisual'">
<xsl:text>gdk.gdkvisual</xsl:text>
</xsl:when>
<xsl:when test="$classname='GdkWindow'">
<xsl:text>gdk.gdkwindow</xsl:text>
</xsl:when>
<xsl:when test="$classname='GladeXML'">
<xsl:text>glade.gladexml</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkSQPane'">
<xsl:text>sqp.gtksqpane</xsl:text>
</xsl:when>


  <xsl:otherwise>

   <xsl:text>no</xsl:text>

  </xsl:otherwise>

  </xsl:choose>

  </xsl:template>

 
  <xsl:template name="get_func_id_from_name">

  <xsl:param name="funcname" />

  <xsl:param name="class" select="'no'" />

  <xsl:choose>

 <xsl:when test="($funcname='GtkAccelGroup' and $class='no') or ($funcname='GtkAccelGroup' and $class='GtkAccelGroup')">
<xsl:text>gtk.gtkaccelgroup.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='lock' and $class='no') or ($funcname='lock' and $class='GtkAccelGroup')">
<xsl:text>gtk.gtkaccelgroup.method.lock</xsl:text>
</xsl:when>
<xsl:when test="($funcname='unlock' and $class='no') or ($funcname='unlock' and $class='GtkAccelGroup')">
<xsl:text>gtk.gtkaccelgroup.method.unlock</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkAccelLabel' and $class='no') or ($funcname='GtkAccelLabel' and $class='GtkAccelLabel')">
<xsl:text>gtk.gtkaccellabel.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_accel_width' and $class='no') or ($funcname='get_accel_width' and $class='GtkAccelLabel')">
<xsl:text>gtk.gtkaccellabel.method.get_accel_width</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_accel_widget' and $class='no') or ($funcname='set_accel_widget' and $class='GtkAccelLabel')">
<xsl:text>gtk.gtkaccellabel.method.set_accel_widget</xsl:text>
</xsl:when>
<xsl:when test="($funcname='refetch' and $class='no') or ($funcname='refetch' and $class='GtkAccelLabel')">
<xsl:text>gtk.gtkaccellabel.method.refetch</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkAdjustment' and $class='no') or ($funcname='GtkAdjustment' and $class='GtkAdjustment')">
<xsl:text>gtk.gtkadjustment.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='changed' and $class='no') or ($funcname='changed' and $class='GtkAdjustment')">
<xsl:text>gtk.gtkadjustment.method.changed</xsl:text>
</xsl:when>
<xsl:when test="($funcname='value_changed' and $class='no') or ($funcname='value_changed' and $class='GtkAdjustment')">
<xsl:text>gtk.gtkadjustment.method.value_changed</xsl:text>
</xsl:when>
<xsl:when test="($funcname='clamp_page' and $class='no') or ($funcname='clamp_page' and $class='GtkAdjustment')">
<xsl:text>gtk.gtkadjustment.method.clamp_page</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_value' and $class='no') or ($funcname='set_value' and $class='GtkAdjustment')">
<xsl:text>gtk.gtkadjustment.method.set_value</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkAlignment' and $class='no') or ($funcname='GtkAlignment' and $class='GtkAlignment')">
<xsl:text>gtk.gtkalignment.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set' and $class='no') or ($funcname='set' and $class='GtkAlignment')">
<xsl:text>gtk.gtkalignment.method.set</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkArrow' and $class='no') or ($funcname='GtkArrow' and $class='GtkArrow')">
<xsl:text>gtk.gtkarrow.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set' and $class='no') or ($funcname='set' and $class='GtkArrow')">
<xsl:text>gtk.gtkarrow.method.set</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkAspectFrame' and $class='no') or ($funcname='GtkAspectFrame' and $class='GtkAspectFrame')">
<xsl:text>gtk.gtkaspectframe.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set' and $class='no') or ($funcname='set' and $class='GtkAspectFrame')">
<xsl:text>gtk.gtkaspectframe.method.set</xsl:text>
</xsl:when>
<xsl:when test="($funcname='pack_start' and $class='no') or ($funcname='pack_start' and $class='GtkBox')">
<xsl:text>gtk.gtkbox.method.pack_start</xsl:text>
</xsl:when>
<xsl:when test="($funcname='pack_end' and $class='no') or ($funcname='pack_end' and $class='GtkBox')">
<xsl:text>gtk.gtkbox.method.pack_end</xsl:text>
</xsl:when>
<xsl:when test="($funcname='pack_start_defaults' and $class='no') or ($funcname='pack_start_defaults' and $class='GtkBox')">
<xsl:text>gtk.gtkbox.method.pack_start_defaults</xsl:text>
</xsl:when>
<xsl:when test="($funcname='pack_end_defaults' and $class='no') or ($funcname='pack_end_defaults' and $class='GtkBox')">
<xsl:text>gtk.gtkbox.method.pack_end_defaults</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_homogeneous' and $class='no') or ($funcname='set_homogeneous' and $class='GtkBox')">
<xsl:text>gtk.gtkbox.method.set_homogeneous</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_spacing' and $class='no') or ($funcname='set_spacing' and $class='GtkBox')">
<xsl:text>gtk.gtkbox.method.set_spacing</xsl:text>
</xsl:when>
<xsl:when test="($funcname='reorder_child' and $class='no') or ($funcname='reorder_child' and $class='GtkBox')">
<xsl:text>gtk.gtkbox.method.reorder_child</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_child_packing' and $class='no') or ($funcname='set_child_packing' and $class='GtkBox')">
<xsl:text>gtk.gtkbox.method.set_child_packing</xsl:text>
</xsl:when>
<xsl:when test="($funcname='query_child_packing' and $class='no') or ($funcname='query_child_packing' and $class='GtkBox')">
<xsl:text>gtk.gtkbox.method.query_child_packing</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkButton' and $class='no') or ($funcname='GtkButton' and $class='GtkButton')">
<xsl:text>gtk.gtkbutton.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='pressed' and $class='no') or ($funcname='pressed' and $class='GtkButton')">
<xsl:text>gtk.gtkbutton.method.pressed</xsl:text>
</xsl:when>
<xsl:when test="($funcname='released' and $class='no') or ($funcname='released' and $class='GtkButton')">
<xsl:text>gtk.gtkbutton.method.released</xsl:text>
</xsl:when>
<xsl:when test="($funcname='clicked' and $class='no') or ($funcname='clicked' and $class='GtkButton')">
<xsl:text>gtk.gtkbutton.method.clicked</xsl:text>
</xsl:when>
<xsl:when test="($funcname='enter' and $class='no') or ($funcname='enter' and $class='GtkButton')">
<xsl:text>gtk.gtkbutton.method.enter</xsl:text>
</xsl:when>
<xsl:when test="($funcname='leave' and $class='no') or ($funcname='leave' and $class='GtkButton')">
<xsl:text>gtk.gtkbutton.method.leave</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_relief' and $class='no') or ($funcname='set_relief' and $class='GtkButton')">
<xsl:text>gtk.gtkbutton.method.set_relief</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_relief' and $class='no') or ($funcname='get_relief' and $class='GtkButton')">
<xsl:text>gtk.gtkbutton.method.get_relief</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_spacing' and $class='no') or ($funcname='get_spacing' and $class='GtkButtonBox')">
<xsl:text>gtk.gtkbuttonbox.method.get_spacing</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_layout' and $class='no') or ($funcname='get_layout' and $class='GtkButtonBox')">
<xsl:text>gtk.gtkbuttonbox.method.get_layout</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_spacing' and $class='no') or ($funcname='set_spacing' and $class='GtkButtonBox')">
<xsl:text>gtk.gtkbuttonbox.method.set_spacing</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_layout' and $class='no') or ($funcname='set_layout' and $class='GtkButtonBox')">
<xsl:text>gtk.gtkbuttonbox.method.set_layout</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_child_size' and $class='no') or ($funcname='set_child_size' and $class='GtkButtonBox')">
<xsl:text>gtk.gtkbuttonbox.method.set_child_size</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_child_ipadding' and $class='no') or ($funcname='set_child_ipadding' and $class='GtkButtonBox')">
<xsl:text>gtk.gtkbuttonbox.method.set_child_ipadding</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkCalendar' and $class='no') or ($funcname='GtkCalendar' and $class='GtkCalendar')">
<xsl:text>gtk.gtkcalendar.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='select_month' and $class='no') or ($funcname='select_month' and $class='GtkCalendar')">
<xsl:text>gtk.gtkcalendar.method.select_month</xsl:text>
</xsl:when>
<xsl:when test="($funcname='select_day' and $class='no') or ($funcname='select_day' and $class='GtkCalendar')">
<xsl:text>gtk.gtkcalendar.method.select_day</xsl:text>
</xsl:when>
<xsl:when test="($funcname='mark_day' and $class='no') or ($funcname='mark_day' and $class='GtkCalendar')">
<xsl:text>gtk.gtkcalendar.method.mark_day</xsl:text>
</xsl:when>
<xsl:when test="($funcname='unmark_day' and $class='no') or ($funcname='unmark_day' and $class='GtkCalendar')">
<xsl:text>gtk.gtkcalendar.method.unmark_day</xsl:text>
</xsl:when>
<xsl:when test="($funcname='clear_marks' and $class='no') or ($funcname='clear_marks' and $class='GtkCalendar')">
<xsl:text>gtk.gtkcalendar.method.clear_marks</xsl:text>
</xsl:when>
<xsl:when test="($funcname='display_options' and $class='no') or ($funcname='display_options' and $class='GtkCalendar')">
<xsl:text>gtk.gtkcalendar.method.display_options</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_date' and $class='no') or ($funcname='get_date' and $class='GtkCalendar')">
<xsl:text>gtk.gtkcalendar.method.get_date</xsl:text>
</xsl:when>
<xsl:when test="($funcname='freeze' and $class='no') or ($funcname='freeze' and $class='GtkCalendar')">
<xsl:text>gtk.gtkcalendar.method.freeze</xsl:text>
</xsl:when>
<xsl:when test="($funcname='thaw' and $class='no') or ($funcname='thaw' and $class='GtkCalendar')">
<xsl:text>gtk.gtkcalendar.method.thaw</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkCheckButton' and $class='no') or ($funcname='GtkCheckButton' and $class='GtkCheckButton')">
<xsl:text>gtk.gtkcheckbutton.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkCheckMenuItem' and $class='no') or ($funcname='GtkCheckMenuItem' and $class='GtkCheckMenuItem')">
<xsl:text>gtk.gtkcheckmenuitem.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_active' and $class='no') or ($funcname='set_active' and $class='GtkCheckMenuItem')">
<xsl:text>gtk.gtkcheckmenuitem.method.set_active</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_show_toggle' and $class='no') or ($funcname='set_show_toggle' and $class='GtkCheckMenuItem')">
<xsl:text>gtk.gtkcheckmenuitem.method.set_show_toggle</xsl:text>
</xsl:when>
<xsl:when test="($funcname='toggled' and $class='no') or ($funcname='toggled' and $class='GtkCheckMenuItem')">
<xsl:text>gtk.gtkcheckmenuitem.method.toggled</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkCList' and $class='no') or ($funcname='GtkCList' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_hadjustment' and $class='no') or ($funcname='set_hadjustment' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.set_hadjustment</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_vadjustment' and $class='no') or ($funcname='set_vadjustment' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.set_vadjustment</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_hadjustment' and $class='no') or ($funcname='get_hadjustment' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.get_hadjustment</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_vadjustment' and $class='no') or ($funcname='get_vadjustment' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.get_vadjustment</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_shadow_type' and $class='no') or ($funcname='set_shadow_type' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.set_shadow_type</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_selection_mode' and $class='no') or ($funcname='set_selection_mode' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.set_selection_mode</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_reorderable' and $class='no') or ($funcname='set_reorderable' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.set_reorderable</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_use_drag_icons' and $class='no') or ($funcname='set_use_drag_icons' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.set_use_drag_icons</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_button_actions' and $class='no') or ($funcname='set_button_actions' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.set_button_actions</xsl:text>
</xsl:when>
<xsl:when test="($funcname='freeze' and $class='no') or ($funcname='freeze' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.freeze</xsl:text>
</xsl:when>
<xsl:when test="($funcname='thaw' and $class='no') or ($funcname='thaw' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.thaw</xsl:text>
</xsl:when>
<xsl:when test="($funcname='column_titles_show' and $class='no') or ($funcname='column_titles_show' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.column_titles_show</xsl:text>
</xsl:when>
<xsl:when test="($funcname='column_titles_hide' and $class='no') or ($funcname='column_titles_hide' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.column_titles_hide</xsl:text>
</xsl:when>
<xsl:when test="($funcname='column_title_active' and $class='no') or ($funcname='column_title_active' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.column_title_active</xsl:text>
</xsl:when>
<xsl:when test="($funcname='column_title_passive' and $class='no') or ($funcname='column_title_passive' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.column_title_passive</xsl:text>
</xsl:when>
<xsl:when test="($funcname='column_titles_active' and $class='no') or ($funcname='column_titles_active' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.column_titles_active</xsl:text>
</xsl:when>
<xsl:when test="($funcname='column_titles_passive' and $class='no') or ($funcname='column_titles_passive' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.column_titles_passive</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_column_title' and $class='no') or ($funcname='set_column_title' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.set_column_title</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_column_title' and $class='no') or ($funcname='get_column_title' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.get_column_title</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_column_widget' and $class='no') or ($funcname='set_column_widget' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.set_column_widget</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_column_widget' and $class='no') or ($funcname='get_column_widget' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.get_column_widget</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_column_justification' and $class='no') or ($funcname='set_column_justification' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.set_column_justification</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_column_visibility' and $class='no') or ($funcname='set_column_visibility' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.set_column_visibility</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_column_resizeable' and $class='no') or ($funcname='set_column_resizeable' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.set_column_resizeable</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_column_auto_resize' and $class='no') or ($funcname='set_column_auto_resize' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.set_column_auto_resize</xsl:text>
</xsl:when>
<xsl:when test="($funcname='columns_autosize' and $class='no') or ($funcname='columns_autosize' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.columns_autosize</xsl:text>
</xsl:when>
<xsl:when test="($funcname='optimal_column_width' and $class='no') or ($funcname='optimal_column_width' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.optimal_column_width</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_column_width' and $class='no') or ($funcname='set_column_width' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.set_column_width</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_column_min_width' and $class='no') or ($funcname='set_column_min_width' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.set_column_min_width</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_column_max_width' and $class='no') or ($funcname='set_column_max_width' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.set_column_max_width</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_row_height' and $class='no') or ($funcname='set_row_height' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.set_row_height</xsl:text>
</xsl:when>
<xsl:when test="($funcname='moveto' and $class='no') or ($funcname='moveto' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.moveto</xsl:text>
</xsl:when>
<xsl:when test="($funcname='row_is_visible' and $class='no') or ($funcname='row_is_visible' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.row_is_visible</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_cell_type' and $class='no') or ($funcname='get_cell_type' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.get_cell_type</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_text' and $class='no') or ($funcname='set_text' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.set_text</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_text' and $class='no') or ($funcname='get_text' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.get_text</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_pixmap' and $class='no') or ($funcname='set_pixmap' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.set_pixmap</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_pixtext' and $class='no') or ($funcname='set_pixtext' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.set_pixtext</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_foreground' and $class='no') or ($funcname='set_foreground' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.set_foreground</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_background' and $class='no') or ($funcname='set_background' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.set_background</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_cell_style' and $class='no') or ($funcname='set_cell_style' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.set_cell_style</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_cell_style' and $class='no') or ($funcname='get_cell_style' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.get_cell_style</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_row_style' and $class='no') or ($funcname='set_row_style' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.set_row_style</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_row_style' and $class='no') or ($funcname='get_row_style' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.get_row_style</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_shift' and $class='no') or ($funcname='set_shift' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.set_shift</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_selectable' and $class='no') or ($funcname='set_selectable' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.set_selectable</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_selectable' and $class='no') or ($funcname='get_selectable' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.get_selectable</xsl:text>
</xsl:when>
<xsl:when test="($funcname='prepend' and $class='no') or ($funcname='prepend' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.prepend</xsl:text>
</xsl:when>
<xsl:when test="($funcname='append' and $class='no') or ($funcname='append' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.append</xsl:text>
</xsl:when>
<xsl:when test="($funcname='insert' and $class='no') or ($funcname='insert' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.insert</xsl:text>
</xsl:when>
<xsl:when test="($funcname='remove' and $class='no') or ($funcname='remove' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.remove</xsl:text>
</xsl:when>
<xsl:when test="($funcname='select_row' and $class='no') or ($funcname='select_row' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.select_row</xsl:text>
</xsl:when>
<xsl:when test="($funcname='unselect_row' and $class='no') or ($funcname='unselect_row' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.unselect_row</xsl:text>
</xsl:when>
<xsl:when test="($funcname='undo_selection' and $class='no') or ($funcname='undo_selection' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.undo_selection</xsl:text>
</xsl:when>
<xsl:when test="($funcname='clear' and $class='no') or ($funcname='clear' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.clear</xsl:text>
</xsl:when>
<xsl:when test="($funcname='select_all' and $class='no') or ($funcname='select_all' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.select_all</xsl:text>
</xsl:when>
<xsl:when test="($funcname='unselect_all' and $class='no') or ($funcname='unselect_all' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.unselect_all</xsl:text>
</xsl:when>
<xsl:when test="($funcname='swap_rows' and $class='no') or ($funcname='swap_rows' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.swap_rows</xsl:text>
</xsl:when>
<xsl:when test="($funcname='row_move' and $class='no') or ($funcname='row_move' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.row_move</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_sort_column' and $class='no') or ($funcname='set_sort_column' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.set_sort_column</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_sort_type' and $class='no') or ($funcname='set_sort_type' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.set_sort_type</xsl:text>
</xsl:when>
<xsl:when test="($funcname='sort' and $class='no') or ($funcname='sort' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.sort</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_auto_sort' and $class='no') or ($funcname='set_auto_sort' and $class='GtkCList')">
<xsl:text>gtk.gtkclist.method.set_auto_sort</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkColorSelection' and $class='no') or ($funcname='GtkColorSelection' and $class='GtkColorSelection')">
<xsl:text>gtk.gtkcolorselection.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_update_policy' and $class='no') or ($funcname='set_update_policy' and $class='GtkColorSelection')">
<xsl:text>gtk.gtkcolorselection.method.set_update_policy</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_opacity' and $class='no') or ($funcname='set_opacity' and $class='GtkColorSelection')">
<xsl:text>gtk.gtkcolorselection.method.set_opacity</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_color' and $class='no') or ($funcname='set_color' and $class='GtkColorSelection')">
<xsl:text>gtk.gtkcolorselection.method.set_color</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_color' and $class='no') or ($funcname='get_color' and $class='GtkColorSelection')">
<xsl:text>gtk.gtkcolorselection.method.get_color</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkColorSelectionDialog' and $class='no') or ($funcname='GtkColorSelectionDialog' and $class='GtkColorSelectionDialog')">
<xsl:text>gtk.gtkcolorselectiondialog.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkCombo' and $class='no') or ($funcname='GtkCombo' and $class='GtkCombo')">
<xsl:text>gtk.gtkcombo.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_value_in_list' and $class='no') or ($funcname='set_value_in_list' and $class='GtkCombo')">
<xsl:text>gtk.gtkcombo.method.set_value_in_list</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_use_arrows' and $class='no') or ($funcname='set_use_arrows' and $class='GtkCombo')">
<xsl:text>gtk.gtkcombo.method.set_use_arrows</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_use_arrows_always' and $class='no') or ($funcname='set_use_arrows_always' and $class='GtkCombo')">
<xsl:text>gtk.gtkcombo.method.set_use_arrows_always</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_case_sensitive' and $class='no') or ($funcname='set_case_sensitive' and $class='GtkCombo')">
<xsl:text>gtk.gtkcombo.method.set_case_sensitive</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_item_string' and $class='no') or ($funcname='set_item_string' and $class='GtkCombo')">
<xsl:text>gtk.gtkcombo.method.set_item_string</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_popdown_strings' and $class='no') or ($funcname='set_popdown_strings' and $class='GtkCombo')">
<xsl:text>gtk.gtkcombo.method.set_popdown_strings</xsl:text>
</xsl:when>
<xsl:when test="($funcname='disable_activate' and $class='no') or ($funcname='disable_activate' and $class='GtkCombo')">
<xsl:text>gtk.gtkcombo.method.disable_activate</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_border_width' and $class='no') or ($funcname='set_border_width' and $class='GtkContainer')">
<xsl:text>gtk.gtkcontainer.method.set_border_width</xsl:text>
</xsl:when>
<xsl:when test="($funcname='add' and $class='no') or ($funcname='add' and $class='GtkContainer')">
<xsl:text>gtk.gtkcontainer.method.add</xsl:text>
</xsl:when>
<xsl:when test="($funcname='remove' and $class='no') or ($funcname='remove' and $class='GtkContainer')">
<xsl:text>gtk.gtkcontainer.method.remove</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_resize_mode' and $class='no') or ($funcname='set_resize_mode' and $class='GtkContainer')">
<xsl:text>gtk.gtkcontainer.method.set_resize_mode</xsl:text>
</xsl:when>
<xsl:when test="($funcname='check_resize' and $class='no') or ($funcname='check_resize' and $class='GtkContainer')">
<xsl:text>gtk.gtkcontainer.method.check_resize</xsl:text>
</xsl:when>
<xsl:when test="($funcname='children' and $class='no') or ($funcname='children' and $class='GtkContainer')">
<xsl:text>gtk.gtkcontainer.method.children</xsl:text>
</xsl:when>
<xsl:when test="($funcname='focus' and $class='no') or ($funcname='focus' and $class='GtkContainer')">
<xsl:text>gtk.gtkcontainer.method.focus</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_reallocate_redraws' and $class='no') or ($funcname='set_reallocate_redraws' and $class='GtkContainer')">
<xsl:text>gtk.gtkcontainer.method.set_reallocate_redraws</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_focus_child' and $class='no') or ($funcname='set_focus_child' and $class='GtkContainer')">
<xsl:text>gtk.gtkcontainer.method.set_focus_child</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_focus_vadjustment' and $class='no') or ($funcname='set_focus_vadjustment' and $class='GtkContainer')">
<xsl:text>gtk.gtkcontainer.method.set_focus_vadjustment</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_focus_hadjustment' and $class='no') or ($funcname='set_focus_hadjustment' and $class='GtkContainer')">
<xsl:text>gtk.gtkcontainer.method.set_focus_hadjustment</xsl:text>
</xsl:when>
<xsl:when test="($funcname='register_toplevel' and $class='no') or ($funcname='register_toplevel' and $class='GtkContainer')">
<xsl:text>gtk.gtkcontainer.method.register_toplevel</xsl:text>
</xsl:when>
<xsl:when test="($funcname='unregister_toplevel' and $class='no') or ($funcname='unregister_toplevel' and $class='GtkContainer')">
<xsl:text>gtk.gtkcontainer.method.unregister_toplevel</xsl:text>
</xsl:when>
<xsl:when test="($funcname='resize_children' and $class='no') or ($funcname='resize_children' and $class='GtkContainer')">
<xsl:text>gtk.gtkcontainer.method.resize_children</xsl:text>
</xsl:when>
<xsl:when test="($funcname='child_type' and $class='no') or ($funcname='child_type' and $class='GtkContainer')">
<xsl:text>gtk.gtkcontainer.method.child_type</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkCTree' and $class='no') or ($funcname='GtkCTree' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='insert_node' and $class='no') or ($funcname='insert_node' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.insert_node</xsl:text>
</xsl:when>
<xsl:when test="($funcname='remove_node' and $class='no') or ($funcname='remove_node' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.remove_node</xsl:text>
</xsl:when>
<xsl:when test="($funcname='post_recursive' and $class='no') or ($funcname='post_recursive' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.post_recursive</xsl:text>
</xsl:when>
<xsl:when test="($funcname='post_recursive_to_depth' and $class='no') or ($funcname='post_recursive_to_depth' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.post_recursive_to_depth</xsl:text>
</xsl:when>
<xsl:when test="($funcname='pre_recursive' and $class='no') or ($funcname='pre_recursive' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.pre_recursive</xsl:text>
</xsl:when>
<xsl:when test="($funcname='pre_recursive_to_depth' and $class='no') or ($funcname='pre_recursive_to_depth' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.pre_recursive_to_depth</xsl:text>
</xsl:when>
<xsl:when test="($funcname='is_viewable' and $class='no') or ($funcname='is_viewable' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.is_viewable</xsl:text>
</xsl:when>
<xsl:when test="($funcname='last' and $class='no') or ($funcname='last' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.last</xsl:text>
</xsl:when>
<xsl:when test="($funcname='node_nth' and $class='no') or ($funcname='node_nth' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.node_nth</xsl:text>
</xsl:when>
<xsl:when test="($funcname='find' and $class='no') or ($funcname='find' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.find</xsl:text>
</xsl:when>
<xsl:when test="($funcname='is_ancestor' and $class='no') or ($funcname='is_ancestor' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.is_ancestor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='is_hot_spot' and $class='no') or ($funcname='is_hot_spot' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.is_hot_spot</xsl:text>
</xsl:when>
<xsl:when test="($funcname='move' and $class='no') or ($funcname='move' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.move</xsl:text>
</xsl:when>
<xsl:when test="($funcname='expand' and $class='no') or ($funcname='expand' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.expand</xsl:text>
</xsl:when>
<xsl:when test="($funcname='expand_recursive' and $class='no') or ($funcname='expand_recursive' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.expand_recursive</xsl:text>
</xsl:when>
<xsl:when test="($funcname='expand_to_depth' and $class='no') or ($funcname='expand_to_depth' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.expand_to_depth</xsl:text>
</xsl:when>
<xsl:when test="($funcname='collapse' and $class='no') or ($funcname='collapse' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.collapse</xsl:text>
</xsl:when>
<xsl:when test="($funcname='collapse_recursive' and $class='no') or ($funcname='collapse_recursive' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.collapse_recursive</xsl:text>
</xsl:when>
<xsl:when test="($funcname='collapse_to_depth' and $class='no') or ($funcname='collapse_to_depth' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.collapse_to_depth</xsl:text>
</xsl:when>
<xsl:when test="($funcname='toggle_expansion' and $class='no') or ($funcname='toggle_expansion' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.toggle_expansion</xsl:text>
</xsl:when>
<xsl:when test="($funcname='toggle_expansion_recursive' and $class='no') or ($funcname='toggle_expansion_recursive' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.toggle_expansion_recursive</xsl:text>
</xsl:when>
<xsl:when test="($funcname='select' and $class='no') or ($funcname='select' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.select</xsl:text>
</xsl:when>
<xsl:when test="($funcname='select_recursive' and $class='no') or ($funcname='select_recursive' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.select_recursive</xsl:text>
</xsl:when>
<xsl:when test="($funcname='unselect' and $class='no') or ($funcname='unselect' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.unselect</xsl:text>
</xsl:when>
<xsl:when test="($funcname='unselect_recursive' and $class='no') or ($funcname='unselect_recursive' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.unselect_recursive</xsl:text>
</xsl:when>
<xsl:when test="($funcname='node_set_text' and $class='no') or ($funcname='node_set_text' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.node_set_text</xsl:text>
</xsl:when>
<xsl:when test="($funcname='node_set_pixmap' and $class='no') or ($funcname='node_set_pixmap' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.node_set_pixmap</xsl:text>
</xsl:when>
<xsl:when test="($funcname='node_set_pixtext' and $class='no') or ($funcname='node_set_pixtext' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.node_set_pixtext</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_node_info' and $class='no') or ($funcname='set_node_info' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.set_node_info</xsl:text>
</xsl:when>
<xsl:when test="($funcname='node_set_shift' and $class='no') or ($funcname='node_set_shift' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.node_set_shift</xsl:text>
</xsl:when>
<xsl:when test="($funcname='node_set_selectable' and $class='no') or ($funcname='node_set_selectable' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.node_set_selectable</xsl:text>
</xsl:when>
<xsl:when test="($funcname='node_get_selectable' and $class='no') or ($funcname='node_get_selectable' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.node_get_selectable</xsl:text>
</xsl:when>
<xsl:when test="($funcname='node_get_cell_type' and $class='no') or ($funcname='node_get_cell_type' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.node_get_cell_type</xsl:text>
</xsl:when>
<xsl:when test="($funcname='node_get_text' and $class='no') or ($funcname='node_get_text' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.node_get_text</xsl:text>
</xsl:when>
<xsl:when test="($funcname='node_get_pixtext' and $class='no') or ($funcname='node_get_pixtext' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.node_get_pixtext</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_node_info' and $class='no') or ($funcname='get_node_info' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.get_node_info</xsl:text>
</xsl:when>
<xsl:when test="($funcname='node_set_row_style' and $class='no') or ($funcname='node_set_row_style' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.node_set_row_style</xsl:text>
</xsl:when>
<xsl:when test="($funcname='node_get_row_style' and $class='no') or ($funcname='node_get_row_style' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.node_get_row_style</xsl:text>
</xsl:when>
<xsl:when test="($funcname='node_set_cell_style' and $class='no') or ($funcname='node_set_cell_style' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.node_set_cell_style</xsl:text>
</xsl:when>
<xsl:when test="($funcname='node_get_cell_style' and $class='no') or ($funcname='node_get_cell_style' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.node_get_cell_style</xsl:text>
</xsl:when>
<xsl:when test="($funcname='node_set_foreground' and $class='no') or ($funcname='node_set_foreground' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.node_set_foreground</xsl:text>
</xsl:when>
<xsl:when test="($funcname='node_set_background' and $class='no') or ($funcname='node_set_background' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.node_set_background</xsl:text>
</xsl:when>
<xsl:when test="($funcname='node_set_row_data' and $class='no') or ($funcname='node_set_row_data' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.node_set_row_data</xsl:text>
</xsl:when>
<xsl:when test="($funcname='node_get_row_data' and $class='no') or ($funcname='node_get_row_data' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.node_get_row_data</xsl:text>
</xsl:when>
<xsl:when test="($funcname='node_moveto' and $class='no') or ($funcname='node_moveto' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.node_moveto</xsl:text>
</xsl:when>
<xsl:when test="($funcname='node_is_visible' and $class='no') or ($funcname='node_is_visible' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.node_is_visible</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_indent' and $class='no') or ($funcname='set_indent' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.set_indent</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_spacing' and $class='no') or ($funcname='set_spacing' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.set_spacing</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_show_stub' and $class='no') or ($funcname='set_show_stub' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.set_show_stub</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_line_style' and $class='no') or ($funcname='set_line_style' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.set_line_style</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_expander_style' and $class='no') or ($funcname='set_expander_style' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.set_expander_style</xsl:text>
</xsl:when>
<xsl:when test="($funcname='sort_node' and $class='no') or ($funcname='sort_node' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.sort_node</xsl:text>
</xsl:when>
<xsl:when test="($funcname='sort_recursive' and $class='no') or ($funcname='sort_recursive' and $class='GtkCTree')">
<xsl:text>gtk.gtkctree.method.sort_recursive</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkCurve' and $class='no') or ($funcname='GtkCurve' and $class='GtkCurve')">
<xsl:text>gtk.gtkcurve.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='reset' and $class='no') or ($funcname='reset' and $class='GtkCurve')">
<xsl:text>gtk.gtkcurve.method.reset</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_gamma' and $class='no') or ($funcname='set_gamma' and $class='GtkCurve')">
<xsl:text>gtk.gtkcurve.method.set_gamma</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_range' and $class='no') or ($funcname='set_range' and $class='GtkCurve')">
<xsl:text>gtk.gtkcurve.method.set_range</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_vector' and $class='no') or ($funcname='get_vector' and $class='GtkCurve')">
<xsl:text>gtk.gtkcurve.method.get_vector</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_vector' and $class='no') or ($funcname='set_vector' and $class='GtkCurve')">
<xsl:text>gtk.gtkcurve.method.set_vector</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_curve_type' and $class='no') or ($funcname='set_curve_type' and $class='GtkCurve')">
<xsl:text>gtk.gtkcurve.method.set_curve_type</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkDialog' and $class='no') or ($funcname='GtkDialog' and $class='GtkDialog')">
<xsl:text>gtk.gtkdialog.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkDrawingArea' and $class='no') or ($funcname='GtkDrawingArea' and $class='GtkDrawingArea')">
<xsl:text>gtk.gtkdrawingarea.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='size' and $class='no') or ($funcname='size' and $class='GtkDrawingArea')">
<xsl:text>gtk.gtkdrawingarea.method.size</xsl:text>
</xsl:when>
<xsl:when test="($funcname='select_region' and $class='no') or ($funcname='select_region' and $class='GtkEditable')">
<xsl:text>gtk.gtkeditable.method.select_region</xsl:text>
</xsl:when>
<xsl:when test="($funcname='insert_text' and $class='no') or ($funcname='insert_text' and $class='GtkEditable')">
<xsl:text>gtk.gtkeditable.method.insert_text</xsl:text>
</xsl:when>
<xsl:when test="($funcname='delete_text' and $class='no') or ($funcname='delete_text' and $class='GtkEditable')">
<xsl:text>gtk.gtkeditable.method.delete_text</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_chars' and $class='no') or ($funcname='get_chars' and $class='GtkEditable')">
<xsl:text>gtk.gtkeditable.method.get_chars</xsl:text>
</xsl:when>
<xsl:when test="($funcname='cut_clipboard' and $class='no') or ($funcname='cut_clipboard' and $class='GtkEditable')">
<xsl:text>gtk.gtkeditable.method.cut_clipboard</xsl:text>
</xsl:when>
<xsl:when test="($funcname='copy_clipboard' and $class='no') or ($funcname='copy_clipboard' and $class='GtkEditable')">
<xsl:text>gtk.gtkeditable.method.copy_clipboard</xsl:text>
</xsl:when>
<xsl:when test="($funcname='paste_clipboard' and $class='no') or ($funcname='paste_clipboard' and $class='GtkEditable')">
<xsl:text>gtk.gtkeditable.method.paste_clipboard</xsl:text>
</xsl:when>
<xsl:when test="($funcname='claim_selection' and $class='no') or ($funcname='claim_selection' and $class='GtkEditable')">
<xsl:text>gtk.gtkeditable.method.claim_selection</xsl:text>
</xsl:when>
<xsl:when test="($funcname='delete_selection' and $class='no') or ($funcname='delete_selection' and $class='GtkEditable')">
<xsl:text>gtk.gtkeditable.method.delete_selection</xsl:text>
</xsl:when>
<xsl:when test="($funcname='changed' and $class='no') or ($funcname='changed' and $class='GtkEditable')">
<xsl:text>gtk.gtkeditable.method.changed</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_position' and $class='no') or ($funcname='set_position' and $class='GtkEditable')">
<xsl:text>gtk.gtkeditable.method.set_position</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_position' and $class='no') or ($funcname='get_position' and $class='GtkEditable')">
<xsl:text>gtk.gtkeditable.method.get_position</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_editable' and $class='no') or ($funcname='set_editable' and $class='GtkEditable')">
<xsl:text>gtk.gtkeditable.method.set_editable</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkEntry' and $class='no') or ($funcname='GtkEntry' and $class='GtkEntry')">
<xsl:text>gtk.gtkentry.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_text' and $class='no') or ($funcname='set_text' and $class='GtkEntry')">
<xsl:text>gtk.gtkentry.method.set_text</xsl:text>
</xsl:when>
<xsl:when test="($funcname='append_text' and $class='no') or ($funcname='append_text' and $class='GtkEntry')">
<xsl:text>gtk.gtkentry.method.append_text</xsl:text>
</xsl:when>
<xsl:when test="($funcname='prepend_text' and $class='no') or ($funcname='prepend_text' and $class='GtkEntry')">
<xsl:text>gtk.gtkentry.method.prepend_text</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_position' and $class='no') or ($funcname='set_position' and $class='GtkEntry')">
<xsl:text>gtk.gtkentry.method.set_position</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_text' and $class='no') or ($funcname='get_text' and $class='GtkEntry')">
<xsl:text>gtk.gtkentry.method.get_text</xsl:text>
</xsl:when>
<xsl:when test="($funcname='select_region' and $class='no') or ($funcname='select_region' and $class='GtkEntry')">
<xsl:text>gtk.gtkentry.method.select_region</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_visibility' and $class='no') or ($funcname='set_visibility' and $class='GtkEntry')">
<xsl:text>gtk.gtkentry.method.set_visibility</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_editable' and $class='no') or ($funcname='set_editable' and $class='GtkEntry')">
<xsl:text>gtk.gtkentry.method.set_editable</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_max_length' and $class='no') or ($funcname='set_max_length' and $class='GtkEntry')">
<xsl:text>gtk.gtkentry.method.set_max_length</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkEventBox' and $class='no') or ($funcname='GtkEventBox' and $class='GtkEventBox')">
<xsl:text>gtk.gtkeventbox.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkFileSelection' and $class='no') or ($funcname='GtkFileSelection' and $class='GtkFileSelection')">
<xsl:text>gtk.gtkfileselection.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_filename' and $class='no') or ($funcname='set_filename' and $class='GtkFileSelection')">
<xsl:text>gtk.gtkfileselection.method.set_filename</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_filename' and $class='no') or ($funcname='get_filename' and $class='GtkFileSelection')">
<xsl:text>gtk.gtkfileselection.method.get_filename</xsl:text>
</xsl:when>
<xsl:when test="($funcname='complete' and $class='no') or ($funcname='complete' and $class='GtkFileSelection')">
<xsl:text>gtk.gtkfileselection.method.complete</xsl:text>
</xsl:when>
<xsl:when test="($funcname='show_fileop_buttons' and $class='no') or ($funcname='show_fileop_buttons' and $class='GtkFileSelection')">
<xsl:text>gtk.gtkfileselection.method.show_fileop_buttons</xsl:text>
</xsl:when>
<xsl:when test="($funcname='hide_fileop_buttons' and $class='no') or ($funcname='hide_fileop_buttons' and $class='GtkFileSelection')">
<xsl:text>gtk.gtkfileselection.method.hide_fileop_buttons</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkFixed' and $class='no') or ($funcname='GtkFixed' and $class='GtkFixed')">
<xsl:text>gtk.gtkfixed.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='put' and $class='no') or ($funcname='put' and $class='GtkFixed')">
<xsl:text>gtk.gtkfixed.method.put</xsl:text>
</xsl:when>
<xsl:when test="($funcname='move' and $class='no') or ($funcname='move' and $class='GtkFixed')">
<xsl:text>gtk.gtkfixed.method.move</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkFontSelection' and $class='no') or ($funcname='GtkFontSelection' and $class='GtkFontSelection')">
<xsl:text>gtk.gtkfontselection.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_font_name' and $class='no') or ($funcname='get_font_name' and $class='GtkFontSelection')">
<xsl:text>gtk.gtkfontselection.method.get_font_name</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_font' and $class='no') or ($funcname='get_font' and $class='GtkFontSelection')">
<xsl:text>gtk.gtkfontselection.method.get_font</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_font_name' and $class='no') or ($funcname='set_font_name' and $class='GtkFontSelection')">
<xsl:text>gtk.gtkfontselection.method.set_font_name</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_preview_text' and $class='no') or ($funcname='get_preview_text' and $class='GtkFontSelection')">
<xsl:text>gtk.gtkfontselection.method.get_preview_text</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_preview_text' and $class='no') or ($funcname='set_preview_text' and $class='GtkFontSelection')">
<xsl:text>gtk.gtkfontselection.method.set_preview_text</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkFontSelectionDialog' and $class='no') or ($funcname='GtkFontSelectionDialog' and $class='GtkFontSelectionDialog')">
<xsl:text>gtk.gtkfontselectiondialog.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_font_name' and $class='no') or ($funcname='get_font_name' and $class='GtkFontSelectionDialog')">
<xsl:text>gtk.gtkfontselectiondialog.method.get_font_name</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_font' and $class='no') or ($funcname='get_font' and $class='GtkFontSelectionDialog')">
<xsl:text>gtk.gtkfontselectiondialog.method.get_font</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_font_name' and $class='no') or ($funcname='set_font_name' and $class='GtkFontSelectionDialog')">
<xsl:text>gtk.gtkfontselectiondialog.method.set_font_name</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_preview_text' and $class='no') or ($funcname='get_preview_text' and $class='GtkFontSelectionDialog')">
<xsl:text>gtk.gtkfontselectiondialog.method.get_preview_text</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_preview_text' and $class='no') or ($funcname='set_preview_text' and $class='GtkFontSelectionDialog')">
<xsl:text>gtk.gtkfontselectiondialog.method.set_preview_text</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkFrame' and $class='no') or ($funcname='GtkFrame' and $class='GtkFrame')">
<xsl:text>gtk.gtkframe.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_label' and $class='no') or ($funcname='set_label' and $class='GtkFrame')">
<xsl:text>gtk.gtkframe.method.set_label</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_label_align' and $class='no') or ($funcname='set_label_align' and $class='GtkFrame')">
<xsl:text>gtk.gtkframe.method.set_label_align</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_shadow_type' and $class='no') or ($funcname='set_shadow_type' and $class='GtkFrame')">
<xsl:text>gtk.gtkframe.method.set_shadow_type</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkGammaCurve' and $class='no') or ($funcname='GtkGammaCurve' and $class='GtkGammaCurve')">
<xsl:text>gtk.gtkgammacurve.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkHandleBox' and $class='no') or ($funcname='GtkHandleBox' and $class='GtkHandleBox')">
<xsl:text>gtk.gtkhandlebox.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_shadow_type' and $class='no') or ($funcname='set_shadow_type' and $class='GtkHandleBox')">
<xsl:text>gtk.gtkhandlebox.method.set_shadow_type</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_handle_position' and $class='no') or ($funcname='set_handle_position' and $class='GtkHandleBox')">
<xsl:text>gtk.gtkhandlebox.method.set_handle_position</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_snap_edge' and $class='no') or ($funcname='set_snap_edge' and $class='GtkHandleBox')">
<xsl:text>gtk.gtkhandlebox.method.set_snap_edge</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkHBox' and $class='no') or ($funcname='GtkHBox' and $class='GtkHBox')">
<xsl:text>gtk.gtkhbox.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkHButtonBox' and $class='no') or ($funcname='GtkHButtonBox' and $class='GtkHButtonBox')">
<xsl:text>gtk.gtkhbuttonbox.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkHPaned' and $class='no') or ($funcname='GtkHPaned' and $class='GtkHPaned')">
<xsl:text>gtk.gtkhpaned.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkHRuler' and $class='no') or ($funcname='GtkHRuler' and $class='GtkHRuler')">
<xsl:text>gtk.gtkhruler.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkHScale' and $class='no') or ($funcname='GtkHScale' and $class='GtkHScale')">
<xsl:text>gtk.gtkhscale.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkHScrollbar' and $class='no') or ($funcname='GtkHScrollbar' and $class='GtkHScrollbar')">
<xsl:text>gtk.gtkhscrollbar.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkHSeparator' and $class='no') or ($funcname='GtkHSeparator' and $class='GtkHSeparator')">
<xsl:text>gtk.gtkhseparator.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkInputDialog' and $class='no') or ($funcname='GtkInputDialog' and $class='GtkInputDialog')">
<xsl:text>gtk.gtkinputdialog.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkInvisible' and $class='no') or ($funcname='GtkInvisible' and $class='GtkInvisible')">
<xsl:text>gtk.gtkinvisible.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='select' and $class='no') or ($funcname='select' and $class='GtkItem')">
<xsl:text>gtk.gtkitem.method.select</xsl:text>
</xsl:when>
<xsl:when test="($funcname='deselect' and $class='no') or ($funcname='deselect' and $class='GtkItem')">
<xsl:text>gtk.gtkitem.method.deselect</xsl:text>
</xsl:when>
<xsl:when test="($funcname='toggle' and $class='no') or ($funcname='toggle' and $class='GtkItem')">
<xsl:text>gtk.gtkitem.method.toggle</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkItemFactory' and $class='no') or ($funcname='GtkItemFactory' and $class='GtkItemFactory')">
<xsl:text>gtk.gtkitemfactory.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='construct' and $class='no') or ($funcname='construct' and $class='GtkItemFactory')">
<xsl:text>gtk.gtkitemfactory.method.construct</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_item' and $class='no') or ($funcname='get_item' and $class='GtkItemFactory')">
<xsl:text>gtk.gtkitemfactory.method.get_item</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_widget' and $class='no') or ($funcname='get_widget' and $class='GtkItemFactory')">
<xsl:text>gtk.gtkitemfactory.method.get_widget</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_widget_by_action' and $class='no') or ($funcname='get_widget_by_action' and $class='GtkItemFactory')">
<xsl:text>gtk.gtkitemfactory.method.get_widget_by_action</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_item_by_action' and $class='no') or ($funcname='get_item_by_action' and $class='GtkItemFactory')">
<xsl:text>gtk.gtkitemfactory.method.get_item_by_action</xsl:text>
</xsl:when>
<xsl:when test="($funcname='create_items' and $class='no') or ($funcname='create_items' and $class='GtkItemFactory')">
<xsl:text>gtk.gtkitemfactory.method.create_items</xsl:text>
</xsl:when>
<xsl:when test="($funcname='delete_item' and $class='no') or ($funcname='delete_item' and $class='GtkItemFactory')">
<xsl:text>gtk.gtkitemfactory.method.delete_item</xsl:text>
</xsl:when>
<xsl:when test="($funcname='popup' and $class='no') or ($funcname='popup' and $class='GtkItemFactory')">
<xsl:text>gtk.gtkitemfactory.method.popup</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkLabel' and $class='no') or ($funcname='GtkLabel' and $class='GtkLabel')">
<xsl:text>gtk.gtklabel.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_text' and $class='no') or ($funcname='set_text' and $class='GtkLabel')">
<xsl:text>gtk.gtklabel.method.set_text</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_justify' and $class='no') or ($funcname='set_justify' and $class='GtkLabel')">
<xsl:text>gtk.gtklabel.method.set_justify</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_pattern' and $class='no') or ($funcname='set_pattern' and $class='GtkLabel')">
<xsl:text>gtk.gtklabel.method.set_pattern</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_line_wrap' and $class='no') or ($funcname='set_line_wrap' and $class='GtkLabel')">
<xsl:text>gtk.gtklabel.method.set_line_wrap</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get' and $class='no') or ($funcname='get' and $class='GtkLabel')">
<xsl:text>gtk.gtklabel.method.get</xsl:text>
</xsl:when>
<xsl:when test="($funcname='parse_uline' and $class='no') or ($funcname='parse_uline' and $class='GtkLabel')">
<xsl:text>gtk.gtklabel.method.parse_uline</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkLayout' and $class='no') or ($funcname='GtkLayout' and $class='GtkLayout')">
<xsl:text>gtk.gtklayout.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='put' and $class='no') or ($funcname='put' and $class='GtkLayout')">
<xsl:text>gtk.gtklayout.method.put</xsl:text>
</xsl:when>
<xsl:when test="($funcname='move' and $class='no') or ($funcname='move' and $class='GtkLayout')">
<xsl:text>gtk.gtklayout.method.move</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_size' and $class='no') or ($funcname='set_size' and $class='GtkLayout')">
<xsl:text>gtk.gtklayout.method.set_size</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_hadjustment' and $class='no') or ($funcname='get_hadjustment' and $class='GtkLayout')">
<xsl:text>gtk.gtklayout.method.get_hadjustment</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_vadjustment' and $class='no') or ($funcname='get_vadjustment' and $class='GtkLayout')">
<xsl:text>gtk.gtklayout.method.get_vadjustment</xsl:text>
</xsl:when>
<xsl:when test="($funcname='freeze' and $class='no') or ($funcname='freeze' and $class='GtkLayout')">
<xsl:text>gtk.gtklayout.method.freeze</xsl:text>
</xsl:when>
<xsl:when test="($funcname='thaw' and $class='no') or ($funcname='thaw' and $class='GtkLayout')">
<xsl:text>gtk.gtklayout.method.thaw</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkList' and $class='no') or ($funcname='GtkList' and $class='GtkList')">
<xsl:text>gtk.gtklist.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='append_items' and $class='no') or ($funcname='append_items' and $class='GtkList')">
<xsl:text>gtk.gtklist.method.append_items</xsl:text>
</xsl:when>
<xsl:when test="($funcname='clear_items' and $class='no') or ($funcname='clear_items' and $class='GtkList')">
<xsl:text>gtk.gtklist.method.clear_items</xsl:text>
</xsl:when>
<xsl:when test="($funcname='select_item' and $class='no') or ($funcname='select_item' and $class='GtkList')">
<xsl:text>gtk.gtklist.method.select_item</xsl:text>
</xsl:when>
<xsl:when test="($funcname='unselect_item' and $class='no') or ($funcname='unselect_item' and $class='GtkList')">
<xsl:text>gtk.gtklist.method.unselect_item</xsl:text>
</xsl:when>
<xsl:when test="($funcname='select_child' and $class='no') or ($funcname='select_child' and $class='GtkList')">
<xsl:text>gtk.gtklist.method.select_child</xsl:text>
</xsl:when>
<xsl:when test="($funcname='unselect_child' and $class='no') or ($funcname='unselect_child' and $class='GtkList')">
<xsl:text>gtk.gtklist.method.unselect_child</xsl:text>
</xsl:when>
<xsl:when test="($funcname='child_position' and $class='no') or ($funcname='child_position' and $class='GtkList')">
<xsl:text>gtk.gtklist.method.child_position</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_selection_mode' and $class='no') or ($funcname='set_selection_mode' and $class='GtkList')">
<xsl:text>gtk.gtklist.method.set_selection_mode</xsl:text>
</xsl:when>
<xsl:when test="($funcname='extend_selection' and $class='no') or ($funcname='extend_selection' and $class='GtkList')">
<xsl:text>gtk.gtklist.method.extend_selection</xsl:text>
</xsl:when>
<xsl:when test="($funcname='start_selection' and $class='no') or ($funcname='start_selection' and $class='GtkList')">
<xsl:text>gtk.gtklist.method.start_selection</xsl:text>
</xsl:when>
<xsl:when test="($funcname='end_selection' and $class='no') or ($funcname='end_selection' and $class='GtkList')">
<xsl:text>gtk.gtklist.method.end_selection</xsl:text>
</xsl:when>
<xsl:when test="($funcname='select_all' and $class='no') or ($funcname='select_all' and $class='GtkList')">
<xsl:text>gtk.gtklist.method.select_all</xsl:text>
</xsl:when>
<xsl:when test="($funcname='unselect_all' and $class='no') or ($funcname='unselect_all' and $class='GtkList')">
<xsl:text>gtk.gtklist.method.unselect_all</xsl:text>
</xsl:when>
<xsl:when test="($funcname='scroll_horizontal' and $class='no') or ($funcname='scroll_horizontal' and $class='GtkList')">
<xsl:text>gtk.gtklist.method.scroll_horizontal</xsl:text>
</xsl:when>
<xsl:when test="($funcname='scroll_vertical' and $class='no') or ($funcname='scroll_vertical' and $class='GtkList')">
<xsl:text>gtk.gtklist.method.scroll_vertical</xsl:text>
</xsl:when>
<xsl:when test="($funcname='toggle_add_mode' and $class='no') or ($funcname='toggle_add_mode' and $class='GtkList')">
<xsl:text>gtk.gtklist.method.toggle_add_mode</xsl:text>
</xsl:when>
<xsl:when test="($funcname='toggle_focus_row' and $class='no') or ($funcname='toggle_focus_row' and $class='GtkList')">
<xsl:text>gtk.gtklist.method.toggle_focus_row</xsl:text>
</xsl:when>
<xsl:when test="($funcname='toggle_row' and $class='no') or ($funcname='toggle_row' and $class='GtkList')">
<xsl:text>gtk.gtklist.method.toggle_row</xsl:text>
</xsl:when>
<xsl:when test="($funcname='undo_selection' and $class='no') or ($funcname='undo_selection' and $class='GtkList')">
<xsl:text>gtk.gtklist.method.undo_selection</xsl:text>
</xsl:when>
<xsl:when test="($funcname='end_drag_selection' and $class='no') or ($funcname='end_drag_selection' and $class='GtkList')">
<xsl:text>gtk.gtklist.method.end_drag_selection</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkListItem' and $class='no') or ($funcname='GtkListItem' and $class='GtkListItem')">
<xsl:text>gtk.gtklistitem.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='select' and $class='no') or ($funcname='select' and $class='GtkListItem')">
<xsl:text>gtk.gtklistitem.method.select</xsl:text>
</xsl:when>
<xsl:when test="($funcname='deselect' and $class='no') or ($funcname='deselect' and $class='GtkListItem')">
<xsl:text>gtk.gtklistitem.method.deselect</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkMenu' and $class='no') or ($funcname='GtkMenu' and $class='GtkMenu')">
<xsl:text>gtk.gtkmenu.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='popup' and $class='no') or ($funcname='popup' and $class='GtkMenu')">
<xsl:text>gtk.gtkmenu.method.popup</xsl:text>
</xsl:when>
<xsl:when test="($funcname='reposition' and $class='no') or ($funcname='reposition' and $class='GtkMenu')">
<xsl:text>gtk.gtkmenu.method.reposition</xsl:text>
</xsl:when>
<xsl:when test="($funcname='popdown' and $class='no') or ($funcname='popdown' and $class='GtkMenu')">
<xsl:text>gtk.gtkmenu.method.popdown</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_active' and $class='no') or ($funcname='get_active' and $class='GtkMenu')">
<xsl:text>gtk.gtkmenu.method.get_active</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_active' and $class='no') or ($funcname='set_active' and $class='GtkMenu')">
<xsl:text>gtk.gtkmenu.method.set_active</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_accel_group' and $class='no') or ($funcname='set_accel_group' and $class='GtkMenu')">
<xsl:text>gtk.gtkmenu.method.set_accel_group</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_accel_group' and $class='no') or ($funcname='get_accel_group' and $class='GtkMenu')">
<xsl:text>gtk.gtkmenu.method.get_accel_group</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_uline_accel_group' and $class='no') or ($funcname='get_uline_accel_group' and $class='GtkMenu')">
<xsl:text>gtk.gtkmenu.method.get_uline_accel_group</xsl:text>
</xsl:when>
<xsl:when test="($funcname='ensure_uline_accel_group' and $class='no') or ($funcname='ensure_uline_accel_group' and $class='GtkMenu')">
<xsl:text>gtk.gtkmenu.method.ensure_uline_accel_group</xsl:text>
</xsl:when>
<xsl:when test="($funcname='attach_to_widget' and $class='no') or ($funcname='attach_to_widget' and $class='GtkMenu')">
<xsl:text>gtk.gtkmenu.method.attach_to_widget</xsl:text>
</xsl:when>
<xsl:when test="($funcname='detach' and $class='no') or ($funcname='detach' and $class='GtkMenu')">
<xsl:text>gtk.gtkmenu.method.detach</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_attach_widget' and $class='no') or ($funcname='get_attach_widget' and $class='GtkMenu')">
<xsl:text>gtk.gtkmenu.method.get_attach_widget</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_tearoff_state' and $class='no') or ($funcname='set_tearoff_state' and $class='GtkMenu')">
<xsl:text>gtk.gtkmenu.method.set_tearoff_state</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_title' and $class='no') or ($funcname='set_title' and $class='GtkMenu')">
<xsl:text>gtk.gtkmenu.method.set_title</xsl:text>
</xsl:when>
<xsl:when test="($funcname='reorder_child' and $class='no') or ($funcname='reorder_child' and $class='GtkMenu')">
<xsl:text>gtk.gtkmenu.method.reorder_child</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkMenuBar' and $class='no') or ($funcname='GtkMenuBar' and $class='GtkMenuBar')">
<xsl:text>gtk.gtkmenubar.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_shadow_type' and $class='no') or ($funcname='set_shadow_type' and $class='GtkMenuBar')">
<xsl:text>gtk.gtkmenubar.method.set_shadow_type</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkMenuItem' and $class='no') or ($funcname='GtkMenuItem' and $class='GtkMenuItem')">
<xsl:text>gtk.gtkmenuitem.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_submenu' and $class='no') or ($funcname='set_submenu' and $class='GtkMenuItem')">
<xsl:text>gtk.gtkmenuitem.method.set_submenu</xsl:text>
</xsl:when>
<xsl:when test="($funcname='remove_submenu' and $class='no') or ($funcname='remove_submenu' and $class='GtkMenuItem')">
<xsl:text>gtk.gtkmenuitem.method.remove_submenu</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_placement' and $class='no') or ($funcname='set_placement' and $class='GtkMenuItem')">
<xsl:text>gtk.gtkmenuitem.method.set_placement</xsl:text>
</xsl:when>
<xsl:when test="($funcname='configure' and $class='no') or ($funcname='configure' and $class='GtkMenuItem')">
<xsl:text>gtk.gtkmenuitem.method.configure</xsl:text>
</xsl:when>
<xsl:when test="($funcname='select' and $class='no') or ($funcname='select' and $class='GtkMenuItem')">
<xsl:text>gtk.gtkmenuitem.method.select</xsl:text>
</xsl:when>
<xsl:when test="($funcname='deselect' and $class='no') or ($funcname='deselect' and $class='GtkMenuItem')">
<xsl:text>gtk.gtkmenuitem.method.deselect</xsl:text>
</xsl:when>
<xsl:when test="($funcname='activate' and $class='no') or ($funcname='activate' and $class='GtkMenuItem')">
<xsl:text>gtk.gtkmenuitem.method.activate</xsl:text>
</xsl:when>
<xsl:when test="($funcname='right_justify' and $class='no') or ($funcname='right_justify' and $class='GtkMenuItem')">
<xsl:text>gtk.gtkmenuitem.method.right_justify</xsl:text>
</xsl:when>
<xsl:when test="($funcname='append' and $class='no') or ($funcname='append' and $class='GtkMenuShell')">
<xsl:text>gtk.gtkmenushell.method.append</xsl:text>
</xsl:when>
<xsl:when test="($funcname='prepend' and $class='no') or ($funcname='prepend' and $class='GtkMenuShell')">
<xsl:text>gtk.gtkmenushell.method.prepend</xsl:text>
</xsl:when>
<xsl:when test="($funcname='insert' and $class='no') or ($funcname='insert' and $class='GtkMenuShell')">
<xsl:text>gtk.gtkmenushell.method.insert</xsl:text>
</xsl:when>
<xsl:when test="($funcname='deactivate' and $class='no') or ($funcname='deactivate' and $class='GtkMenuShell')">
<xsl:text>gtk.gtkmenushell.method.deactivate</xsl:text>
</xsl:when>
<xsl:when test="($funcname='select_item' and $class='no') or ($funcname='select_item' and $class='GtkMenuShell')">
<xsl:text>gtk.gtkmenushell.method.select_item</xsl:text>
</xsl:when>
<xsl:when test="($funcname='deselect' and $class='no') or ($funcname='deselect' and $class='GtkMenuShell')">
<xsl:text>gtk.gtkmenushell.method.deselect</xsl:text>
</xsl:when>
<xsl:when test="($funcname='activate_item' and $class='no') or ($funcname='activate_item' and $class='GtkMenuShell')">
<xsl:text>gtk.gtkmenushell.method.activate_item</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_alignment' and $class='no') or ($funcname='set_alignment' and $class='GtkMisc')">
<xsl:text>gtk.gtkmisc.method.set_alignment</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_padding' and $class='no') or ($funcname='set_padding' and $class='GtkMisc')">
<xsl:text>gtk.gtkmisc.method.set_padding</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkNotebook' and $class='no') or ($funcname='GtkNotebook' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='append_page' and $class='no') or ($funcname='append_page' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.append_page</xsl:text>
</xsl:when>
<xsl:when test="($funcname='append_page_menu' and $class='no') or ($funcname='append_page_menu' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.append_page_menu</xsl:text>
</xsl:when>
<xsl:when test="($funcname='prepend_page' and $class='no') or ($funcname='prepend_page' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.prepend_page</xsl:text>
</xsl:when>
<xsl:when test="($funcname='prepend_page_menu' and $class='no') or ($funcname='prepend_page_menu' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.prepend_page_menu</xsl:text>
</xsl:when>
<xsl:when test="($funcname='insert_page' and $class='no') or ($funcname='insert_page' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.insert_page</xsl:text>
</xsl:when>
<xsl:when test="($funcname='insert_page_menu' and $class='no') or ($funcname='insert_page_menu' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.insert_page_menu</xsl:text>
</xsl:when>
<xsl:when test="($funcname='remove_page' and $class='no') or ($funcname='remove_page' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.remove_page</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_current_page' and $class='no') or ($funcname='get_current_page' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.get_current_page</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_nth_page' and $class='no') or ($funcname='get_nth_page' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.get_nth_page</xsl:text>
</xsl:when>
<xsl:when test="($funcname='page_num' and $class='no') or ($funcname='page_num' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.page_num</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_page' and $class='no') or ($funcname='set_page' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.set_page</xsl:text>
</xsl:when>
<xsl:when test="($funcname='next_page' and $class='no') or ($funcname='next_page' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.next_page</xsl:text>
</xsl:when>
<xsl:when test="($funcname='prev_page' and $class='no') or ($funcname='prev_page' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.prev_page</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_show_border' and $class='no') or ($funcname='set_show_border' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.set_show_border</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_show_tabs' and $class='no') or ($funcname='set_show_tabs' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.set_show_tabs</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_tab_pos' and $class='no') or ($funcname='set_tab_pos' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.set_tab_pos</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_homogeneous_tabs' and $class='no') or ($funcname='set_homogeneous_tabs' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.set_homogeneous_tabs</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_tab_border' and $class='no') or ($funcname='set_tab_border' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.set_tab_border</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_tab_hborder' and $class='no') or ($funcname='set_tab_hborder' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.set_tab_hborder</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_tab_vborder' and $class='no') or ($funcname='set_tab_vborder' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.set_tab_vborder</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_scrollable' and $class='no') or ($funcname='set_scrollable' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.set_scrollable</xsl:text>
</xsl:when>
<xsl:when test="($funcname='popup_enable' and $class='no') or ($funcname='popup_enable' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.popup_enable</xsl:text>
</xsl:when>
<xsl:when test="($funcname='popup_disable' and $class='no') or ($funcname='popup_disable' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.popup_disable</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_tab_label' and $class='no') or ($funcname='get_tab_label' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.get_tab_label</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_tab_label' and $class='no') or ($funcname='set_tab_label' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.set_tab_label</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_tab_label_text' and $class='no') or ($funcname='set_tab_label_text' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.set_tab_label_text</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_menu_label' and $class='no') or ($funcname='get_menu_label' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.get_menu_label</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_menu_label' and $class='no') or ($funcname='set_menu_label' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.set_menu_label</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_menu_label_text' and $class='no') or ($funcname='set_menu_label_text' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.set_menu_label_text</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_tab_label_packing' and $class='no') or ($funcname='set_tab_label_packing' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.set_tab_label_packing</xsl:text>
</xsl:when>
<xsl:when test="($funcname='reorder_child' and $class='no') or ($funcname='reorder_child' and $class='GtkNotebook')">
<xsl:text>gtk.gtknotebook.method.reorder_child</xsl:text>
</xsl:when>
<xsl:when test="($funcname='flags' and $class='no') or ($funcname='flags' and $class='GtkObject')">
<xsl:text>gtk.gtkobject.method.flags</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_flags' and $class='no') or ($funcname='set_flags' and $class='GtkObject')">
<xsl:text>gtk.gtkobject.method.set_flags</xsl:text>
</xsl:when>
<xsl:when test="($funcname='unset_flags' and $class='no') or ($funcname='unset_flags' and $class='GtkObject')">
<xsl:text>gtk.gtkobject.method.unset_flags</xsl:text>
</xsl:when>
<xsl:when test="($funcname='default_construct' and $class='no') or ($funcname='default_construct' and $class='GtkObject')">
<xsl:text>gtk.gtkobject.method.default_construct</xsl:text>
</xsl:when>
<xsl:when test="($funcname='constructed' and $class='no') or ($funcname='constructed' and $class='GtkObject')">
<xsl:text>gtk.gtkobject.method.constructed</xsl:text>
</xsl:when>
<xsl:when test="($funcname='sink' and $class='no') or ($funcname='sink' and $class='GtkObject')">
<xsl:text>gtk.gtkobject.method.sink</xsl:text>
</xsl:when>
<xsl:when test="($funcname='ref' and $class='no') or ($funcname='ref' and $class='GtkObject')">
<xsl:text>gtk.gtkobject.method.ref</xsl:text>
</xsl:when>
<xsl:when test="($funcname='unref' and $class='no') or ($funcname='unref' and $class='GtkObject')">
<xsl:text>gtk.gtkobject.method.unref</xsl:text>
</xsl:when>
<xsl:when test="($funcname='destroy' and $class='no') or ($funcname='destroy' and $class='GtkObject')">
<xsl:text>gtk.gtkobject.method.destroy</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_arg' and $class='no') or ($funcname='get_arg' and $class='GtkObject')">
<xsl:text>gtk.gtkobject.method.get_arg</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_arg' and $class='no') or ($funcname='set_arg' and $class='GtkObject')">
<xsl:text>gtk.gtkobject.method.set_arg</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_data' and $class='no') or ($funcname='set_data' and $class='GtkObject')">
<xsl:text>gtk.gtkobject.method.set_data</xsl:text>
</xsl:when>
<xsl:when test="($funcname='remove_data' and $class='no') or ($funcname='remove_data' and $class='GtkObject')">
<xsl:text>gtk.gtkobject.method.remove_data</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_data' and $class='no') or ($funcname='get_data' and $class='GtkObject')">
<xsl:text>gtk.gtkobject.method.get_data</xsl:text>
</xsl:when>
<xsl:when test="($funcname='remove_no_notify' and $class='no') or ($funcname='remove_no_notify' and $class='GtkObject')">
<xsl:text>gtk.gtkobject.method.remove_no_notify</xsl:text>
</xsl:when>
<xsl:when test="($funcname='emit_stop' and $class='no') or ($funcname='emit_stop' and $class='GtkObject')">
<xsl:text>gtk.gtkobject.method.emit_stop</xsl:text>
</xsl:when>
<xsl:when test="($funcname='emit_stop_by_name' and $class='no') or ($funcname='emit_stop_by_name' and $class='GtkObject')">
<xsl:text>gtk.gtkobject.method.emit_stop_by_name</xsl:text>
</xsl:when>
<xsl:when test="($funcname='connect' and $class='no') or ($funcname='connect' and $class='GtkObject')">
<xsl:text>gtk.gtkobject.method.connect</xsl:text>
</xsl:when>
<xsl:when test="($funcname='connect_after' and $class='no') or ($funcname='connect_after' and $class='GtkObject')">
<xsl:text>gtk.gtkobject.method.connect_after</xsl:text>
</xsl:when>
<xsl:when test="($funcname='connect_object' and $class='no') or ($funcname='connect_object' and $class='GtkObject')">
<xsl:text>gtk.gtkobject.method.connect_object</xsl:text>
</xsl:when>
<xsl:when test="($funcname='connect_object_after' and $class='no') or ($funcname='connect_object_after' and $class='GtkObject')">
<xsl:text>gtk.gtkobject.method.connect_object_after</xsl:text>
</xsl:when>
<xsl:when test="($funcname='disconnect' and $class='no') or ($funcname='disconnect' and $class='GtkObject')">
<xsl:text>gtk.gtkobject.method.disconnect</xsl:text>
</xsl:when>
<xsl:when test="($funcname='signal_handler_block' and $class='no') or ($funcname='signal_handler_block' and $class='GtkObject')">
<xsl:text>gtk.gtkobject.method.signal_handler_block</xsl:text>
</xsl:when>
<xsl:when test="($funcname='signal_handler_unblock' and $class='no') or ($funcname='signal_handler_unblock' and $class='GtkObject')">
<xsl:text>gtk.gtkobject.method.signal_handler_unblock</xsl:text>
</xsl:when>
<xsl:when test="($funcname='signal_handler_pending' and $class='no') or ($funcname='signal_handler_pending' and $class='GtkObject')">
<xsl:text>gtk.gtkobject.method.signal_handler_pending</xsl:text>
</xsl:when>
<xsl:when test="($funcname='signal_handler_pending_by_id' and $class='no') or ($funcname='signal_handler_pending_by_id' and $class='GtkObject')">
<xsl:text>gtk.gtkobject.method.signal_handler_pending_by_id</xsl:text>
</xsl:when>
<xsl:when test="($funcname='emit' and $class='no') or ($funcname='emit' and $class='GtkObject')">
<xsl:text>gtk.gtkobject.method.emit</xsl:text>
</xsl:when>
<xsl:when test="($funcname='signal_handlers_destroy' and $class='no') or ($funcname='signal_handlers_destroy' and $class='GtkObject')">
<xsl:text>gtk.gtkobject.method.signal_handlers_destroy</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkOptionMenu' and $class='no') or ($funcname='GtkOptionMenu' and $class='GtkOptionMenu')">
<xsl:text>gtk.gtkoptionmenu.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_menu' and $class='no') or ($funcname='get_menu' and $class='GtkOptionMenu')">
<xsl:text>gtk.gtkoptionmenu.method.get_menu</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_menu' and $class='no') or ($funcname='set_menu' and $class='GtkOptionMenu')">
<xsl:text>gtk.gtkoptionmenu.method.set_menu</xsl:text>
</xsl:when>
<xsl:when test="($funcname='remove_menu' and $class='no') or ($funcname='remove_menu' and $class='GtkOptionMenu')">
<xsl:text>gtk.gtkoptionmenu.method.remove_menu</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_history' and $class='no') or ($funcname='set_history' and $class='GtkOptionMenu')">
<xsl:text>gtk.gtkoptionmenu.method.set_history</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkPacker' and $class='no') or ($funcname='GtkPacker' and $class='GtkPacker')">
<xsl:text>gtk.gtkpacker.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='add_defaults' and $class='no') or ($funcname='add_defaults' and $class='GtkPacker')">
<xsl:text>gtk.gtkpacker.method.add_defaults</xsl:text>
</xsl:when>
<xsl:when test="($funcname='add' and $class='no') or ($funcname='add' and $class='GtkPacker')">
<xsl:text>gtk.gtkpacker.method.add</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_child_packing' and $class='no') or ($funcname='set_child_packing' and $class='GtkPacker')">
<xsl:text>gtk.gtkpacker.method.set_child_packing</xsl:text>
</xsl:when>
<xsl:when test="($funcname='reorder_child' and $class='no') or ($funcname='reorder_child' and $class='GtkPacker')">
<xsl:text>gtk.gtkpacker.method.reorder_child</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_spacing' and $class='no') or ($funcname='set_spacing' and $class='GtkPacker')">
<xsl:text>gtk.gtkpacker.method.set_spacing</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_default_border_width' and $class='no') or ($funcname='set_default_border_width' and $class='GtkPacker')">
<xsl:text>gtk.gtkpacker.method.set_default_border_width</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_default_pad' and $class='no') or ($funcname='set_default_pad' and $class='GtkPacker')">
<xsl:text>gtk.gtkpacker.method.set_default_pad</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_default_ipad' and $class='no') or ($funcname='set_default_ipad' and $class='GtkPacker')">
<xsl:text>gtk.gtkpacker.method.set_default_ipad</xsl:text>
</xsl:when>
<xsl:when test="($funcname='add1' and $class='no') or ($funcname='add1' and $class='GtkPaned')">
<xsl:text>gtk.gtkpaned.method.add1</xsl:text>
</xsl:when>
<xsl:when test="($funcname='add2' and $class='no') or ($funcname='add2' and $class='GtkPaned')">
<xsl:text>gtk.gtkpaned.method.add2</xsl:text>
</xsl:when>
<xsl:when test="($funcname='pack1' and $class='no') or ($funcname='pack1' and $class='GtkPaned')">
<xsl:text>gtk.gtkpaned.method.pack1</xsl:text>
</xsl:when>
<xsl:when test="($funcname='pack2' and $class='no') or ($funcname='pack2' and $class='GtkPaned')">
<xsl:text>gtk.gtkpaned.method.pack2</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_position' and $class='no') or ($funcname='set_position' and $class='GtkPaned')">
<xsl:text>gtk.gtkpaned.method.set_position</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_handle_size' and $class='no') or ($funcname='set_handle_size' and $class='GtkPaned')">
<xsl:text>gtk.gtkpaned.method.set_handle_size</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_gutter_size' and $class='no') or ($funcname='set_gutter_size' and $class='GtkPaned')">
<xsl:text>gtk.gtkpaned.method.set_gutter_size</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkPixmap' and $class='no') or ($funcname='GtkPixmap' and $class='GtkPixmap')">
<xsl:text>gtk.gtkpixmap.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set' and $class='no') or ($funcname='set' and $class='GtkPixmap')">
<xsl:text>gtk.gtkpixmap.method.set</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_build_insensitive' and $class='no') or ($funcname='set_build_insensitive' and $class='GtkPixmap')">
<xsl:text>gtk.gtkpixmap.method.set_build_insensitive</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkPlug' and $class='no') or ($funcname='GtkPlug' and $class='GtkPlug')">
<xsl:text>gtk.gtkplug.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='construct' and $class='no') or ($funcname='construct' and $class='GtkPlug')">
<xsl:text>gtk.gtkplug.method.construct</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkPreview' and $class='no') or ($funcname='GtkPreview' and $class='GtkPreview')">
<xsl:text>gtk.gtkpreview.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='size' and $class='no') or ($funcname='size' and $class='GtkPreview')">
<xsl:text>gtk.gtkpreview.method.size</xsl:text>
</xsl:when>
<xsl:when test="($funcname='put' and $class='no') or ($funcname='put' and $class='GtkPreview')">
<xsl:text>gtk.gtkpreview.method.put</xsl:text>
</xsl:when>
<xsl:when test="($funcname='draw_row' and $class='no') or ($funcname='draw_row' and $class='GtkPreview')">
<xsl:text>gtk.gtkpreview.method.draw_row</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_expand' and $class='no') or ($funcname='set_expand' and $class='GtkPreview')">
<xsl:text>gtk.gtkpreview.method.set_expand</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_show_text' and $class='no') or ($funcname='set_show_text' and $class='GtkProgress')">
<xsl:text>gtk.gtkprogress.method.set_show_text</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_text_alignment' and $class='no') or ($funcname='set_text_alignment' and $class='GtkProgress')">
<xsl:text>gtk.gtkprogress.method.set_text_alignment</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_format_string' and $class='no') or ($funcname='set_format_string' and $class='GtkProgress')">
<xsl:text>gtk.gtkprogress.method.set_format_string</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_adjustment' and $class='no') or ($funcname='set_adjustment' and $class='GtkProgress')">
<xsl:text>gtk.gtkprogress.method.set_adjustment</xsl:text>
</xsl:when>
<xsl:when test="($funcname='configure' and $class='no') or ($funcname='configure' and $class='GtkProgress')">
<xsl:text>gtk.gtkprogress.method.configure</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_percentage' and $class='no') or ($funcname='set_percentage' and $class='GtkProgress')">
<xsl:text>gtk.gtkprogress.method.set_percentage</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_value' and $class='no') or ($funcname='set_value' and $class='GtkProgress')">
<xsl:text>gtk.gtkprogress.method.set_value</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_value' and $class='no') or ($funcname='get_value' and $class='GtkProgress')">
<xsl:text>gtk.gtkprogress.method.get_value</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_activity_mode' and $class='no') or ($funcname='set_activity_mode' and $class='GtkProgress')">
<xsl:text>gtk.gtkprogress.method.set_activity_mode</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_current_text' and $class='no') or ($funcname='get_current_text' and $class='GtkProgress')">
<xsl:text>gtk.gtkprogress.method.get_current_text</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_text_from_value' and $class='no') or ($funcname='get_text_from_value' and $class='GtkProgress')">
<xsl:text>gtk.gtkprogress.method.get_text_from_value</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_current_percentage' and $class='no') or ($funcname='get_current_percentage' and $class='GtkProgress')">
<xsl:text>gtk.gtkprogress.method.get_current_percentage</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_percentage_from_value' and $class='no') or ($funcname='get_percentage_from_value' and $class='GtkProgress')">
<xsl:text>gtk.gtkprogress.method.get_percentage_from_value</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkProgressBar' and $class='no') or ($funcname='GtkProgressBar' and $class='GtkProgressBar')">
<xsl:text>gtk.gtkprogressbar.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_bar_style' and $class='no') or ($funcname='set_bar_style' and $class='GtkProgressBar')">
<xsl:text>gtk.gtkprogressbar.method.set_bar_style</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_discrete_blocks' and $class='no') or ($funcname='set_discrete_blocks' and $class='GtkProgressBar')">
<xsl:text>gtk.gtkprogressbar.method.set_discrete_blocks</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_activity_step' and $class='no') or ($funcname='set_activity_step' and $class='GtkProgressBar')">
<xsl:text>gtk.gtkprogressbar.method.set_activity_step</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_activity_blocks' and $class='no') or ($funcname='set_activity_blocks' and $class='GtkProgressBar')">
<xsl:text>gtk.gtkprogressbar.method.set_activity_blocks</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_orientation' and $class='no') or ($funcname='set_orientation' and $class='GtkProgressBar')">
<xsl:text>gtk.gtkprogressbar.method.set_orientation</xsl:text>
</xsl:when>
<xsl:when test="($funcname='update' and $class='no') or ($funcname='update' and $class='GtkProgressBar')">
<xsl:text>gtk.gtkprogressbar.method.update</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkRadioButton' and $class='no') or ($funcname='GtkRadioButton' and $class='GtkRadioButton')">
<xsl:text>gtk.gtkradiobutton.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkRadioMenuItem' and $class='no') or ($funcname='GtkRadioMenuItem' and $class='GtkRadioMenuItem')">
<xsl:text>gtk.gtkradiomenuitem.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_adjustment' and $class='no') or ($funcname='get_adjustment' and $class='GtkRange')">
<xsl:text>gtk.gtkrange.method.get_adjustment</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_update_policy' and $class='no') or ($funcname='set_update_policy' and $class='GtkRange')">
<xsl:text>gtk.gtkrange.method.set_update_policy</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_adjustment' and $class='no') or ($funcname='set_adjustment' and $class='GtkRange')">
<xsl:text>gtk.gtkrange.method.set_adjustment</xsl:text>
</xsl:when>
<xsl:when test="($funcname='draw_background' and $class='no') or ($funcname='draw_background' and $class='GtkRange')">
<xsl:text>gtk.gtkrange.method.draw_background</xsl:text>
</xsl:when>
<xsl:when test="($funcname='clear_background' and $class='no') or ($funcname='clear_background' and $class='GtkRange')">
<xsl:text>gtk.gtkrange.method.clear_background</xsl:text>
</xsl:when>
<xsl:when test="($funcname='draw_trough' and $class='no') or ($funcname='draw_trough' and $class='GtkRange')">
<xsl:text>gtk.gtkrange.method.draw_trough</xsl:text>
</xsl:when>
<xsl:when test="($funcname='draw_slider' and $class='no') or ($funcname='draw_slider' and $class='GtkRange')">
<xsl:text>gtk.gtkrange.method.draw_slider</xsl:text>
</xsl:when>
<xsl:when test="($funcname='draw_step_forw' and $class='no') or ($funcname='draw_step_forw' and $class='GtkRange')">
<xsl:text>gtk.gtkrange.method.draw_step_forw</xsl:text>
</xsl:when>
<xsl:when test="($funcname='draw_step_back' and $class='no') or ($funcname='draw_step_back' and $class='GtkRange')">
<xsl:text>gtk.gtkrange.method.draw_step_back</xsl:text>
</xsl:when>
<xsl:when test="($funcname='slider_update' and $class='no') or ($funcname='slider_update' and $class='GtkRange')">
<xsl:text>gtk.gtkrange.method.slider_update</xsl:text>
</xsl:when>
<xsl:when test="($funcname='default_hslider_update' and $class='no') or ($funcname='default_hslider_update' and $class='GtkRange')">
<xsl:text>gtk.gtkrange.method.default_hslider_update</xsl:text>
</xsl:when>
<xsl:when test="($funcname='default_vslider_update' and $class='no') or ($funcname='default_vslider_update' and $class='GtkRange')">
<xsl:text>gtk.gtkrange.method.default_vslider_update</xsl:text>
</xsl:when>
<xsl:when test="($funcname='default_hmotion' and $class='no') or ($funcname='default_hmotion' and $class='GtkRange')">
<xsl:text>gtk.gtkrange.method.default_hmotion</xsl:text>
</xsl:when>
<xsl:when test="($funcname='default_vmotion' and $class='no') or ($funcname='default_vmotion' and $class='GtkRange')">
<xsl:text>gtk.gtkrange.method.default_vmotion</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_metric' and $class='no') or ($funcname='set_metric' and $class='GtkRuler')">
<xsl:text>gtk.gtkruler.method.set_metric</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_range' and $class='no') or ($funcname='set_range' and $class='GtkRuler')">
<xsl:text>gtk.gtkruler.method.set_range</xsl:text>
</xsl:when>
<xsl:when test="($funcname='draw_ticks' and $class='no') or ($funcname='draw_ticks' and $class='GtkRuler')">
<xsl:text>gtk.gtkruler.method.draw_ticks</xsl:text>
</xsl:when>
<xsl:when test="($funcname='draw_pos' and $class='no') or ($funcname='draw_pos' and $class='GtkRuler')">
<xsl:text>gtk.gtkruler.method.draw_pos</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_digits' and $class='no') or ($funcname='set_digits' and $class='GtkScale')">
<xsl:text>gtk.gtkscale.method.set_digits</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_draw_value' and $class='no') or ($funcname='set_draw_value' and $class='GtkScale')">
<xsl:text>gtk.gtkscale.method.set_draw_value</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_value_pos' and $class='no') or ($funcname='set_value_pos' and $class='GtkScale')">
<xsl:text>gtk.gtkscale.method.set_value_pos</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_value_width' and $class='no') or ($funcname='get_value_width' and $class='GtkScale')">
<xsl:text>gtk.gtkscale.method.get_value_width</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkScrolledWindow' and $class='no') or ($funcname='GtkScrolledWindow' and $class='GtkScrolledWindow')">
<xsl:text>gtk.gtkscrolledwindow.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_hadjustment' and $class='no') or ($funcname='get_hadjustment' and $class='GtkScrolledWindow')">
<xsl:text>gtk.gtkscrolledwindow.method.get_hadjustment</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_vadjustment' and $class='no') or ($funcname='get_vadjustment' and $class='GtkScrolledWindow')">
<xsl:text>gtk.gtkscrolledwindow.method.get_vadjustment</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_policy' and $class='no') or ($funcname='set_policy' and $class='GtkScrolledWindow')">
<xsl:text>gtk.gtkscrolledwindow.method.set_policy</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_placement' and $class='no') or ($funcname='set_placement' and $class='GtkScrolledWindow')">
<xsl:text>gtk.gtkscrolledwindow.method.set_placement</xsl:text>
</xsl:when>
<xsl:when test="($funcname='add_with_viewport' and $class='no') or ($funcname='add_with_viewport' and $class='GtkScrolledWindow')">
<xsl:text>gtk.gtkscrolledwindow.method.add_with_viewport</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set' and $class='no') or ($funcname='set' and $class='GtkSelectionData')">
<xsl:text>gtk.gtkselectiondata.method.set</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkSocket' and $class='no') or ($funcname='GtkSocket' and $class='GtkSocket')">
<xsl:text>gtk.gtksocket.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='steal' and $class='no') or ($funcname='steal' and $class='GtkSocket')">
<xsl:text>gtk.gtksocket.method.steal</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkSpinButton' and $class='no') or ($funcname='GtkSpinButton' and $class='GtkSpinButton')">
<xsl:text>gtk.gtkspinbutton.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='configure' and $class='no') or ($funcname='configure' and $class='GtkSpinButton')">
<xsl:text>gtk.gtkspinbutton.method.configure</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_adjustment' and $class='no') or ($funcname='set_adjustment' and $class='GtkSpinButton')">
<xsl:text>gtk.gtkspinbutton.method.set_adjustment</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_adjustment' and $class='no') or ($funcname='get_adjustment' and $class='GtkSpinButton')">
<xsl:text>gtk.gtkspinbutton.method.get_adjustment</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_digits' and $class='no') or ($funcname='set_digits' and $class='GtkSpinButton')">
<xsl:text>gtk.gtkspinbutton.method.set_digits</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_value_as_float' and $class='no') or ($funcname='get_value_as_float' and $class='GtkSpinButton')">
<xsl:text>gtk.gtkspinbutton.method.get_value_as_float</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_value_as_int' and $class='no') or ($funcname='get_value_as_int' and $class='GtkSpinButton')">
<xsl:text>gtk.gtkspinbutton.method.get_value_as_int</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_value' and $class='no') or ($funcname='set_value' and $class='GtkSpinButton')">
<xsl:text>gtk.gtkspinbutton.method.set_value</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_update_policy' and $class='no') or ($funcname='set_update_policy' and $class='GtkSpinButton')">
<xsl:text>gtk.gtkspinbutton.method.set_update_policy</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_numeric' and $class='no') or ($funcname='set_numeric' and $class='GtkSpinButton')">
<xsl:text>gtk.gtkspinbutton.method.set_numeric</xsl:text>
</xsl:when>
<xsl:when test="($funcname='spin' and $class='no') or ($funcname='spin' and $class='GtkSpinButton')">
<xsl:text>gtk.gtkspinbutton.method.spin</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_wrap' and $class='no') or ($funcname='set_wrap' and $class='GtkSpinButton')">
<xsl:text>gtk.gtkspinbutton.method.set_wrap</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_shadow_type' and $class='no') or ($funcname='set_shadow_type' and $class='GtkSpinButton')">
<xsl:text>gtk.gtkspinbutton.method.set_shadow_type</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_snap_to_ticks' and $class='no') or ($funcname='set_snap_to_ticks' and $class='GtkSpinButton')">
<xsl:text>gtk.gtkspinbutton.method.set_snap_to_ticks</xsl:text>
</xsl:when>
<xsl:when test="($funcname='update' and $class='no') or ($funcname='update' and $class='GtkSpinButton')">
<xsl:text>gtk.gtkspinbutton.method.update</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkStatusbar' and $class='no') or ($funcname='GtkStatusbar' and $class='GtkStatusbar')">
<xsl:text>gtk.gtkstatusbar.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_context_id' and $class='no') or ($funcname='get_context_id' and $class='GtkStatusbar')">
<xsl:text>gtk.gtkstatusbar.method.get_context_id</xsl:text>
</xsl:when>
<xsl:when test="($funcname='push' and $class='no') or ($funcname='push' and $class='GtkStatusbar')">
<xsl:text>gtk.gtkstatusbar.method.push</xsl:text>
</xsl:when>
<xsl:when test="($funcname='pop' and $class='no') or ($funcname='pop' and $class='GtkStatusbar')">
<xsl:text>gtk.gtkstatusbar.method.pop</xsl:text>
</xsl:when>
<xsl:when test="($funcname='remove' and $class='no') or ($funcname='remove' and $class='GtkStatusbar')">
<xsl:text>gtk.gtkstatusbar.method.remove</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkStyle' and $class='no') or ($funcname='GtkStyle' and $class='GtkStyle')">
<xsl:text>gtk.gtkstyle.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='copy' and $class='no') or ($funcname='copy' and $class='GtkStyle')">
<xsl:text>gtk.gtkstyle.method.copy</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkTable' and $class='no') or ($funcname='GtkTable' and $class='GtkTable')">
<xsl:text>gtk.gtktable.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='resize' and $class='no') or ($funcname='resize' and $class='GtkTable')">
<xsl:text>gtk.gtktable.method.resize</xsl:text>
</xsl:when>
<xsl:when test="($funcname='attach' and $class='no') or ($funcname='attach' and $class='GtkTable')">
<xsl:text>gtk.gtktable.method.attach</xsl:text>
</xsl:when>
<xsl:when test="($funcname='attach_defaults' and $class='no') or ($funcname='attach_defaults' and $class='GtkTable')">
<xsl:text>gtk.gtktable.method.attach_defaults</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_row_spacing' and $class='no') or ($funcname='set_row_spacing' and $class='GtkTable')">
<xsl:text>gtk.gtktable.method.set_row_spacing</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_col_spacing' and $class='no') or ($funcname='set_col_spacing' and $class='GtkTable')">
<xsl:text>gtk.gtktable.method.set_col_spacing</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_row_spacings' and $class='no') or ($funcname='set_row_spacings' and $class='GtkTable')">
<xsl:text>gtk.gtktable.method.set_row_spacings</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_col_spacings' and $class='no') or ($funcname='set_col_spacings' and $class='GtkTable')">
<xsl:text>gtk.gtktable.method.set_col_spacings</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_homogeneous' and $class='no') or ($funcname='set_homogeneous' and $class='GtkTable')">
<xsl:text>gtk.gtktable.method.set_homogeneous</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkTearoffMenuItem' and $class='no') or ($funcname='GtkTearoffMenuItem' and $class='GtkTearoffMenuItem')">
<xsl:text>gtk.gtktearoffmenuitem.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkText' and $class='no') or ($funcname='GtkText' and $class='GtkText')">
<xsl:text>gtk.gtktext.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_editable' and $class='no') or ($funcname='set_editable' and $class='GtkText')">
<xsl:text>gtk.gtktext.method.set_editable</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_word_wrap' and $class='no') or ($funcname='set_word_wrap' and $class='GtkText')">
<xsl:text>gtk.gtktext.method.set_word_wrap</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_line_wrap' and $class='no') or ($funcname='set_line_wrap' and $class='GtkText')">
<xsl:text>gtk.gtktext.method.set_line_wrap</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_adjustments' and $class='no') or ($funcname='set_adjustments' and $class='GtkText')">
<xsl:text>gtk.gtktext.method.set_adjustments</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_point' and $class='no') or ($funcname='set_point' and $class='GtkText')">
<xsl:text>gtk.gtktext.method.set_point</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_point' and $class='no') or ($funcname='get_point' and $class='GtkText')">
<xsl:text>gtk.gtktext.method.get_point</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_length' and $class='no') or ($funcname='get_length' and $class='GtkText')">
<xsl:text>gtk.gtktext.method.get_length</xsl:text>
</xsl:when>
<xsl:when test="($funcname='freeze' and $class='no') or ($funcname='freeze' and $class='GtkText')">
<xsl:text>gtk.gtktext.method.freeze</xsl:text>
</xsl:when>
<xsl:when test="($funcname='thaw' and $class='no') or ($funcname='thaw' and $class='GtkText')">
<xsl:text>gtk.gtktext.method.thaw</xsl:text>
</xsl:when>
<xsl:when test="($funcname='insert' and $class='no') or ($funcname='insert' and $class='GtkText')">
<xsl:text>gtk.gtktext.method.insert</xsl:text>
</xsl:when>
<xsl:when test="($funcname='backward_delete' and $class='no') or ($funcname='backward_delete' and $class='GtkText')">
<xsl:text>gtk.gtktext.method.backward_delete</xsl:text>
</xsl:when>
<xsl:when test="($funcname='forward_delete' and $class='no') or ($funcname='forward_delete' and $class='GtkText')">
<xsl:text>gtk.gtktext.method.forward_delete</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkTipsQuery' and $class='no') or ($funcname='GtkTipsQuery' and $class='GtkTipsQuery')">
<xsl:text>gtk.gtktipsquery.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='start_query' and $class='no') or ($funcname='start_query' and $class='GtkTipsQuery')">
<xsl:text>gtk.gtktipsquery.method.start_query</xsl:text>
</xsl:when>
<xsl:when test="($funcname='stop_query' and $class='no') or ($funcname='stop_query' and $class='GtkTipsQuery')">
<xsl:text>gtk.gtktipsquery.method.stop_query</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_caller' and $class='no') or ($funcname='set_caller' and $class='GtkTipsQuery')">
<xsl:text>gtk.gtktipsquery.method.set_caller</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_labels' and $class='no') or ($funcname='set_labels' and $class='GtkTipsQuery')">
<xsl:text>gtk.gtktipsquery.method.set_labels</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkToggleButton' and $class='no') or ($funcname='GtkToggleButton' and $class='GtkToggleButton')">
<xsl:text>gtk.gtktogglebutton.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_mode' and $class='no') or ($funcname='set_mode' and $class='GtkToggleButton')">
<xsl:text>gtk.gtktogglebutton.method.set_mode</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_active' and $class='no') or ($funcname='set_active' and $class='GtkToggleButton')">
<xsl:text>gtk.gtktogglebutton.method.set_active</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_active' and $class='no') or ($funcname='get_active' and $class='GtkToggleButton')">
<xsl:text>gtk.gtktogglebutton.method.get_active</xsl:text>
</xsl:when>
<xsl:when test="($funcname='toggled' and $class='no') or ($funcname='toggled' and $class='GtkToggleButton')">
<xsl:text>gtk.gtktogglebutton.method.toggled</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkToolbar' and $class='no') or ($funcname='GtkToolbar' and $class='GtkToolbar')">
<xsl:text>gtk.gtktoolbar.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='append_space' and $class='no') or ($funcname='append_space' and $class='GtkToolbar')">
<xsl:text>gtk.gtktoolbar.method.append_space</xsl:text>
</xsl:when>
<xsl:when test="($funcname='prepend_space' and $class='no') or ($funcname='prepend_space' and $class='GtkToolbar')">
<xsl:text>gtk.gtktoolbar.method.prepend_space</xsl:text>
</xsl:when>
<xsl:when test="($funcname='insert_space' and $class='no') or ($funcname='insert_space' and $class='GtkToolbar')">
<xsl:text>gtk.gtktoolbar.method.insert_space</xsl:text>
</xsl:when>
<xsl:when test="($funcname='append_widget' and $class='no') or ($funcname='append_widget' and $class='GtkToolbar')">
<xsl:text>gtk.gtktoolbar.method.append_widget</xsl:text>
</xsl:when>
<xsl:when test="($funcname='prepend_widget' and $class='no') or ($funcname='prepend_widget' and $class='GtkToolbar')">
<xsl:text>gtk.gtktoolbar.method.prepend_widget</xsl:text>
</xsl:when>
<xsl:when test="($funcname='insert_widget' and $class='no') or ($funcname='insert_widget' and $class='GtkToolbar')">
<xsl:text>gtk.gtktoolbar.method.insert_widget</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_orientation' and $class='no') or ($funcname='set_orientation' and $class='GtkToolbar')">
<xsl:text>gtk.gtktoolbar.method.set_orientation</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_style' and $class='no') or ($funcname='set_style' and $class='GtkToolbar')">
<xsl:text>gtk.gtktoolbar.method.set_style</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_space_size' and $class='no') or ($funcname='set_space_size' and $class='GtkToolbar')">
<xsl:text>gtk.gtktoolbar.method.set_space_size</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_space_style' and $class='no') or ($funcname='set_space_style' and $class='GtkToolbar')">
<xsl:text>gtk.gtktoolbar.method.set_space_style</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_tooltips' and $class='no') or ($funcname='set_tooltips' and $class='GtkToolbar')">
<xsl:text>gtk.gtktoolbar.method.set_tooltips</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_button_relief' and $class='no') or ($funcname='set_button_relief' and $class='GtkToolbar')">
<xsl:text>gtk.gtktoolbar.method.set_button_relief</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_button_relief' and $class='no') or ($funcname='get_button_relief' and $class='GtkToolbar')">
<xsl:text>gtk.gtktoolbar.method.get_button_relief</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkTooltips' and $class='no') or ($funcname='GtkTooltips' and $class='GtkTooltips')">
<xsl:text>gtk.gtktooltips.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='enable' and $class='no') or ($funcname='enable' and $class='GtkTooltips')">
<xsl:text>gtk.gtktooltips.method.enable</xsl:text>
</xsl:when>
<xsl:when test="($funcname='disable' and $class='no') or ($funcname='disable' and $class='GtkTooltips')">
<xsl:text>gtk.gtktooltips.method.disable</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_delay' and $class='no') or ($funcname='set_delay' and $class='GtkTooltips')">
<xsl:text>gtk.gtktooltips.method.set_delay</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_tip' and $class='no') or ($funcname='set_tip' and $class='GtkTooltips')">
<xsl:text>gtk.gtktooltips.method.set_tip</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_colors' and $class='no') or ($funcname='set_colors' and $class='GtkTooltips')">
<xsl:text>gtk.gtktooltips.method.set_colors</xsl:text>
</xsl:when>
<xsl:when test="($funcname='force_window' and $class='no') or ($funcname='force_window' and $class='GtkTooltips')">
<xsl:text>gtk.gtktooltips.method.force_window</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkTree' and $class='no') or ($funcname='GtkTree' and $class='GtkTree')">
<xsl:text>gtk.gtktree.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='append' and $class='no') or ($funcname='append' and $class='GtkTree')">
<xsl:text>gtk.gtktree.method.append</xsl:text>
</xsl:when>
<xsl:when test="($funcname='prepend' and $class='no') or ($funcname='prepend' and $class='GtkTree')">
<xsl:text>gtk.gtktree.method.prepend</xsl:text>
</xsl:when>
<xsl:when test="($funcname='insert' and $class='no') or ($funcname='insert' and $class='GtkTree')">
<xsl:text>gtk.gtktree.method.insert</xsl:text>
</xsl:when>
<xsl:when test="($funcname='clear_items' and $class='no') or ($funcname='clear_items' and $class='GtkTree')">
<xsl:text>gtk.gtktree.method.clear_items</xsl:text>
</xsl:when>
<xsl:when test="($funcname='select_item' and $class='no') or ($funcname='select_item' and $class='GtkTree')">
<xsl:text>gtk.gtktree.method.select_item</xsl:text>
</xsl:when>
<xsl:when test="($funcname='unselect_item' and $class='no') or ($funcname='unselect_item' and $class='GtkTree')">
<xsl:text>gtk.gtktree.method.unselect_item</xsl:text>
</xsl:when>
<xsl:when test="($funcname='select_child' and $class='no') or ($funcname='select_child' and $class='GtkTree')">
<xsl:text>gtk.gtktree.method.select_child</xsl:text>
</xsl:when>
<xsl:when test="($funcname='unselect_child' and $class='no') or ($funcname='unselect_child' and $class='GtkTree')">
<xsl:text>gtk.gtktree.method.unselect_child</xsl:text>
</xsl:when>
<xsl:when test="($funcname='child_position' and $class='no') or ($funcname='child_position' and $class='GtkTree')">
<xsl:text>gtk.gtktree.method.child_position</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_selection_mode' and $class='no') or ($funcname='set_selection_mode' and $class='GtkTree')">
<xsl:text>gtk.gtktree.method.set_selection_mode</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_view_mode' and $class='no') or ($funcname='set_view_mode' and $class='GtkTree')">
<xsl:text>gtk.gtktree.method.set_view_mode</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_view_lines' and $class='no') or ($funcname='set_view_lines' and $class='GtkTree')">
<xsl:text>gtk.gtktree.method.set_view_lines</xsl:text>
</xsl:when>
<xsl:when test="($funcname='remove_item' and $class='no') or ($funcname='remove_item' and $class='GtkTree')">
<xsl:text>gtk.gtktree.method.remove_item</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkTreeItem' and $class='no') or ($funcname='GtkTreeItem' and $class='GtkTreeItem')">
<xsl:text>gtk.gtktreeitem.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_subtree' and $class='no') or ($funcname='set_subtree' and $class='GtkTreeItem')">
<xsl:text>gtk.gtktreeitem.method.set_subtree</xsl:text>
</xsl:when>
<xsl:when test="($funcname='remove_subtree' and $class='no') or ($funcname='remove_subtree' and $class='GtkTreeItem')">
<xsl:text>gtk.gtktreeitem.method.remove_subtree</xsl:text>
</xsl:when>
<xsl:when test="($funcname='select' and $class='no') or ($funcname='select' and $class='GtkTreeItem')">
<xsl:text>gtk.gtktreeitem.method.select</xsl:text>
</xsl:when>
<xsl:when test="($funcname='deselect' and $class='no') or ($funcname='deselect' and $class='GtkTreeItem')">
<xsl:text>gtk.gtktreeitem.method.deselect</xsl:text>
</xsl:when>
<xsl:when test="($funcname='expand' and $class='no') or ($funcname='expand' and $class='GtkTreeItem')">
<xsl:text>gtk.gtktreeitem.method.expand</xsl:text>
</xsl:when>
<xsl:when test="($funcname='collapse' and $class='no') or ($funcname='collapse' and $class='GtkTreeItem')">
<xsl:text>gtk.gtktreeitem.method.collapse</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkVBox' and $class='no') or ($funcname='GtkVBox' and $class='GtkVBox')">
<xsl:text>gtk.gtkvbox.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkVButtonBox' and $class='no') or ($funcname='GtkVButtonBox' and $class='GtkVButtonBox')">
<xsl:text>gtk.gtkvbuttonbox.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkViewport' and $class='no') or ($funcname='GtkViewport' and $class='GtkViewport')">
<xsl:text>gtk.gtkviewport.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_hadjustment' and $class='no') or ($funcname='get_hadjustment' and $class='GtkViewport')">
<xsl:text>gtk.gtkviewport.method.get_hadjustment</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_vadjustment' and $class='no') or ($funcname='get_vadjustment' and $class='GtkViewport')">
<xsl:text>gtk.gtkviewport.method.get_vadjustment</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_shadow_type' and $class='no') or ($funcname='set_shadow_type' and $class='GtkViewport')">
<xsl:text>gtk.gtkviewport.method.set_shadow_type</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkVPaned' and $class='no') or ($funcname='GtkVPaned' and $class='GtkVPaned')">
<xsl:text>gtk.gtkvpaned.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkVRuler' and $class='no') or ($funcname='GtkVRuler' and $class='GtkVRuler')">
<xsl:text>gtk.gtkvruler.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkVScale' and $class='no') or ($funcname='GtkVScale' and $class='GtkVScale')">
<xsl:text>gtk.gtkvscale.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkVScrollbar' and $class='no') or ($funcname='GtkVScrollbar' and $class='GtkVScrollbar')">
<xsl:text>gtk.gtkvscrollbar.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkVSeparator' and $class='no') or ($funcname='GtkVSeparator' and $class='GtkVSeparator')">
<xsl:text>gtk.gtkvseparator.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='drag_highlight' and $class='no') or ($funcname='drag_highlight' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.drag_highlight</xsl:text>
</xsl:when>
<xsl:when test="($funcname='drag_unhighlight' and $class='no') or ($funcname='drag_unhighlight' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.drag_unhighlight</xsl:text>
</xsl:when>
<xsl:when test="($funcname='drag_dest_unset' and $class='no') or ($funcname='drag_dest_unset' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.drag_dest_unset</xsl:text>
</xsl:when>
<xsl:when test="($funcname='drag_source_unset' and $class='no') or ($funcname='drag_source_unset' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.drag_source_unset</xsl:text>
</xsl:when>
<xsl:when test="($funcname='drag_source_set_icon' and $class='no') or ($funcname='drag_source_set_icon' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.drag_source_set_icon</xsl:text>
</xsl:when>
<xsl:when test="($funcname='selection_owner_set' and $class='no') or ($funcname='selection_owner_set' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.selection_owner_set</xsl:text>
</xsl:when>
<xsl:when test="($funcname='selection_add_target' and $class='no') or ($funcname='selection_add_target' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.selection_add_target</xsl:text>
</xsl:when>
<xsl:when test="($funcname='selection_convert' and $class='no') or ($funcname='selection_convert' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.selection_convert</xsl:text>
</xsl:when>
<xsl:when test="($funcname='selection_remove_all' and $class='no') or ($funcname='selection_remove_all' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.selection_remove_all</xsl:text>
</xsl:when>
<xsl:when test="($funcname='unparent' and $class='no') or ($funcname='unparent' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.unparent</xsl:text>
</xsl:when>
<xsl:when test="($funcname='show' and $class='no') or ($funcname='show' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.show</xsl:text>
</xsl:when>
<xsl:when test="($funcname='show_now' and $class='no') or ($funcname='show_now' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.show_now</xsl:text>
</xsl:when>
<xsl:when test="($funcname='hide' and $class='no') or ($funcname='hide' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.hide</xsl:text>
</xsl:when>
<xsl:when test="($funcname='show_all' and $class='no') or ($funcname='show_all' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.show_all</xsl:text>
</xsl:when>
<xsl:when test="($funcname='hide_all' and $class='no') or ($funcname='hide_all' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.hide_all</xsl:text>
</xsl:when>
<xsl:when test="($funcname='map' and $class='no') or ($funcname='map' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.map</xsl:text>
</xsl:when>
<xsl:when test="($funcname='unmap' and $class='no') or ($funcname='unmap' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.unmap</xsl:text>
</xsl:when>
<xsl:when test="($funcname='realize' and $class='no') or ($funcname='realize' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.realize</xsl:text>
</xsl:when>
<xsl:when test="($funcname='unrealize' and $class='no') or ($funcname='unrealize' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.unrealize</xsl:text>
</xsl:when>
<xsl:when test="($funcname='queue_draw' and $class='no') or ($funcname='queue_draw' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.queue_draw</xsl:text>
</xsl:when>
<xsl:when test="($funcname='queue_draw_area' and $class='no') or ($funcname='queue_draw_area' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.queue_draw_area</xsl:text>
</xsl:when>
<xsl:when test="($funcname='queue_clear' and $class='no') or ($funcname='queue_clear' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.queue_clear</xsl:text>
</xsl:when>
<xsl:when test="($funcname='queue_clear_area' and $class='no') or ($funcname='queue_clear_area' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.queue_clear_area</xsl:text>
</xsl:when>
<xsl:when test="($funcname='queue_resize' and $class='no') or ($funcname='queue_resize' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.queue_resize</xsl:text>
</xsl:when>
<xsl:when test="($funcname='draw' and $class='no') or ($funcname='draw' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.draw</xsl:text>
</xsl:when>
<xsl:when test="($funcname='draw_focus' and $class='no') or ($funcname='draw_focus' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.draw_focus</xsl:text>
</xsl:when>
<xsl:when test="($funcname='draw_default' and $class='no') or ($funcname='draw_default' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.draw_default</xsl:text>
</xsl:when>
<xsl:when test="($funcname='add_accelerator' and $class='no') or ($funcname='add_accelerator' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.add_accelerator</xsl:text>
</xsl:when>
<xsl:when test="($funcname='remove_accelerator' and $class='no') or ($funcname='remove_accelerator' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.remove_accelerator</xsl:text>
</xsl:when>
<xsl:when test="($funcname='remove_accelerators' and $class='no') or ($funcname='remove_accelerators' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.remove_accelerators</xsl:text>
</xsl:when>
<xsl:when test="($funcname='lock_accelerators' and $class='no') or ($funcname='lock_accelerators' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.lock_accelerators</xsl:text>
</xsl:when>
<xsl:when test="($funcname='unlock_accelerators' and $class='no') or ($funcname='unlock_accelerators' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.unlock_accelerators</xsl:text>
</xsl:when>
<xsl:when test="($funcname='accelerators_locked' and $class='no') or ($funcname='accelerators_locked' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.accelerators_locked</xsl:text>
</xsl:when>
<xsl:when test="($funcname='event' and $class='no') or ($funcname='event' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.event</xsl:text>
</xsl:when>
<xsl:when test="($funcname='activate' and $class='no') or ($funcname='activate' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.activate</xsl:text>
</xsl:when>
<xsl:when test="($funcname='reparent' and $class='no') or ($funcname='reparent' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.reparent</xsl:text>
</xsl:when>
<xsl:when test="($funcname='popup' and $class='no') or ($funcname='popup' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.popup</xsl:text>
</xsl:when>
<xsl:when test="($funcname='intersect' and $class='no') or ($funcname='intersect' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.intersect</xsl:text>
</xsl:when>
<xsl:when test="($funcname='grab_focus' and $class='no') or ($funcname='grab_focus' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.grab_focus</xsl:text>
</xsl:when>
<xsl:when test="($funcname='grab_default' and $class='no') or ($funcname='grab_default' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.grab_default</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_name' and $class='no') or ($funcname='set_name' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.set_name</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_name' and $class='no') or ($funcname='get_name' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.get_name</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_state' and $class='no') or ($funcname='set_state' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.set_state</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_sensitive' and $class='no') or ($funcname='set_sensitive' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.set_sensitive</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_app_paintable' and $class='no') or ($funcname='set_app_paintable' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.set_app_paintable</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_parent' and $class='no') or ($funcname='set_parent' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.set_parent</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_parent_window' and $class='no') or ($funcname='set_parent_window' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.set_parent_window</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_parent_window' and $class='no') or ($funcname='get_parent_window' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.get_parent_window</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_uposition' and $class='no') or ($funcname='set_uposition' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.set_uposition</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_usize' and $class='no') or ($funcname='set_usize' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.set_usize</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_events' and $class='no') or ($funcname='set_events' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.set_events</xsl:text>
</xsl:when>
<xsl:when test="($funcname='add_events' and $class='no') or ($funcname='add_events' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.add_events</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_toplevel' and $class='no') or ($funcname='get_toplevel' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.get_toplevel</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_ancestor' and $class='no') or ($funcname='get_ancestor' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.get_ancestor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_colormap' and $class='no') or ($funcname='get_colormap' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.get_colormap</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_visual' and $class='no') or ($funcname='get_visual' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.get_visual</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_colormap' and $class='no') or ($funcname='set_colormap' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.set_colormap</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_visual' and $class='no') or ($funcname='set_visual' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.set_visual</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_events' and $class='no') or ($funcname='get_events' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.get_events</xsl:text>
</xsl:when>
<xsl:when test="($funcname='is_ancestor' and $class='no') or ($funcname='is_ancestor' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.is_ancestor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='hide_on_delete' and $class='no') or ($funcname='hide_on_delete' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.hide_on_delete</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_style' and $class='no') or ($funcname='set_style' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.set_style</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_rc_style' and $class='no') or ($funcname='set_rc_style' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.set_rc_style</xsl:text>
</xsl:when>
<xsl:when test="($funcname='ensure_style' and $class='no') or ($funcname='ensure_style' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.ensure_style</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_style' and $class='no') or ($funcname='get_style' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.get_style</xsl:text>
</xsl:when>
<xsl:when test="($funcname='restore_default_style' and $class='no') or ($funcname='restore_default_style' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.restore_default_style</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_composite_name' and $class='no') or ($funcname='set_composite_name' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.set_composite_name</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_composite_name' and $class='no') or ($funcname='get_composite_name' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.get_composite_name</xsl:text>
</xsl:when>
<xsl:when test="($funcname='reset_rc_styles' and $class='no') or ($funcname='reset_rc_styles' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.reset_rc_styles</xsl:text>
</xsl:when>
<xsl:when test="($funcname='shape_combine_mask' and $class='no') or ($funcname='shape_combine_mask' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.method.shape_combine_mask</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkWindow' and $class='no') or ($funcname='GtkWindow' and $class='GtkWindow')">
<xsl:text>gtk.gtkwindow.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_title' and $class='no') or ($funcname='set_title' and $class='GtkWindow')">
<xsl:text>gtk.gtkwindow.method.set_title</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_wmclass' and $class='no') or ($funcname='set_wmclass' and $class='GtkWindow')">
<xsl:text>gtk.gtkwindow.method.set_wmclass</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_policy' and $class='no') or ($funcname='set_policy' and $class='GtkWindow')">
<xsl:text>gtk.gtkwindow.method.set_policy</xsl:text>
</xsl:when>
<xsl:when test="($funcname='add_accel_group' and $class='no') or ($funcname='add_accel_group' and $class='GtkWindow')">
<xsl:text>gtk.gtkwindow.method.add_accel_group</xsl:text>
</xsl:when>
<xsl:when test="($funcname='remove_accel_group' and $class='no') or ($funcname='remove_accel_group' and $class='GtkWindow')">
<xsl:text>gtk.gtkwindow.method.remove_accel_group</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_position' and $class='no') or ($funcname='set_position' and $class='GtkWindow')">
<xsl:text>gtk.gtkwindow.method.set_position</xsl:text>
</xsl:when>
<xsl:when test="($funcname='activate_focus' and $class='no') or ($funcname='activate_focus' and $class='GtkWindow')">
<xsl:text>gtk.gtkwindow.method.activate_focus</xsl:text>
</xsl:when>
<xsl:when test="($funcname='activate_default' and $class='no') or ($funcname='activate_default' and $class='GtkWindow')">
<xsl:text>gtk.gtkwindow.method.activate_default</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_transient_for' and $class='no') or ($funcname='set_transient_for' and $class='GtkWindow')">
<xsl:text>gtk.gtkwindow.method.set_transient_for</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_default_size' and $class='no') or ($funcname='set_default_size' and $class='GtkWindow')">
<xsl:text>gtk.gtkwindow.method.set_default_size</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_modal' and $class='no') or ($funcname='set_modal' and $class='GtkWindow')">
<xsl:text>gtk.gtkwindow.method.set_modal</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_focus' and $class='no') or ($funcname='set_focus' and $class='GtkWindow')">
<xsl:text>gtk.gtkwindow.method.set_focus</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_default' and $class='no') or ($funcname='set_default' and $class='GtkWindow')">
<xsl:text>gtk.gtkwindow.method.set_default</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::accel_group_get_default' and $class='no') or ($funcname='gtk::accel_group_get_default' and $class='')">
<xsl:text>gtk.method.accel_group_get_default</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::button_box_set_child_ipadding_default' and $class='no') or ($funcname='gtk::button_box_set_child_ipadding_default' and $class='')">
<xsl:text>gtk.method.button_box_set_child_ipadding_default</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::button_box_set_child_size_default' and $class='no') or ($funcname='gtk::button_box_set_child_size_default' and $class='')">
<xsl:text>gtk.method.button_box_set_child_size_default</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::check_version' and $class='no') or ($funcname='gtk::check_version' and $class='')">
<xsl:text>gtk.method.check_version</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::drag_finish' and $class='no') or ($funcname='gtk::drag_finish' and $class='')">
<xsl:text>gtk.method.drag_finish</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::drag_get_source_widget' and $class='no') or ($funcname='gtk::drag_get_source_widget' and $class='')">
<xsl:text>gtk.method.drag_get_source_widget</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::drag_set_default_icon' and $class='no') or ($funcname='gtk::drag_set_default_icon' and $class='')">
<xsl:text>gtk.method.drag_set_default_icon</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::drag_set_icon_default' and $class='no') or ($funcname='gtk::drag_set_icon_default' and $class='')">
<xsl:text>gtk.method.drag_set_icon_default</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::drag_set_icon_pixmap' and $class='no') or ($funcname='gtk::drag_set_icon_pixmap' and $class='')">
<xsl:text>gtk.method.drag_set_icon_pixmap</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::drag_set_icon_widget' and $class='no') or ($funcname='gtk::drag_set_icon_widget' and $class='')">
<xsl:text>gtk.method.drag_set_icon_widget</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::drag_dest_handle_event' and $class='no') or ($funcname='gtk::drag_dest_handle_event' and $class='')">
<xsl:text>gtk.method.drag_dest_handle_event</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::drag_source_handle_event' and $class='no') or ($funcname='gtk::drag_source_handle_event' and $class='')">
<xsl:text>gtk.method.drag_source_handle_event</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::draw_arrow' and $class='no') or ($funcname='gtk::draw_arrow' and $class='')">
<xsl:text>gtk.method.draw_arrow</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::draw_box' and $class='no') or ($funcname='gtk::draw_box' and $class='')">
<xsl:text>gtk.method.draw_box</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::draw_diamond' and $class='no') or ($funcname='gtk::draw_diamond' and $class='')">
<xsl:text>gtk.method.draw_diamond</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::draw_hline' and $class='no') or ($funcname='gtk::draw_hline' and $class='')">
<xsl:text>gtk.method.draw_hline</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::draw_oval' and $class='no') or ($funcname='gtk::draw_oval' and $class='')">
<xsl:text>gtk.method.draw_oval</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::draw_shadow' and $class='no') or ($funcname='gtk::draw_shadow' and $class='')">
<xsl:text>gtk.method.draw_shadow</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::draw_string' and $class='no') or ($funcname='gtk::draw_string' and $class='')">
<xsl:text>gtk.method.draw_string</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::draw_vline' and $class='no') or ($funcname='gtk::draw_vline' and $class='')">
<xsl:text>gtk.method.draw_vline</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::entry_new_with_max_length' and $class='no') or ($funcname='gtk::entry_new_with_max_length' and $class='')">
<xsl:text>gtk.method.entry_new_with_max_length</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::events_pending' and $class='no') or ($funcname='gtk::events_pending' and $class='')">
<xsl:text>gtk.method.events_pending</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::false' and $class='no') or ($funcname='gtk::false' and $class='')">
<xsl:text>gtk.method.false</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::hbutton_box_get_layout_default' and $class='no') or ($funcname='gtk::hbutton_box_get_layout_default' and $class='')">
<xsl:text>gtk.method.hbutton_box_get_layout_default</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::hbutton_box_get_spacing_default' and $class='no') or ($funcname='gtk::hbutton_box_get_spacing_default' and $class='')">
<xsl:text>gtk.method.hbutton_box_get_spacing_default</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::grab_add' and $class='no') or ($funcname='gtk::grab_add' and $class='')">
<xsl:text>gtk.method.grab_add</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::grab_get_current' and $class='no') or ($funcname='gtk::grab_get_current' and $class='')">
<xsl:text>gtk.method.grab_get_current</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::grab_remove' and $class='no') or ($funcname='gtk::grab_remove' and $class='')">
<xsl:text>gtk.method.grab_remove</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::hbutton_box_set_layout_default' and $class='no') or ($funcname='gtk::hbutton_box_set_layout_default' and $class='')">
<xsl:text>gtk.method.hbutton_box_set_layout_default</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::hbutton_box_set_spacing_default' and $class='no') or ($funcname='gtk::hbutton_box_set_spacing_default' and $class='')">
<xsl:text>gtk.method.hbutton_box_set_spacing_default</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::idle_add' and $class='no') or ($funcname='gtk::idle_add' and $class='')">
<xsl:text>gtk.method.idle_add</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::idle_remove' and $class='no') or ($funcname='gtk::idle_remove' and $class='')">
<xsl:text>gtk.method.idle_remove</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::input_add' and $class='no') or ($funcname='gtk::input_add' and $class='')">
<xsl:text>gtk.method.input_add</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::input_remove' and $class='no') or ($funcname='gtk::input_remove' and $class='')">
<xsl:text>gtk.method.input_remove</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::item_factories_path_delete' and $class='no') or ($funcname='gtk::item_factories_path_delete' and $class='')">
<xsl:text>gtk.method.item_factories_path_delete</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::item_factory_from_path' and $class='no') or ($funcname='gtk::item_factory_from_path' and $class='')">
<xsl:text>gtk.method.item_factory_from_path</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::item_factory_from_widget' and $class='no') or ($funcname='gtk::item_factory_from_widget' and $class='')">
<xsl:text>gtk.method.item_factory_from_widget</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::item_factory_parse_rc' and $class='no') or ($funcname='gtk::item_factory_parse_rc' and $class='')">
<xsl:text>gtk.method.item_factory_parse_rc</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::item_factory_parse_rc_string' and $class='no') or ($funcname='gtk::item_factory_parse_rc_string' and $class='')">
<xsl:text>gtk.method.item_factory_parse_rc_string</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::item_factory_path_from_widget' and $class='no') or ($funcname='gtk::item_factory_path_from_widget' and $class='')">
<xsl:text>gtk.method.item_factory_path_from_widget</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::main' and $class='no') or ($funcname='gtk::main' and $class='')">
<xsl:text>gtk.method.main</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::main_do_event' and $class='no') or ($funcname='gtk::main_do_event' and $class='')">
<xsl:text>gtk.method.main_do_event</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::main_iteration' and $class='no') or ($funcname='gtk::main_iteration' and $class='')">
<xsl:text>gtk.method.main_iteration</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::main_iteration_do' and $class='no') or ($funcname='gtk::main_iteration_do' and $class='')">
<xsl:text>gtk.method.main_iteration_do</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::main_level' and $class='no') or ($funcname='gtk::main_level' and $class='')">
<xsl:text>gtk.method.main_level</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::main_quit' and $class='no') or ($funcname='gtk::main_quit' and $class='')">
<xsl:text>gtk.method.main_quit</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::paint_arrow' and $class='no') or ($funcname='gtk::paint_arrow' and $class='')">
<xsl:text>gtk.method.paint_arrow</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::paint_box' and $class='no') or ($funcname='gtk::paint_box' and $class='')">
<xsl:text>gtk.method.paint_box</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::paint_box_gap' and $class='no') or ($funcname='gtk::paint_box_gap' and $class='')">
<xsl:text>gtk.method.paint_box_gap</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::paint_check' and $class='no') or ($funcname='gtk::paint_check' and $class='')">
<xsl:text>gtk.method.paint_check</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::paint_cross' and $class='no') or ($funcname='gtk::paint_cross' and $class='')">
<xsl:text>gtk.method.paint_cross</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::paint_diamond' and $class='no') or ($funcname='gtk::paint_diamond' and $class='')">
<xsl:text>gtk.method.paint_diamond</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::paint_extension' and $class='no') or ($funcname='gtk::paint_extension' and $class='')">
<xsl:text>gtk.method.paint_extension</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::paint_flat_box' and $class='no') or ($funcname='gtk::paint_flat_box' and $class='')">
<xsl:text>gtk.method.paint_flat_box</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::paint_focus' and $class='no') or ($funcname='gtk::paint_focus' and $class='')">
<xsl:text>gtk.method.paint_focus</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::paint_handle' and $class='no') or ($funcname='gtk::paint_handle' and $class='')">
<xsl:text>gtk.method.paint_handle</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::paint_hline' and $class='no') or ($funcname='gtk::paint_hline' and $class='')">
<xsl:text>gtk.method.paint_hline</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::paint_option' and $class='no') or ($funcname='gtk::paint_option' and $class='')">
<xsl:text>gtk.method.paint_option</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::paint_oval' and $class='no') or ($funcname='gtk::paint_oval' and $class='')">
<xsl:text>gtk.method.paint_oval</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::paint_ramp' and $class='no') or ($funcname='gtk::paint_ramp' and $class='')">
<xsl:text>gtk.method.paint_ramp</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::paint_shadow' and $class='no') or ($funcname='gtk::paint_shadow' and $class='')">
<xsl:text>gtk.method.paint_shadow</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::paint_shadow_gap' and $class='no') or ($funcname='gtk::paint_shadow_gap' and $class='')">
<xsl:text>gtk.method.paint_shadow_gap</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::paint_slider' and $class='no') or ($funcname='gtk::paint_slider' and $class='')">
<xsl:text>gtk.method.paint_slider</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::paint_string' and $class='no') or ($funcname='gtk::paint_string' and $class='')">
<xsl:text>gtk.method.paint_string</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::paint_tab' and $class='no') or ($funcname='gtk::paint_tab' and $class='')">
<xsl:text>gtk.method.paint_tab</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::paint_vline' and $class='no') or ($funcname='gtk::paint_vline' and $class='')">
<xsl:text>gtk.method.paint_vline</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::preview_get_cmap' and $class='no') or ($funcname='gtk::preview_get_cmap' and $class='')">
<xsl:text>gtk.method.preview_get_cmap</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::preview_get_visual' and $class='no') or ($funcname='gtk::preview_get_visual' and $class='')">
<xsl:text>gtk.method.preview_get_visual</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::preview_reset' and $class='no') or ($funcname='gtk::preview_reset' and $class='')">
<xsl:text>gtk.method.preview_reset</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::preview_set_color_cube' and $class='no') or ($funcname='gtk::preview_set_color_cube' and $class='')">
<xsl:text>gtk.method.preview_set_color_cube</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::preview_set_gamma' and $class='no') or ($funcname='gtk::preview_set_gamma' and $class='')">
<xsl:text>gtk.method.preview_set_gamma</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::preview_set_install_cmap' and $class='no') or ($funcname='gtk::preview_set_install_cmap' and $class='')">
<xsl:text>gtk.method.preview_set_install_cmap</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::preview_set_reserved' and $class='no') or ($funcname='gtk::preview_set_reserved' and $class='')">
<xsl:text>gtk.method.preview_set_reserved</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::quit_add' and $class='no') or ($funcname='gtk::quit_add' and $class='')">
<xsl:text>gtk.method.quit_add</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::quit_remove' and $class='no') or ($funcname='gtk::quit_remove' and $class='')">
<xsl:text>gtk.method.quit_remove</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::rc_add_default_file' and $class='no') or ($funcname='gtk::rc_add_default_file' and $class='')">
<xsl:text>gtk.method.rc_add_default_file</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::rc_find_module_in_path' and $class='no') or ($funcname='gtk::rc_find_module_in_path' and $class='')">
<xsl:text>gtk.method.rc_find_module_in_path</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::rc_get_module_dir' and $class='no') or ($funcname='gtk::rc_get_module_dir' and $class='')">
<xsl:text>gtk.method.rc_get_module_dir</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::rc_get_style' and $class='no') or ($funcname='gtk::rc_get_style' and $class='')">
<xsl:text>gtk.method.rc_get_style</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::rc_get_theme_dir' and $class='no') or ($funcname='gtk::rc_get_theme_dir' and $class='')">
<xsl:text>gtk.method.rc_get_theme_dir</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::rc_load_image' and $class='no') or ($funcname='gtk::rc_load_image' and $class='')">
<xsl:text>gtk.method.rc_load_image</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::rc_parse' and $class='no') or ($funcname='gtk::rc_parse' and $class='')">
<xsl:text>gtk.method.rc_parse</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::rc_parse_string' and $class='no') or ($funcname='gtk::rc_parse_string' and $class='')">
<xsl:text>gtk.method.rc_parse_string</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::rc_reparse_all' and $class='no') or ($funcname='gtk::rc_reparse_all' and $class='')">
<xsl:text>gtk.method.rc_reparse_all</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::timeout_add' and $class='no') or ($funcname='gtk::timeout_add' and $class='')">
<xsl:text>gtk.method.timeout_add</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::timeout_remove' and $class='no') or ($funcname='gtk::timeout_remove' and $class='')">
<xsl:text>gtk.method.timeout_remove</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::true' and $class='no') or ($funcname='gtk::true' and $class='')">
<xsl:text>gtk.method.true</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::type_from_name' and $class='no') or ($funcname='gtk::type_from_name' and $class='')">
<xsl:text>gtk.method.type_from_name</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::type_name' and $class='no') or ($funcname='gtk::type_name' and $class='')">
<xsl:text>gtk.method.type_name</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::vbutton_box_get_layout_default' and $class='no') or ($funcname='gtk::vbutton_box_get_layout_default' and $class='')">
<xsl:text>gtk.method.vbutton_box_get_layout_default</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::vbutton_box_get_spacing_default' and $class='no') or ($funcname='gtk::vbutton_box_get_spacing_default' and $class='')">
<xsl:text>gtk.method.vbutton_box_get_spacing_default</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::vbutton_box_set_layout_default' and $class='no') or ($funcname='gtk::vbutton_box_set_layout_default' and $class='')">
<xsl:text>gtk.method.vbutton_box_set_layout_default</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::vbutton_box_set_spacing_default' and $class='no') or ($funcname='gtk::vbutton_box_set_spacing_default' and $class='')">
<xsl:text>gtk.method.vbutton_box_set_spacing_default</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::widget_get_default_colormap' and $class='no') or ($funcname='gtk::widget_get_default_colormap' and $class='')">
<xsl:text>gtk.method.widget_get_default_colormap</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::widget_get_default_style' and $class='no') or ($funcname='gtk::widget_get_default_style' and $class='')">
<xsl:text>gtk.method.widget_get_default_style</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::widget_get_default_visual' and $class='no') or ($funcname='gtk::widget_get_default_visual' and $class='')">
<xsl:text>gtk.method.widget_get_default_visual</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::widget_pop_colormap' and $class='no') or ($funcname='gtk::widget_pop_colormap' and $class='')">
<xsl:text>gtk.method.widget_pop_colormap</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::widget_pop_composite_child' and $class='no') or ($funcname='gtk::widget_pop_composite_child' and $class='')">
<xsl:text>gtk.method.widget_pop_composite_child</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::widget_pop_style' and $class='no') or ($funcname='gtk::widget_pop_style' and $class='')">
<xsl:text>gtk.method.widget_pop_style</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::widget_pop_visual' and $class='no') or ($funcname='gtk::widget_pop_visual' and $class='')">
<xsl:text>gtk.method.widget_pop_visual</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::widget_push_colormap' and $class='no') or ($funcname='gtk::widget_push_colormap' and $class='')">
<xsl:text>gtk.method.widget_push_colormap</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::widget_push_composite_child' and $class='no') or ($funcname='gtk::widget_push_composite_child' and $class='')">
<xsl:text>gtk.method.widget_push_composite_child</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::widget_push_style' and $class='no') or ($funcname='gtk::widget_push_style' and $class='')">
<xsl:text>gtk.method.widget_push_style</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::widget_push_visual' and $class='no') or ($funcname='gtk::widget_push_visual' and $class='')">
<xsl:text>gtk.method.widget_push_visual</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::widget_set_default_colormap' and $class='no') or ($funcname='gtk::widget_set_default_colormap' and $class='')">
<xsl:text>gtk.method.widget_set_default_colormap</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::widget_set_default_style' and $class='no') or ($funcname='gtk::widget_set_default_style' and $class='')">
<xsl:text>gtk.method.widget_set_default_style</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gtk::widget_set_default_visual' and $class='no') or ($funcname='gtk::widget_set_default_visual' and $class='')">
<xsl:text>gtk.method.widget_set_default_visual</xsl:text>
</xsl:when>
<xsl:when test="($funcname='extents' and $class='no') or ($funcname='extents' and $class='GdkBitmap')">
<xsl:text>gdk.gdkbitmap.method.extents</xsl:text>
</xsl:when>
<xsl:when test="($funcname='lock' and $class='no') or ($funcname='lock' and $class='GdkBitmap')">
<xsl:text>gdk.gdkbitmap.method.measure</xsl:text>
</xsl:when>
<xsl:when test="($funcname='height' and $class='no') or ($funcname='height' and $class='GdkBitmap')">
<xsl:text>gdk.gdkbitmap.method.height</xsl:text>
</xsl:when>
<xsl:when test="($funcname='width' and $class='no') or ($funcname='width' and $class='GdkBitmap')">
<xsl:text>gdk.gdkbitmap.method.width</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GdkColor' and $class='no') or ($funcname='GdkColor' and $class='GdkColor')">
<xsl:text>gdk.gdkcolor.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='size' and $class='no') or ($funcname='size' and $class='GdkColormap')">
<xsl:text>gdk.gdkcolormap.method.size</xsl:text>
</xsl:when>
<xsl:when test="($funcname='alloc' and $class='no') or ($funcname='alloc' and $class='GdkColormap')">
<xsl:text>gdk.gdkcolormap.method.alloc</xsl:text>
</xsl:when>
<xsl:when test="($funcname='extents' and $class='no') or ($funcname='extents' and $class='GdkFont')">
<xsl:text>gdk.gdkfont.method.extents</xsl:text>
</xsl:when>
<xsl:when test="($funcname='measure' and $class='no') or ($funcname='measure' and $class='GdkFont')">
<xsl:text>gdk.gdkfont.method.measure</xsl:text>
</xsl:when>
<xsl:when test="($funcname='height' and $class='no') or ($funcname='height' and $class='GdkFont')">
<xsl:text>gdk.gdkfont.method.height</xsl:text>
</xsl:when>
<xsl:when test="($funcname='width' and $class='no') or ($funcname='width' and $class='GdkFont')">
<xsl:text>gdk.gdkfont.method.width</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_dashes' and $class='no') or ($funcname='set_dashes' and $class='GdkGC')">
<xsl:text>gdk.gdkgc.method.set_dashes</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GdkPixmap' and $class='no') or ($funcname='GdkPixmap' and $class='GdkPixmap')">
<xsl:text>gdk.gdkpixmap.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='new_gc' and $class='no') or ($funcname='new_gc' and $class='GdkPixmap')">
<xsl:text>gdk.gdkpixmap.method.new_gc</xsl:text>
</xsl:when>
<xsl:when test="($funcname='property_get' and $class='no') or ($funcname='property_get' and $class='GdkPixmap')">
<xsl:text>gdk.gdkpixmap.method.property_get</xsl:text>
</xsl:when>
<xsl:when test="($funcname='property_change' and $class='no') or ($funcname='property_change' and $class='GdkPixmap')">
<xsl:text>gdk.gdkpixmap.method.property_change</xsl:text>
</xsl:when>
<xsl:when test="($funcname='property_delete' and $class='no') or ($funcname='property_delete' and $class='GdkPixmap')">
<xsl:text>gdk.gdkpixmap.method.property_delete</xsl:text>
</xsl:when>
<xsl:when test="($funcname='raise' and $class='no') or ($funcname='raise' and $class='GdkWindow')">
<xsl:text>gdk.gdkwindow.method.raise</xsl:text>
</xsl:when>
<xsl:when test="($funcname='lower' and $class='no') or ($funcname='lower' and $class='GdkWindow')">
<xsl:text>gdk.gdkwindow.method.lower</xsl:text>
</xsl:when>
<xsl:when test="($funcname='get_pointer' and $class='no') or ($funcname='get_pointer' and $class='GdkWindow')">
<xsl:text>gdk.gdkwindow.method.get_pointer</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_cursor' and $class='no') or ($funcname='set_cursor' and $class='GdkWindow')">
<xsl:text>gdk.gdkwindow.method.set_cursor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='new_gc' and $class='no') or ($funcname='new_gc' and $class='GdkWindow')">
<xsl:text>gdk.gdkwindow.method.new_gc</xsl:text>
</xsl:when>
<xsl:when test="($funcname='property_get' and $class='no') or ($funcname='property_get' and $class='GdkWindow')">
<xsl:text>gdk.gdkwindow.method.property_get</xsl:text>
</xsl:when>
<xsl:when test="($funcname='property_change' and $class='no') or ($funcname='property_change' and $class='GdkWindow')">
<xsl:text>gdk.gdkwindow.method.property_change</xsl:text>
</xsl:when>
<xsl:when test="($funcname='property_delete' and $class='no') or ($funcname='property_delete' and $class='GdkWindow')">
<xsl:text>gdk.gdkwindow.method.property_delete</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_icon' and $class='no') or ($funcname='set_icon' and $class='GdkWindow')">
<xsl:text>gdk.gdkwindow.method.set_icon</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::atom_intern' and $class='no') or ($funcname='gdk::atom_intern' and $class='')">
<xsl:text>gdk.method.atom_intern</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::beep' and $class='no') or ($funcname='gdk::beep' and $class='')">
<xsl:text>gdk.method.beep</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::colormap_new' and $class='no') or ($funcname='gdk::colormap_new' and $class='')">
<xsl:text>gdk.method.colormap_new</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::colormap_get_system' and $class='no') or ($funcname='gdk::colormap_get_system' and $class='')">
<xsl:text>gdk.method.colormap_get_system</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::colormap_get_system_size' and $class='no') or ($funcname='gdk::colormap_get_system_size' and $class='')">
<xsl:text>gdk.method.colormap_get_system_size</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::color_parse' and $class='no') or ($funcname='gdk::color_parse' and $class='')">
<xsl:text>gdk.method.color_parse</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::cursor_new' and $class='no') or ($funcname='gdk::cursor_new' and $class='')">
<xsl:text>gdk.method.cursor_new</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::cursor_new_from_pixmap' and $class='no') or ($funcname='gdk::cursor_new_from_pixmap' and $class='')">
<xsl:text>gdk.method.cursor_new_from_pixmap</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::drag_status' and $class='no') or ($funcname='gdk::drag_status' and $class='')">
<xsl:text>gdk.method.drag_status</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::draw_arc' and $class='no') or ($funcname='gdk::draw_arc' and $class='')">
<xsl:text>gdk.method.draw_arc</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::draw_gray_image' and $class='no') or ($funcname='gdk::draw_gray_image' and $class='')">
<xsl:text>gdk.method.draw_gray_image</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::draw_line' and $class='no') or ($funcname='gdk::draw_line' and $class='')">
<xsl:text>gdk.method.draw_line</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::draw_pixmap' and $class='no') or ($funcname='gdk::draw_pixmap' and $class='')">
<xsl:text>gdk.method.draw_pixmap</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::draw_point' and $class='no') or ($funcname='gdk::draw_point' and $class='')">
<xsl:text>gdk.method.draw_point</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::draw_rectangle' and $class='no') or ($funcname='gdk::draw_rectangle' and $class='')">
<xsl:text>gdk.method.draw_rectangle</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::draw_rgb_32_image' and $class='no') or ($funcname='gdk::draw_rgb_32_image' and $class='')">
<xsl:text>gdk.method.draw_rgb_32_image</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::draw_rgb_image' and $class='no') or ($funcname='gdk::draw_rgb_image' and $class='')">
<xsl:text>gdk.method.draw_rgb_image</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::draw_rgb_image_dithalign' and $class='no') or ($funcname='gdk::draw_rgb_image_dithalign' and $class='')">
<xsl:text>gdk.method.draw_rgb_image_dithalign</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::draw_string' and $class='no') or ($funcname='gdk::draw_string' and $class='')">
<xsl:text>gdk.method.draw_string</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::draw_text' and $class='no') or ($funcname='gdk::draw_text' and $class='')">
<xsl:text>gdk.method.draw_text</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::flush' and $class='no') or ($funcname='gdk::flush' and $class='')">
<xsl:text>gdk.method.flush</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::font_load' and $class='no') or ($funcname='gdk::font_load' and $class='')">
<xsl:text>gdk.method.font_load</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::fontset_load' and $class='no') or ($funcname='gdk::fontset_load' and $class='')">
<xsl:text>gdk.method.fontset_load</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::get_display' and $class='no') or ($funcname='gdk::get_display' and $class='')">
<xsl:text>gdk.method.get_display</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::input_remove' and $class='no') or ($funcname='gdk::input_remove' and $class='')">
<xsl:text>gdk.method.input_remove</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::pixmap_colormap_create_from_xpm' and $class='no') or ($funcname='gdk::pixmap_colormap_create_from_xpm' and $class='')">
<xsl:text>gdk.method.pixmap_colormap_create_from_xpm</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::pixmap_colormap_create_from_xpm_d' and $class='no') or ($funcname='gdk::pixmap_colormap_create_from_xpm_d' and $class='')">
<xsl:text>gdk.method.pixmap_colormap_create_from_xpm_d</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::pixmap_create_from_xpm' and $class='no') or ($funcname='gdk::pixmap_create_from_xpm' and $class='')">
<xsl:text>gdk.method.pixmap_create_from_xpm</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::pixmap_create_from_xpm_d' and $class='no') or ($funcname='gdk::pixmap_create_from_xpm_d' and $class='')">
<xsl:text>gdk.method.pixmap_create_from_xpm_d</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::pointer_is_grabbed' and $class='no') or ($funcname='gdk::pointer_is_grabbed' and $class='')">
<xsl:text>gdk.method.pointer_is_grabbed</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::rgb_gc_set_background' and $class='no') or ($funcname='gdk::rgb_gc_set_background' and $class='')">
<xsl:text>gdk.method.rgb_gc_set_background</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::rgb_gc_set_foreground' and $class='no') or ($funcname='gdk::rgb_gc_set_foreground' and $class='')">
<xsl:text>gdk.method.rgb_gc_set_foreground</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::rgb_get_cmap' and $class='no') or ($funcname='gdk::rgb_get_cmap' and $class='')">
<xsl:text>gdk.method.rgb_get_cmap</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::rgb_get_visual' and $class='no') or ($funcname='gdk::rgb_get_visual' and $class='')">
<xsl:text>gdk.method.rgb_get_visual</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::rgb_xpixel_from_rgb' and $class='no') or ($funcname='gdk::rgb_xpixel_from_rgb' and $class='')">
<xsl:text>gdk.method.rgb_xpixel_from_rgb</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::screen_height' and $class='no') or ($funcname='gdk::screen_height' and $class='')">
<xsl:text>gdk.method.screen_height</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::screen_height_mm' and $class='no') or ($funcname='gdk::screen_height_mm' and $class='')">
<xsl:text>gdk.method.screen_height_mm</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::screen_width' and $class='no') or ($funcname='gdk::screen_width' and $class='')">
<xsl:text>gdk.method.screen_width</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::screen_width_mm' and $class='no') or ($funcname='gdk::screen_width_mm' and $class='')">
<xsl:text>gdk.method.screen_width_mm</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::threads_enter' and $class='no') or ($funcname='gdk::threads_enter' and $class='')">
<xsl:text>gdk.method.threads_enter</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::threads_leave' and $class='no') or ($funcname='gdk::threads_leave' and $class='')">
<xsl:text>gdk.method.threads_leave</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::visual_get_best' and $class='no') or ($funcname='gdk::visual_get_best' and $class='')">
<xsl:text>gdk.method.visual_get_best</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::visual_get_best_with_both' and $class='no') or ($funcname='gdk::visual_get_best_with_both' and $class='')">
<xsl:text>gdk.method.visual_get_best_with_both</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::visual_get_best_with_depth' and $class='no') or ($funcname='gdk::visual_get_best_with_depth' and $class='')">
<xsl:text>gdk.method.visual_get_best_with_depth</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::visual_get_best_with_type' and $class='no') or ($funcname='gdk::visual_get_best_with_type' and $class='')">
<xsl:text>gdk.method.visual_get_best_with_type</xsl:text>
</xsl:when>
<xsl:when test="($funcname='gdk::visual_get_system' and $class='no') or ($funcname='gdk::visual_get_system' and $class='')">
<xsl:text>gdk.method.visual_get_system</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GladeXML' and $class='no') or ($funcname='GladeXML' and $class='GladeXML')">
<xsl:text>glade.gladexml.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='construct' and $class='no') or ($funcname='construct' and $class='GladeXML')">
<xsl:text>glade.gladexml.method.construct</xsl:text>
</xsl:when>
<xsl:when test="($funcname='signal_connect' and $class='no') or ($funcname='signal_connect' and $class='GladeXML')">
<xsl:text>glade.gladexml.method.signal_connect</xsl:text>
</xsl:when>
<xsl:when test="($funcname='signal_autoconnect' and $class='no') or ($funcname='signal_autoconnect' and $class='GladeXML')">
<xsl:text>glade.gladexml.method.signal_autoconnect</xsl:text>
</xsl:when>
<xsl:when test="($funcname='relative_file' and $class='no') or ($funcname='relative_file' and $class='GladeXML')">
<xsl:text>glade.gladexml.method.relative_file</xsl:text>
</xsl:when>
<xsl:when test="($funcname='xml_new_from_memory' and $class='no') or ($funcname='xml_new_from_memory' and $class='')">
<xsl:text>glade.method.xml_new_from_memory</xsl:text>
</xsl:when>
<xsl:when test="($funcname='GtkSQPane' and $class='no') or ($funcname='GtkSQPane' and $class='GtkSQPane')">
<xsl:text>sqp.gtksqpane.constructor</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_position' and $class='no') or ($funcname='set_position' and $class='GtkSQPane')">
<xsl:text>sqp.gtksqpane.method.set_position</xsl:text>
</xsl:when>
<xsl:when test="($funcname='set_handle_size' and $class='no') or ($funcname='set_handle_size' and $class='GtkSQPane')">
<xsl:text>sqp.gtksqpane.method.set_handle_size</xsl:text>
</xsl:when>
<xsl:when test="($funcname='compute_position' and $class='no') or ($funcname='compute_position' and $class='GtkSQPane')">
<xsl:text>sqp.gtksqpane.method.compute_position</xsl:text>
</xsl:when>


  <xsl:otherwise>

   <xsl:text>no</xsl:text>

  </xsl:otherwise>

  </xsl:choose>

  </xsl:template>

 
  <xsl:template name="get_prop_id_from_name">

  <xsl:param name="propname" />

  <xsl:param name="class" select="no" />

  <xsl:choose>

 <xsl:when test="($propname='value' and $class='no') or ($propname='value' and $class='GtkAdjustment')">
<xsl:text>gtk.gtkadjustment.property.value</xsl:text>
</xsl:when>
<xsl:when test="($propname='lower' and $class='no') or ($propname='lower' and $class='GtkAdjustment')">
<xsl:text>gtk.gtkadjustment.property.lower</xsl:text>
</xsl:when>
<xsl:when test="($propname='upper' and $class='no') or ($propname='upper' and $class='GtkAdjustment')">
<xsl:text>gtk.gtkadjustment.property.upper</xsl:text>
</xsl:when>
<xsl:when test="($propname='step_increment' and $class='no') or ($propname='step_increment' and $class='GtkAdjustment')">
<xsl:text>gtk.gtkadjustment.property.step_increment</xsl:text>
</xsl:when>
<xsl:when test="($propname='page_increment' and $class='no') or ($propname='page_increment' and $class='GtkAdjustment')">
<xsl:text>gtk.gtkadjustment.property.page_increment</xsl:text>
</xsl:when>
<xsl:when test="($propname='page_size' and $class='no') or ($propname='page_size' and $class='GtkAdjustment')">
<xsl:text>gtk.gtkadjustment.property.page_size</xsl:text>
</xsl:when>
<xsl:when test="($propname='arrow_type' and $class='no') or ($propname='arrow_type' and $class='GtkArrow')">
<xsl:text>gtk.gtkarrow.property.arrow_type</xsl:text>
</xsl:when>
<xsl:when test="($propname='shadow_type' and $class='no') or ($propname='shadow_type' and $class='GtkArrow')">
<xsl:text>gtk.gtkarrow.property.shadow_type</xsl:text>
</xsl:when>
<xsl:when test="($propname='child' and $class='no') or ($propname='child' and $class='GtkBin')">
<xsl:text>gtk.gtkbin.property.child</xsl:text>
</xsl:when>
<xsl:when test="($propname='children' and $class='no') or ($propname='children' and $class='GtkBox')">
<xsl:text>gtk.gtkbox.property.children</xsl:text>
</xsl:when>
<xsl:when test="($propname='spacing' and $class='no') or ($propname='spacing' and $class='GtkBox')">
<xsl:text>gtk.gtkbox.property.spacing</xsl:text>
</xsl:when>
<xsl:when test="($propname='homogeneous' and $class='no') or ($propname='homogeneous' and $class='GtkBox')">
<xsl:text>gtk.gtkbox.property.homogeneous</xsl:text>
</xsl:when>
<xsl:when test="($propname='widget' and $class='no') or ($propname='widget' and $class='GtkBoxChild')">
<xsl:text>gtk.gtkboxchild.property.widget</xsl:text>
</xsl:when>
<xsl:when test="($propname='padding' and $class='no') or ($propname='padding' and $class='GtkBoxChild')">
<xsl:text>gtk.gtkboxchild.property.padding</xsl:text>
</xsl:when>
<xsl:when test="($propname='expand' and $class='no') or ($propname='expand' and $class='GtkBoxChild')">
<xsl:text>gtk.gtkboxchild.property.expand</xsl:text>
</xsl:when>
<xsl:when test="($propname='fill' and $class='no') or ($propname='fill' and $class='GtkBoxChild')">
<xsl:text>gtk.gtkboxchild.property.fill</xsl:text>
</xsl:when>
<xsl:when test="($propname='pack' and $class='no') or ($propname='pack' and $class='GtkBoxChild')">
<xsl:text>gtk.gtkboxchild.property.pack</xsl:text>
</xsl:when>
<xsl:when test="($propname='month' and $class='no') or ($propname='month' and $class='GtkCalendar')">
<xsl:text>gtk.gtkcalendar.property.month</xsl:text>
</xsl:when>
<xsl:when test="($propname='year' and $class='no') or ($propname='year' and $class='GtkCalendar')">
<xsl:text>gtk.gtkcalendar.property.year</xsl:text>
</xsl:when>
<xsl:when test="($propname='selected_day' and $class='no') or ($propname='selected_day' and $class='GtkCalendar')">
<xsl:text>gtk.gtkcalendar.property.selected_day</xsl:text>
</xsl:when>
<xsl:when test="($propname='num_marked_dates' and $class='no') or ($propname='num_marked_dates' and $class='GtkCalendar')">
<xsl:text>gtk.gtkcalendar.property.num_marked_dates</xsl:text>
</xsl:when>
<xsl:when test="($propname='marked_date' and $class='no') or ($propname='marked_date' and $class='GtkCalendar')">
<xsl:text>gtk.gtkcalendar.property.marked_date</xsl:text>
</xsl:when>
<xsl:when test="($propname='active' and $class='no') or ($propname='active' and $class='GtkCheckMenuItem')">
<xsl:text>gtk.gtkcheckmenuitem.property.active</xsl:text>
</xsl:when>
<xsl:when test="($propname='state' and $class='no') or ($propname='state' and $class='GtkCListRow')">
<xsl:text>gtk.gtkclistrow.property.state</xsl:text>
</xsl:when>
<xsl:when test="($propname='foreground' and $class='no') or ($propname='foreground' and $class='GtkCListRow')">
<xsl:text>gtk.gtkclistrow.property.foreground</xsl:text>
</xsl:when>
<xsl:when test="($propname='background' and $class='no') or ($propname='background' and $class='GtkCListRow')">
<xsl:text>gtk.gtkclistrow.property.background</xsl:text>
</xsl:when>
<xsl:when test="($propname='style' and $class='no') or ($propname='style' and $class='GtkCListRow')">
<xsl:text>gtk.gtkclistrow.property.style</xsl:text>
</xsl:when>
<xsl:when test="($propname='fg_set' and $class='no') or ($propname='fg_set' and $class='GtkCListRow')">
<xsl:text>gtk.gtkclistrow.property.fg_set</xsl:text>
</xsl:when>
<xsl:when test="($propname='bg_set' and $class='no') or ($propname='bg_set' and $class='GtkCListRow')">
<xsl:text>gtk.gtkclistrow.property.bg_set</xsl:text>
</xsl:when>
<xsl:when test="($propname='selectable' and $class='no') or ($propname='selectable' and $class='GtkCListRow')">
<xsl:text>gtk.gtkclistrow.property.selectable</xsl:text>
</xsl:when>
<xsl:when test="($propname='entry' and $class='no') or ($propname='entry' and $class='GtkCombo')">
<xsl:text>gtk.gtkcombo.property.entry</xsl:text>
</xsl:when>
<xsl:when test="($propname='list' and $class='no') or ($propname='list' and $class='GtkCombo')">
<xsl:text>gtk.gtkcombo.property.list</xsl:text>
</xsl:when>
<xsl:when test="($propname='parent' and $class='no') or ($propname='parent' and $class='GtkCTreeNode')">
<xsl:text>gtk.gtkctreenode.property.parent</xsl:text>
</xsl:when>
<xsl:when test="($propname='sibling' and $class='no') or ($propname='sibling' and $class='GtkCTreeNode')">
<xsl:text>gtk.gtkctreenode.property.sibling</xsl:text>
</xsl:when>
<xsl:when test="($propname='children' and $class='no') or ($propname='children' and $class='GtkCTreeNode')">
<xsl:text>gtk.gtkctreenode.property.children</xsl:text>
</xsl:when>
<xsl:when test="($propname='pixmap_closed' and $class='no') or ($propname='pixmap_closed' and $class='GtkCTreeNode')">
<xsl:text>gtk.gtkctreenode.property.pixmap_closed</xsl:text>
</xsl:when>
<xsl:when test="($propname='pixmap_opened' and $class='no') or ($propname='pixmap_opened' and $class='GtkCTreeNode')">
<xsl:text>gtk.gtkctreenode.property.pixmap_opened</xsl:text>
</xsl:when>
<xsl:when test="($propname='mask_closed' and $class='no') or ($propname='mask_closed' and $class='GtkCTreeNode')">
<xsl:text>gtk.gtkctreenode.property.mask_closed</xsl:text>
</xsl:when>
<xsl:when test="($propname='mask_opened' and $class='no') or ($propname='mask_opened' and $class='GtkCTreeNode')">
<xsl:text>gtk.gtkctreenode.property.mask_opened</xsl:text>
</xsl:when>
<xsl:when test="($propname='level' and $class='no') or ($propname='level' and $class='GtkCTreeNode')">
<xsl:text>gtk.gtkctreenode.property.level</xsl:text>
</xsl:when>
<xsl:when test="($propname='is_leaf' and $class='no') or ($propname='is_leaf' and $class='GtkCTreeNode')">
<xsl:text>gtk.gtkctreenode.property.is_leaf</xsl:text>
</xsl:when>
<xsl:when test="($propname='expanded' and $class='no') or ($propname='expanded' and $class='GtkCTreeNode')">
<xsl:text>gtk.gtkctreenode.property.expanded</xsl:text>
</xsl:when>
<xsl:when test="($propname='row' and $class='no') or ($propname='row' and $class='GtkCTreeNode')">
<xsl:text>gtk.gtkctreenode.property.row</xsl:text>
</xsl:when>
<xsl:when test="($propname='vbox' and $class='no') or ($propname='vbox' and $class='GtkDialog')">
<xsl:text>gtk.gtkdialog.property.vbox</xsl:text>
</xsl:when>
<xsl:when test="($propname='action_area' and $class='no') or ($propname='action_area' and $class='GtkDialog')">
<xsl:text>gtk.gtkdialog.property.action_area</xsl:text>
</xsl:when>
<xsl:when test="($propname='selection_start_pos' and $class='no') or ($propname='selection_start_pos' and $class='GtkEditable')">
<xsl:text>gtk.gtkeditable.property.selection_start_pos</xsl:text>
</xsl:when>
<xsl:when test="($propname='selection_end_pos' and $class='no') or ($propname='selection_end_pos' and $class='GtkEditable')">
<xsl:text>gtk.gtkeditable.property.selection_end_pos</xsl:text>
</xsl:when>
<xsl:when test="($propname='has_selection' and $class='no') or ($propname='has_selection' and $class='GtkEditable')">
<xsl:text>gtk.gtkeditable.property.has_selection</xsl:text>
</xsl:when>
<xsl:when test="($propname='dir_list' and $class='no') or ($propname='dir_list' and $class='GtkFileSelection')">
<xsl:text>gtk.gtkfileselection.property.dir_list</xsl:text>
</xsl:when>
<xsl:when test="($propname='file_list' and $class='no') or ($propname='file_list' and $class='GtkFileSelection')">
<xsl:text>gtk.gtkfileselection.property.file_list</xsl:text>
</xsl:when>
<xsl:when test="($propname='selection_entry' and $class='no') or ($propname='selection_entry' and $class='GtkFileSelection')">
<xsl:text>gtk.gtkfileselection.property.selection_entry</xsl:text>
</xsl:when>
<xsl:when test="($propname='selection_text' and $class='no') or ($propname='selection_text' and $class='GtkFileSelection')">
<xsl:text>gtk.gtkfileselection.property.selection_text</xsl:text>
</xsl:when>
<xsl:when test="($propname='main_vbox' and $class='no') or ($propname='main_vbox' and $class='GtkFileSelection')">
<xsl:text>gtk.gtkfileselection.property.main_vbox</xsl:text>
</xsl:when>
<xsl:when test="($propname='ok_button' and $class='no') or ($propname='ok_button' and $class='GtkFileSelection')">
<xsl:text>gtk.gtkfileselection.property.ok_button</xsl:text>
</xsl:when>
<xsl:when test="($propname='cancel_button' and $class='no') or ($propname='cancel_button' and $class='GtkFileSelection')">
<xsl:text>gtk.gtkfileselection.property.cancel_button</xsl:text>
</xsl:when>
<xsl:when test="($propname='action_area' and $class='no') or ($propname='action_area' and $class='GtkFileSelection')">
<xsl:text>gtk.gtkfileselection.property.action_area</xsl:text>
</xsl:when>
<xsl:when test="($propname='children' and $class='no') or ($propname='children' and $class='GtkFixed')">
<xsl:text>gtk.gtkfixed.property.children</xsl:text>
</xsl:when>
<xsl:when test="($propname='widget' and $class='no') or ($propname='widget' and $class='GtkFixedChild')">
<xsl:text>gtk.gtkfixedchild.property.widget</xsl:text>
</xsl:when>
<xsl:when test="($propname='x' and $class='no') or ($propname='x' and $class='GtkFixedChild')">
<xsl:text>gtk.gtkfixedchild.property.x</xsl:text>
</xsl:when>
<xsl:when test="($propname='y' and $class='no') or ($propname='y' and $class='GtkFixedChild')">
<xsl:text>gtk.gtkfixedchild.property.y</xsl:text>
</xsl:when>
<xsl:when test="($propname='selection' and $class='no') or ($propname='selection' and $class='GtkList')">
<xsl:text>gtk.gtklist.property.selection</xsl:text>
</xsl:when>
<xsl:when test="($propname='xalign' and $class='no') or ($propname='xalign' and $class='GtkMisc')">
<xsl:text>gtk.gtkmisc.property.xalign</xsl:text>
</xsl:when>
<xsl:when test="($propname='yalign' and $class='no') or ($propname='yalign' and $class='GtkMisc')">
<xsl:text>gtk.gtkmisc.property.yalign</xsl:text>
</xsl:when>
<xsl:when test="($propname='xpad' and $class='no') or ($propname='xpad' and $class='GtkMisc')">
<xsl:text>gtk.gtkmisc.property.xpad</xsl:text>
</xsl:when>
<xsl:when test="($propname='ypad' and $class='no') or ($propname='ypad' and $class='GtkMisc')">
<xsl:text>gtk.gtkmisc.property.ypad</xsl:text>
</xsl:when>
<xsl:when test="($propname='child1' and $class='no') or ($propname='child1' and $class='GtkPaned')">
<xsl:text>gtk.gtkpaned.property.child1</xsl:text>
</xsl:when>
<xsl:when test="($propname='child2' and $class='no') or ($propname='child2' and $class='GtkPaned')">
<xsl:text>gtk.gtkpaned.property.child2</xsl:text>
</xsl:when>
<xsl:when test="($propname='handle_size' and $class='no') or ($propname='handle_size' and $class='GtkPaned')">
<xsl:text>gtk.gtkpaned.property.handle_size</xsl:text>
</xsl:when>
<xsl:when test="($propname='gutter_size' and $class='no') or ($propname='gutter_size' and $class='GtkPaned')">
<xsl:text>gtk.gtkpaned.property.gutter_size</xsl:text>
</xsl:when>
<xsl:when test="($propname='child1_resize' and $class='no') or ($propname='child1_resize' and $class='GtkPaned')">
<xsl:text>gtk.gtkpaned.property.child1_resize</xsl:text>
</xsl:when>
<xsl:when test="($propname='child1_shrink' and $class='no') or ($propname='child1_shrink' and $class='GtkPaned')">
<xsl:text>gtk.gtkpaned.property.child1_shrink</xsl:text>
</xsl:when>
<xsl:when test="($propname='child2_resize' and $class='no') or ($propname='child2_resize' and $class='GtkPaned')">
<xsl:text>gtk.gtkpaned.property.child2_resize</xsl:text>
</xsl:when>
<xsl:when test="($propname='child2_shrink' and $class='no') or ($propname='child2_shrink' and $class='GtkPaned')">
<xsl:text>gtk.gtkpaned.property.child2_shrink</xsl:text>
</xsl:when>
<xsl:when test="($propname='selection' and $class='no') or ($propname='selection' and $class='GtkSelectionData')">
<xsl:text>gtk.gtkselectiondata.property.selection</xsl:text>
</xsl:when>
<xsl:when test="($propname='target' and $class='no') or ($propname='target' and $class='GtkSelectionData')">
<xsl:text>gtk.gtkselectiondata.property.target</xsl:text>
</xsl:when>
<xsl:when test="($propname='type' and $class='no') or ($propname='type' and $class='GtkSelectionData')">
<xsl:text>gtk.gtkselectiondata.property.type</xsl:text>
</xsl:when>
<xsl:when test="($propname='format' and $class='no') or ($propname='format' and $class='GtkSelectionData')">
<xsl:text>gtk.gtkselectiondata.property.format</xsl:text>
</xsl:when>
<xsl:when test="($propname='length' and $class='no') or ($propname='length' and $class='GtkSelectionData')">
<xsl:text>gtk.gtkselectiondata.property.length</xsl:text>
</xsl:when>
<xsl:when test="($propname='data' and $class='no') or ($propname='data' and $class='GtkSelectionData')">
<xsl:text>gtk.gtkselectiondata.property.data</xsl:text>
</xsl:when>
<xsl:when test="($propname='black' and $class='no') or ($propname='black' and $class='GtkStyle')">
<xsl:text>gtk.gtkstyle.property.black</xsl:text>
</xsl:when>
<xsl:when test="($propname='white' and $class='no') or ($propname='white' and $class='GtkStyle')">
<xsl:text>gtk.gtkstyle.property.white</xsl:text>
</xsl:when>
<xsl:when test="($propname='font' and $class='no') or ($propname='font' and $class='GtkStyle')">
<xsl:text>gtk.gtkstyle.property.font</xsl:text>
</xsl:when>
<xsl:when test="($propname='black_gc' and $class='no') or ($propname='black_gc' and $class='GtkStyle')">
<xsl:text>gtk.gtkstyle.property.black_gc</xsl:text>
</xsl:when>
<xsl:when test="($propname='white_gc' and $class='no') or ($propname='white_gc' and $class='GtkStyle')">
<xsl:text>gtk.gtkstyle.property.white_gc</xsl:text>
</xsl:when>
<xsl:when test="($propname='colormap' and $class='no') or ($propname='colormap' and $class='GtkStyle')">
<xsl:text>gtk.gtkstyle.property.colormap</xsl:text>
</xsl:when>
<xsl:when test="($propname='fg' and $class='no') or ($propname='fg' and $class='GtkStyle')">
<xsl:text>gtk.gtkstyle.property.fg</xsl:text>
</xsl:when>
<xsl:when test="($propname='bg' and $class='no') or ($propname='bg' and $class='GtkStyle')">
<xsl:text>gtk.gtkstyle.property.bg</xsl:text>
</xsl:when>
<xsl:when test="($propname='light' and $class='no') or ($propname='light' and $class='GtkStyle')">
<xsl:text>gtk.gtkstyle.property.light</xsl:text>
</xsl:when>
<xsl:when test="($propname='dark' and $class='no') or ($propname='dark' and $class='GtkStyle')">
<xsl:text>gtk.gtkstyle.property.dark</xsl:text>
</xsl:when>
<xsl:when test="($propname='mid' and $class='no') or ($propname='mid' and $class='GtkStyle')">
<xsl:text>gtk.gtkstyle.property.mid</xsl:text>
</xsl:when>
<xsl:when test="($propname='text' and $class='no') or ($propname='text' and $class='GtkStyle')">
<xsl:text>gtk.gtkstyle.property.text</xsl:text>
</xsl:when>
<xsl:when test="($propname='base' and $class='no') or ($propname='base' and $class='GtkStyle')">
<xsl:text>gtk.gtkstyle.property.base</xsl:text>
</xsl:when>
<xsl:when test="($propname='fg_gc' and $class='no') or ($propname='fg_gc' and $class='GtkStyle')">
<xsl:text>gtk.gtkstyle.property.fg_gc</xsl:text>
</xsl:when>
<xsl:when test="($propname='bg_gc' and $class='no') or ($propname='bg_gc' and $class='GtkStyle')">
<xsl:text>gtk.gtkstyle.property.bg_gc</xsl:text>
</xsl:when>
<xsl:when test="($propname='light_gc' and $class='no') or ($propname='light_gc' and $class='GtkStyle')">
<xsl:text>gtk.gtkstyle.property.light_gc</xsl:text>
</xsl:when>
<xsl:when test="($propname='dark_gc' and $class='no') or ($propname='dark_gc' and $class='GtkStyle')">
<xsl:text>gtk.gtkstyle.property.dark_gc</xsl:text>
</xsl:when>
<xsl:when test="($propname='mid_gc' and $class='no') or ($propname='mid_gc' and $class='GtkStyle')">
<xsl:text>gtk.gtkstyle.property.mid_gc</xsl:text>
</xsl:when>
<xsl:when test="($propname='text_gc' and $class='no') or ($propname='text_gc' and $class='GtkStyle')">
<xsl:text>gtk.gtkstyle.property.text_gc</xsl:text>
</xsl:when>
<xsl:when test="($propname='base_gc' and $class='no') or ($propname='base_gc' and $class='GtkStyle')">
<xsl:text>gtk.gtkstyle.property.base_gc</xsl:text>
</xsl:when>
<xsl:when test="($propname='bg_pixmap' and $class='no') or ($propname='bg_pixmap' and $class='GtkStyle')">
<xsl:text>gtk.gtkstyle.property.bg_pixmap</xsl:text>
</xsl:when>
<xsl:when test="($propname='children' and $class='no') or ($propname='children' and $class='GtkTable')">
<xsl:text>gtk.gtktable.property.children</xsl:text>
</xsl:when>
<xsl:when test="($propname='nrows' and $class='no') or ($propname='nrows' and $class='GtkTable')">
<xsl:text>gtk.gtktable.property.nrows</xsl:text>
</xsl:when>
<xsl:when test="($propname='ncols' and $class='no') or ($propname='ncols' and $class='GtkTable')">
<xsl:text>gtk.gtktable.property.ncols</xsl:text>
</xsl:when>
<xsl:when test="($propname='column_spacing' and $class='no') or ($propname='column_spacing' and $class='GtkTable')">
<xsl:text>gtk.gtktable.property.column_spacing</xsl:text>
</xsl:when>
<xsl:when test="($propname='row_spacing' and $class='no') or ($propname='row_spacing' and $class='GtkTable')">
<xsl:text>gtk.gtktable.property.row_spacing</xsl:text>
</xsl:when>
<xsl:when test="($propname='homogeneous' and $class='no') or ($propname='homogeneous' and $class='GtkTable')">
<xsl:text>gtk.gtktable.property.homogeneous</xsl:text>
</xsl:when>
<xsl:when test="($propname='widget' and $class='no') or ($propname='widget' and $class='GtkTableChild')">
<xsl:text>gtk.gtktablechild.property.widget</xsl:text>
</xsl:when>
<xsl:when test="($propname='left_attach' and $class='no') or ($propname='left_attach' and $class='GtkTableChild')">
<xsl:text>gtk.gtktablechild.property.left_attach</xsl:text>
</xsl:when>
<xsl:when test="($propname='right_attach' and $class='no') or ($propname='right_attach' and $class='GtkTableChild')">
<xsl:text>gtk.gtktablechild.property.right_attach</xsl:text>
</xsl:when>
<xsl:when test="($propname='top_attach' and $class='no') or ($propname='top_attach' and $class='GtkTableChild')">
<xsl:text>gtk.gtktablechild.property.top_attach</xsl:text>
</xsl:when>
<xsl:when test="($propname='bottom_attach' and $class='no') or ($propname='bottom_attach' and $class='GtkTableChild')">
<xsl:text>gtk.gtktablechild.property.bottom_attach</xsl:text>
</xsl:when>
<xsl:when test="($propname='xpadding' and $class='no') or ($propname='xpadding' and $class='GtkTableChild')">
<xsl:text>gtk.gtktablechild.property.xpadding</xsl:text>
</xsl:when>
<xsl:when test="($propname='ypadding' and $class='no') or ($propname='ypadding' and $class='GtkTableChild')">
<xsl:text>gtk.gtktablechild.property.ypadding</xsl:text>
</xsl:when>
<xsl:when test="($propname='xexpand' and $class='no') or ($propname='xexpand' and $class='GtkTableChild')">
<xsl:text>gtk.gtktablechild.property.xexpand</xsl:text>
</xsl:when>
<xsl:when test="($propname='yexpand' and $class='no') or ($propname='yexpand' and $class='GtkTableChild')">
<xsl:text>gtk.gtktablechild.property.yexpand</xsl:text>
</xsl:when>
<xsl:when test="($propname='xshrink' and $class='no') or ($propname='xshrink' and $class='GtkTableChild')">
<xsl:text>gtk.gtktablechild.property.xshrink</xsl:text>
</xsl:when>
<xsl:when test="($propname='yshrink' and $class='no') or ($propname='yshrink' and $class='GtkTableChild')">
<xsl:text>gtk.gtktablechild.property.yshrink</xsl:text>
</xsl:when>
<xsl:when test="($propname='xfill' and $class='no') or ($propname='xfill' and $class='GtkTableChild')">
<xsl:text>gtk.gtktablechild.property.xfill</xsl:text>
</xsl:when>
<xsl:when test="($propname='yfill' and $class='no') or ($propname='yfill' and $class='GtkTableChild')">
<xsl:text>gtk.gtktablechild.property.yfill</xsl:text>
</xsl:when>
<xsl:when test="($propname='hadj' and $class='no') or ($propname='hadj' and $class='GtkText')">
<xsl:text>gtk.gtktext.property.hadj</xsl:text>
</xsl:when>
<xsl:when test="($propname='vadj' and $class='no') or ($propname='vadj' and $class='GtkText')">
<xsl:text>gtk.gtktext.property.vadj</xsl:text>
</xsl:when>
<xsl:when test="($propname='draw_indicator' and $class='no') or ($propname='draw_indicator' and $class='GtkToggleButton')">
<xsl:text>gtk.gtktogglebutton.property.draw_indicator</xsl:text>
</xsl:when>
<xsl:when test="($propname='style' and $class='no') or ($propname='style' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.property.style</xsl:text>
</xsl:when>
<xsl:when test="($propname='window' and $class='no') or ($propname='window' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.property.window</xsl:text>
</xsl:when>
<xsl:when test="($propname='allocation' and $class='no') or ($propname='allocation' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.property.allocation</xsl:text>
</xsl:when>
<xsl:when test="($propname='state' and $class='no') or ($propname='state' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.property.state</xsl:text>
</xsl:when>
<xsl:when test="($propname='parent' and $class='no') or ($propname='parent' and $class='GtkWidget')">
<xsl:text>gtk.gtkwidget.property.parent</xsl:text>
</xsl:when>
<xsl:when test="($propname='type' and $class='no') or ($propname='type' and $class='GdkCursor')">
<xsl:text>gdk.gdkcursor.property.type</xsl:text>
</xsl:when>
<xsl:when test="($propname='name' and $class='no') or ($propname='name' and $class='GdkCursor')">
<xsl:text>gdk.gdkcursor.property.name</xsl:text>
</xsl:when>
<xsl:when test="($propname='protocol' and $class='no') or ($propname='protocol' and $class='GdkDragContext')">
<xsl:text>gdk.gdkdragcontext.property.protocol</xsl:text>
</xsl:when>
<xsl:when test="($propname='is_source' and $class='no') or ($propname='is_source' and $class='GdkDragContext')">
<xsl:text>gdk.gdkdragcontext.property.is_source</xsl:text>
</xsl:when>
<xsl:when test="($propname='source_window' and $class='no') or ($propname='source_window' and $class='GdkDragContext')">
<xsl:text>gdk.gdkdragcontext.property.source_window</xsl:text>
</xsl:when>
<xsl:when test="($propname='dest_window' and $class='no') or ($propname='dest_window' and $class='GdkDragContext')">
<xsl:text>gdk.gdkdragcontext.property.dest_window</xsl:text>
</xsl:when>
<xsl:when test="($propname='targets' and $class='no') or ($propname='targets' and $class='GdkDragContext')">
<xsl:text>gdk.gdkdragcontext.property.targets</xsl:text>
</xsl:when>
<xsl:when test="($propname='actions' and $class='no') or ($propname='actions' and $class='GdkDragContext')">
<xsl:text>gdk.gdkdragcontext.property.actions</xsl:text>
</xsl:when>
<xsl:when test="($propname='suggested_action' and $class='no') or ($propname='suggested_action' and $class='GdkDragContext')">
<xsl:text>gdk.gdkdragcontext.property.suggested_action</xsl:text>
</xsl:when>
<xsl:when test="($propname='action' and $class='no') or ($propname='action' and $class='GdkDragContext')">
<xsl:text>gdk.gdkdragcontext.property.action</xsl:text>
</xsl:when>
<xsl:when test="($propname='start_time' and $class='no') or ($propname='start_time' and $class='GdkDragContext')">
<xsl:text>gdk.gdkdragcontext.property.start_time</xsl:text>
</xsl:when>
<xsl:when test="($propname='type' and $class='no') or ($propname='type' and $class='GdkFont')">
<xsl:text>gdk.gdkfont.property.type</xsl:text>
</xsl:when>
<xsl:when test="($propname='ascent' and $class='no') or ($propname='ascent' and $class='GdkFont')">
<xsl:text>gdk.gdkfont.property.ascent</xsl:text>
</xsl:when>
<xsl:when test="($propname='descent' and $class='no') or ($propname='descent' and $class='GdkFont')">
<xsl:text>gdk.gdkfont.property.descent</xsl:text>
</xsl:when>
<xsl:when test="($propname='foreground' and $class='no') or ($propname='foreground' and $class='GdkGC')">
<xsl:text>gdk.gdkgc.property.foreground</xsl:text>
</xsl:when>
<xsl:when test="($propname='background' and $class='no') or ($propname='background' and $class='GdkGC')">
<xsl:text>gdk.gdkgc.property.background</xsl:text>
</xsl:when>
<xsl:when test="($propname='font' and $class='no') or ($propname='font' and $class='GdkGC')">
<xsl:text>gdk.gdkgc.property.font</xsl:text>
</xsl:when>
<xsl:when test="($propname='function' and $class='no') or ($propname='function' and $class='GdkGC')">
<xsl:text>gdk.gdkgc.property.function</xsl:text>
</xsl:when>
<xsl:when test="($propname='fill' and $class='no') or ($propname='fill' and $class='GdkGC')">
<xsl:text>gdk.gdkgc.property.fill</xsl:text>
</xsl:when>
<xsl:when test="($propname='tile' and $class='no') or ($propname='tile' and $class='GdkGC')">
<xsl:text>gdk.gdkgc.property.tile</xsl:text>
</xsl:when>
<xsl:when test="($propname='stipple' and $class='no') or ($propname='stipple' and $class='GdkGC')">
<xsl:text>gdk.gdkgc.property.stipple</xsl:text>
</xsl:when>
<xsl:when test="($propname='clip_mask' and $class='no') or ($propname='clip_mask' and $class='GdkGC')">
<xsl:text>gdk.gdkgc.property.clip_mask</xsl:text>
</xsl:when>
<xsl:when test="($propname='subwindow_mode' and $class='no') or ($propname='subwindow_mode' and $class='GdkGC')">
<xsl:text>gdk.gdkgc.property.subwindow_mode</xsl:text>
</xsl:when>
<xsl:when test="($propname='ts_x_origin' and $class='no') or ($propname='ts_x_origin' and $class='GdkGC')">
<xsl:text>gdk.gdkgc.property.ts_x_origin</xsl:text>
</xsl:when>
<xsl:when test="($propname='ts_y_origin' and $class='no') or ($propname='ts_y_origin' and $class='GdkGC')">
<xsl:text>gdk.gdkgc.property.ts_y_origin</xsl:text>
</xsl:when>
<xsl:when test="($propname='clip_x_origin' and $class='no') or ($propname='clip_x_origin' and $class='GdkGC')">
<xsl:text>gdk.gdkgc.property.clip_x_origin</xsl:text>
</xsl:when>
<xsl:when test="($propname='clip_y_origin' and $class='no') or ($propname='clip_y_origin' and $class='GdkGC')">
<xsl:text>gdk.gdkgc.property.clip_y_origin</xsl:text>
</xsl:when>
<xsl:when test="($propname='graphics_exposures' and $class='no') or ($propname='graphics_exposures' and $class='GdkGC')">
<xsl:text>gdk.gdkgc.property.graphics_exposures</xsl:text>
</xsl:when>
<xsl:when test="($propname='line_width' and $class='no') or ($propname='line_width' and $class='GdkGC')">
<xsl:text>gdk.gdkgc.property.line_width</xsl:text>
</xsl:when>
<xsl:when test="($propname='line_style' and $class='no') or ($propname='line_style' and $class='GdkGC')">
<xsl:text>gdk.gdkgc.property.line_style</xsl:text>
</xsl:when>
<xsl:when test="($propname='cap_style' and $class='no') or ($propname='cap_style' and $class='GdkGC')">
<xsl:text>gdk.gdkgc.property.cap_style</xsl:text>
</xsl:when>
<xsl:when test="($propname='join_style' and $class='no') or ($propname='join_style' and $class='GdkGC')">
<xsl:text>gdk.gdkgc.property.join_style</xsl:text>
</xsl:when>
<xsl:when test="($propname='type' and $class='no') or ($propname='type' and $class='GdkVisual')">
<xsl:text>gdk.gdkvisual.property.type</xsl:text>
</xsl:when>
<xsl:when test="($propname='depth' and $class='no') or ($propname='depth' and $class='GdkVisual')">
<xsl:text>gdk.gdkvisual.property.depth</xsl:text>
</xsl:when>
<xsl:when test="($propname='byte_order' and $class='no') or ($propname='byte_order' and $class='GdkVisual')">
<xsl:text>gdk.gdkvisual.property.byte_order</xsl:text>
</xsl:when>
<xsl:when test="($propname='colormap_size' and $class='no') or ($propname='colormap_size' and $class='GdkVisual')">
<xsl:text>gdk.gdkvisual.property.colormap_size</xsl:text>
</xsl:when>
<xsl:when test="($propname='bits_per_rgb' and $class='no') or ($propname='bits_per_rgb' and $class='GdkVisual')">
<xsl:text>gdk.gdkvisual.property.bits_per_rgb</xsl:text>
</xsl:when>
<xsl:when test="($propname='red_mask' and $class='no') or ($propname='red_mask' and $class='GdkVisual')">
<xsl:text>gdk.gdkvisual.property.red_mask</xsl:text>
</xsl:when>
<xsl:when test="($propname='red_shift' and $class='no') or ($propname='red_shift' and $class='GdkVisual')">
<xsl:text>gdk.gdkvisual.property.red_shift</xsl:text>
</xsl:when>
<xsl:when test="($propname='red_prec' and $class='no') or ($propname='red_prec' and $class='GdkVisual')">
<xsl:text>gdk.gdkvisual.property.red_prec</xsl:text>
</xsl:when>
<xsl:when test="($propname='green_mask' and $class='no') or ($propname='green_mask' and $class='GdkVisual')">
<xsl:text>gdk.gdkvisual.property.green_mask</xsl:text>
</xsl:when>
<xsl:when test="($propname='green_shift' and $class='no') or ($propname='green_shift' and $class='GdkVisual')">
<xsl:text>gdk.gdkvisual.property.green_shift</xsl:text>
</xsl:when>
<xsl:when test="($propname='green_prec' and $class='no') or ($propname='green_prec' and $class='GdkVisual')">
<xsl:text>gdk.gdkvisual.property.green_prec</xsl:text>
</xsl:when>
<xsl:when test="($propname='blue_mask' and $class='no') or ($propname='blue_mask' and $class='GdkVisual')">
<xsl:text>gdk.gdkvisual.property.blue_mask</xsl:text>
</xsl:when>
<xsl:when test="($propname='blue_shift' and $class='no') or ($propname='blue_shift' and $class='GdkVisual')">
<xsl:text>gdk.gdkvisual.property.blue_shift</xsl:text>
</xsl:when>
<xsl:when test="($propname='blue_prec' and $class='no') or ($propname='blue_prec' and $class='GdkVisual')">
<xsl:text>gdk.gdkvisual.property.blue_prec</xsl:text>
</xsl:when>
<xsl:when test="($propname='width' and $class='no') or ($propname='width' and $class='GdkWindow')">
<xsl:text>gdk.gdkwindow.property.width</xsl:text>
</xsl:when>
<xsl:when test="($propname='height' and $class='no') or ($propname='height' and $class='GdkWindow')">
<xsl:text>gdk.gdkwindow.property.height</xsl:text>
</xsl:when>
<xsl:when test="($propname='x' and $class='no') or ($propname='x' and $class='GdkWindow')">
<xsl:text>gdk.gdkwindow.property.x</xsl:text>
</xsl:when>
<xsl:when test="($propname='y' and $class='no') or ($propname='y' and $class='GdkWindow')">
<xsl:text>gdk.gdkwindow.property.y</xsl:text>
</xsl:when>
<xsl:when test="($propname='colormap' and $class='no') or ($propname='colormap' and $class='GdkWindow')">
<xsl:text>gdk.gdkwindow.property.colormap</xsl:text>
</xsl:when>
<xsl:when test="($propname='pointer' and $class='no') or ($propname='pointer' and $class='GdkWindow')">
<xsl:text>gdk.gdkwindow.property.pointer</xsl:text>
</xsl:when>
<xsl:when test="($propname='pointer_state' and $class='no') or ($propname='pointer_state' and $class='GdkWindow')">
<xsl:text>gdk.gdkwindow.property.pointer_state</xsl:text>
</xsl:when>
<xsl:when test="($propname='parent' and $class='no') or ($propname='parent' and $class='GdkWindow')">
<xsl:text>gdk.gdkwindow.property.parent</xsl:text>
</xsl:when>
<xsl:when test="($propname='toplevel' and $class='no') or ($propname='toplevel' and $class='GdkWindow')">
<xsl:text>gdk.gdkwindow.property.toplevel</xsl:text>
</xsl:when>
<xsl:when test="($propname='children' and $class='no') or ($propname='children' and $class='GdkWindow')">
<xsl:text>gdk.gdkwindow.property.children</xsl:text>
</xsl:when>
<xsl:when test="($propname='type' and $class='no') or ($propname='type' and $class='GdkWindow')">
<xsl:text>gdk.gdkwindow.property.type</xsl:text>
</xsl:when>
<xsl:when test="($propname='depth' and $class='no') or ($propname='depth' and $class='GdkWindow')">
<xsl:text>gdk.gdkwindow.property.depth</xsl:text>
</xsl:when>
<xsl:when test="($propname='xid' and $class='no') or ($propname='xid' and $class='GdkWindow')">
<xsl:text>gdk.gdkwindow.property.xid</xsl:text>
</xsl:when>


  <xsl:otherwise>

   <xsl:text>no</xsl:text>

  </xsl:otherwise>

  </xsl:choose>

  </xsl:template>

 
  <xsl:template name="get_sig_id_from_name">

  <xsl:param name="signame" />

  
    <xsl:choose>

   <xsl:when test="$signame='changed'">
<xsl:text>gtk.gtkadjustment.signal.changed</xsl:text>
</xsl:when>
<xsl:when test="$signame='value_changed'">
<xsl:text>gtk.gtkadjustment.signal.value_changed</xsl:text>
</xsl:when>
<xsl:when test="$signame='enter'">
<xsl:text>gtk.gtkbutton.signal.enter</xsl:text>
</xsl:when>
<xsl:when test="$signame='pressed'">
<xsl:text>gtk.gtkbutton.signal.pressed</xsl:text>
</xsl:when>
<xsl:when test="$signame='clicked'">
<xsl:text>gtk.gtkbutton.signal.clicked</xsl:text>
</xsl:when>
<xsl:when test="$signame='released'">
<xsl:text>gtk.gtkbutton.signal.released</xsl:text>
</xsl:when>
<xsl:when test="$signame='leave'">
<xsl:text>gtk.gtkbutton.signal.leave</xsl:text>
</xsl:when>
<xsl:when test="$signame='month-changed'">
<xsl:text>gtk.gtkcalendar.signal.month-changed</xsl:text>
</xsl:when>
<xsl:when test="$signame='day-selected'">
<xsl:text>gtk.gtkcalendar.signal.day-selected</xsl:text>
</xsl:when>
<xsl:when test="$signame='day-selected-double-click'">
<xsl:text>gtk.gtkcalendar.signal.day-selected-double-click</xsl:text>
</xsl:when>
<xsl:when test="$signame='prev-month'">
<xsl:text>gtk.gtkcalendar.signal.prev-month</xsl:text>
</xsl:when>
<xsl:when test="$signame='next-month'">
<xsl:text>gtk.gtkcalendar.signal.next-month</xsl:text>
</xsl:when>
<xsl:when test="$signame='prev-year'">
<xsl:text>gtk.gtkcalendar.signal.prev-year</xsl:text>
</xsl:when>
<xsl:when test="$signame='next-year'">
<xsl:text>gtk.gtkcalendar.signal.next-year</xsl:text>
</xsl:when>
<xsl:when test="$signame='toggled'">
<xsl:text>gtk.gtkcheckmenuitem.signal.toggled</xsl:text>
</xsl:when>
<xsl:when test="$signame='add'">
<xsl:text>gtk.gtkcontainer.signal.add</xsl:text>
</xsl:when>
<xsl:when test="$signame='remove'">
<xsl:text>gtk.gtkcontainer.signal.remove</xsl:text>
</xsl:when>
<xsl:when test="$signame='check-resize'">
<xsl:text>gtk.gtkcontainer.signal.check-resize</xsl:text>
</xsl:when>
<xsl:when test="$signame='focus'">
<xsl:text>gtk.gtkcontainer.signal.focus</xsl:text>
</xsl:when>
<xsl:when test="$signame='set-focus-child'">
<xsl:text>gtk.gtkcontainer.signal.set-focus-child</xsl:text>
</xsl:when>
<xsl:when test="$signame='disconnect'">
<xsl:text>gtk.gtkdata.signal.disconnect</xsl:text>
</xsl:when>
<xsl:when test="$signame='changed'">
<xsl:text>gtk.gtkeditable.signal.changed</xsl:text>
</xsl:when>
<xsl:when test="$signame='insert-text'">
<xsl:text>gtk.gtkeditable.signal.insert-text</xsl:text>
</xsl:when>
<xsl:when test="$signame='delete-text'">
<xsl:text>gtk.gtkeditable.signal.delete-text</xsl:text>
</xsl:when>
<xsl:when test="$signame='activate'">
<xsl:text>gtk.gtkeditable.signal.activate</xsl:text>
</xsl:when>
<xsl:when test="$signame='set-editable'">
<xsl:text>gtk.gtkeditable.signal.set-editable</xsl:text>
</xsl:when>
<xsl:when test="$signame='cut-clipboard'">
<xsl:text>gtk.gtkeditable.signal.cut-clipboard</xsl:text>
</xsl:when>
<xsl:when test="$signame='copy-clipboard'">
<xsl:text>gtk.gtkeditable.signal.copy-clipboard</xsl:text>
</xsl:when>
<xsl:when test="$signame='paste-clipboard'">
<xsl:text>gtk.gtkeditable.signal.paste-clipboard</xsl:text>
</xsl:when>
<xsl:when test="$signame='select'">
<xsl:text>gtk.gtkitem.signal.select</xsl:text>
</xsl:when>
<xsl:when test="$signame='deselect'">
<xsl:text>gtk.gtkitem.signal.deselect</xsl:text>
</xsl:when>
<xsl:when test="$signame='toggle'">
<xsl:text>gtk.gtkitem.signal.toggle</xsl:text>
</xsl:when>
<xsl:when test="$signame='selection-changed'">
<xsl:text>gtk.gtklist.signal.selection-changed</xsl:text>
</xsl:when>
<xsl:when test="$signame='select-child'">
<xsl:text>gtk.gtklist.signal.select-child</xsl:text>
</xsl:when>
<xsl:when test="$signame='unselect-child'">
<xsl:text>gtk.gtklist.signal.unselect-child</xsl:text>
</xsl:when>
<xsl:when test="$signame='activate'">
<xsl:text>gtk.gtkmenuitem.signal.activate</xsl:text>
</xsl:when>
<xsl:when test="$signame='activate-item'">
<xsl:text>gtk.gtkmenuitem.signal.activate-item</xsl:text>
</xsl:when>
<xsl:when test="$signame='deactivate'">
<xsl:text>gtk.gtkmenushell.signal.deactivate</xsl:text>
</xsl:when>
<xsl:when test="$signame='selection-done'">
<xsl:text>gtk.gtkmenushell.signal.selection-done</xsl:text>
</xsl:when>
<xsl:when test="$signame='cancel'">
<xsl:text>gtk.gtkmenushell.signal.cancel</xsl:text>
</xsl:when>
<xsl:when test="$signame='text-pushed'">
<xsl:text>gtk.gtkstatusbar.signal.text-pushed</xsl:text>
</xsl:when>
<xsl:when test="$signame='text-popped'">
<xsl:text>gtk.gtkstatusbar.signal.text-popped</xsl:text>
</xsl:when>
<xsl:when test="$signame='toggled'">
<xsl:text>gtk.gtktogglebutton.signal.toggled</xsl:text>
</xsl:when>
<xsl:when test="$signame='show'">
<xsl:text>gtk.gtkwidget.signal.show</xsl:text>
</xsl:when>
<xsl:when test="$signame='hide'">
<xsl:text>gtk.gtkwidget.signal.hide</xsl:text>
</xsl:when>
<xsl:when test="$signame='map'">
<xsl:text>gtk.gtkwidget.signal.map</xsl:text>
</xsl:when>
<xsl:when test="$signame='unmap'">
<xsl:text>gtk.gtkwidget.signal.unmap</xsl:text>
</xsl:when>
<xsl:when test="$signame='realize'">
<xsl:text>gtk.gtkwidget.signal.realize</xsl:text>
</xsl:when>
<xsl:when test="$signame='unrealize'">
<xsl:text>gtk.gtkwidget.signal.unrealize</xsl:text>
</xsl:when>
<xsl:when test="$signame='draw'">
<xsl:text>gtk.gtkwidget.signal.draw</xsl:text>
</xsl:when>
<xsl:when test="$signame='draw-focus'">
<xsl:text>gtk.gtkwidget.signal.draw-focus</xsl:text>
</xsl:when>
<xsl:when test="$signame='draw-default'">
<xsl:text>gtk.gtkwidget.signal.draw-default</xsl:text>
</xsl:when>
<xsl:when test="$signame='size-request'">
<xsl:text>gtk.gtkwidget.signal.size-request</xsl:text>
</xsl:when>
<xsl:when test="$signame='size-allocate'">
<xsl:text>gtk.gtkwidget.signal.size-allocate</xsl:text>
</xsl:when>
<xsl:when test="$signame='state-changed'">
<xsl:text>gtk.gtkwidget.signal.state-changed</xsl:text>
</xsl:when>
<xsl:when test="$signame='parent-set'">
<xsl:text>gtk.gtkwidget.signal.parent-set</xsl:text>
</xsl:when>
<xsl:when test="$signame='style-set'">
<xsl:text>gtk.gtkwidget.signal.style-set</xsl:text>
</xsl:when>
<xsl:when test="$signame='add-accelerator'">
<xsl:text>gtk.gtkwidget.signal.add-accelerator</xsl:text>
</xsl:when>
<xsl:when test="$signame='remove-accelerator'">
<xsl:text>gtk.gtkwidget.signal.remove-accelerator</xsl:text>
</xsl:when>
<xsl:when test="$signame='grab-focus'">
<xsl:text>gtk.gtkwidget.signal.grab-focus</xsl:text>
</xsl:when>
<xsl:when test="$signame='event'">
<xsl:text>gtk.gtkwidget.signal.event</xsl:text>
</xsl:when>
<xsl:when test="$signame='button-press-event'">
<xsl:text>gtk.gtkwidget.signal.button-press-event</xsl:text>
</xsl:when>
<xsl:when test="$signame='button-release-event'">
<xsl:text>gtk.gtkwidget.signal.button-release-event</xsl:text>
</xsl:when>
<xsl:when test="$signame='motion-notify-event'">
<xsl:text>gtk.gtkwidget.signal.motion-notify-event</xsl:text>
</xsl:when>
<xsl:when test="$signame='delete-event'">
<xsl:text>gtk.gtkwidget.signal.delete-event</xsl:text>
</xsl:when>
<xsl:when test="$signame='destroy-event'">
<xsl:text>gtk.gtkwidget.signal.destroy-event</xsl:text>
</xsl:when>
<xsl:when test="$signame='expose-event'">
<xsl:text>gtk.gtkwidget.signal.expose-event</xsl:text>
</xsl:when>
<xsl:when test="$signame='key-press-event'">
<xsl:text>gtk.gtkwidget.signal.key-press-event</xsl:text>
</xsl:when>
<xsl:when test="$signame='key-release-event'">
<xsl:text>gtk.gtkwidget.signal.key-release-event</xsl:text>
</xsl:when>
<xsl:when test="$signame='enter-notify-event'">
<xsl:text>gtk.gtkwidget.signal.enter-notify-event</xsl:text>
</xsl:when>
<xsl:when test="$signame='leave-notify-event'">
<xsl:text>gtk.gtkwidget.signal.leave-notify-event</xsl:text>
</xsl:when>
<xsl:when test="$signame='configure-event'">
<xsl:text>gtk.gtkwidget.signal.configure-event</xsl:text>
</xsl:when>
<xsl:when test="$signame='focus-in-event'">
<xsl:text>gtk.gtkwidget.signal.focus-in-event</xsl:text>
</xsl:when>
<xsl:when test="$signame='focus-out-event'">
<xsl:text>gtk.gtkwidget.signal.focus-out-event</xsl:text>
</xsl:when>
<xsl:when test="$signame='map-event'">
<xsl:text>gtk.gtkwidget.signal.map-event</xsl:text>
</xsl:when>
<xsl:when test="$signame='unmap-event'">
<xsl:text>gtk.gtkwidget.signal.unmap-event</xsl:text>
</xsl:when>
<xsl:when test="$signame='property-notify-event'">
<xsl:text>gtk.gtkwidget.signal.property-notify-event</xsl:text>
</xsl:when>
<xsl:when test="$signame='selection-clear-event'">
<xsl:text>gtk.gtkwidget.signal.selection-clear-event</xsl:text>
</xsl:when>
<xsl:when test="$signame='selection-request-event'">
<xsl:text>gtk.gtkwidget.signal.selection-request-event</xsl:text>
</xsl:when>
<xsl:when test="$signame='selection-notify-event'">
<xsl:text>gtk.gtkwidget.signal.selection-notify-event</xsl:text>
</xsl:when>
<xsl:when test="$signame='selection-received'">
<xsl:text>gtk.gtkwidget.signal.selection-received</xsl:text>
</xsl:when>
<xsl:when test="$signame='selection-get'">
<xsl:text>gtk.gtkwidget.signal.selection-get</xsl:text>
</xsl:when>
<xsl:when test="$signame='proximity-in-event'">
<xsl:text>gtk.gtkwidget.signal.proximity-in-event</xsl:text>
</xsl:when>
<xsl:when test="$signame='proximity-out-event'">
<xsl:text>gtk.gtkwidget.signal.proximity-out-event</xsl:text>
</xsl:when>
<xsl:when test="$signame='drag-leave'">
<xsl:text>gtk.gtkwidget.signal.drag-leave</xsl:text>
</xsl:when>
<xsl:when test="$signame='drag-begin'">
<xsl:text>gtk.gtkwidget.signal.drag-begin</xsl:text>
</xsl:when>
<xsl:when test="$signame='drag-end'">
<xsl:text>gtk.gtkwidget.signal.drag-end</xsl:text>
</xsl:when>
<xsl:when test="$signame='drag-data-delete'">
<xsl:text>gtk.gtkwidget.signal.drag-data-delete</xsl:text>
</xsl:when>
<xsl:when test="$signame='drag-motion'">
<xsl:text>gtk.gtkwidget.signal.drag-motion</xsl:text>
</xsl:when>
<xsl:when test="$signame='drag-drop'">
<xsl:text>gtk.gtkwidget.signal.drag-drop</xsl:text>
</xsl:when>
<xsl:when test="$signame='drag-data-get'">
<xsl:text>gtk.gtkwidget.signal.drag-data-get</xsl:text>
</xsl:when>
<xsl:when test="$signame='drag-data-received'">
<xsl:text>gtk.gtkwidget.signal.drag-data-received</xsl:text>
</xsl:when>
<xsl:when test="$signame='visibility-notify-event'">
<xsl:text>gtk.gtkwidget.signal.visibility-notify-event</xsl:text>
</xsl:when>
<xsl:when test="$signame='client-event'">
<xsl:text>gtk.gtkwidget.signal.client-event</xsl:text>
</xsl:when>
<xsl:when test="$signame='no-expose-event'">
<xsl:text>gtk.gtkwidget.signal.no-expose-event</xsl:text>
</xsl:when>
<xsl:when test="$signame='debug-msg'">
<xsl:text>gtk.gtkwidget.signal.debug-msg</xsl:text>
</xsl:when>
<xsl:when test="$signame='set-focus'">
<xsl:text>gtk.gtkwindow.signal.set-focus</xsl:text>
</xsl:when>


   <xsl:otherwise>

  
  <xsl:text>no</xsl:text>

 
  </xsl:otherwise>

  </xsl:choose>
 
 
   </xsl:template>

   </xsl:stylesheet>
 