
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
<xsl:when test="$classname='GtkStatusBar'">
<xsl:text>gtk.gtkstatusbar</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkStyle'">
<xsl:text>gtk.gtkstyle</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkTable'">
<xsl:text>gtk.gtktable</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkTipsQuery'">
<xsl:text>gtk.gtktipsquery</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkTearoffMenuItem'">
<xsl:text>gtk.gtktearoffmenuitem</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkText'">
<xsl:text>gtk.gtktext</xsl:text>
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
<xsl:when test="$classname='GtkVButtonBox'">
<xsl:text>gtk.gtkvbuttonbox</xsl:text>
</xsl:when>
<xsl:when test="$classname='GtkVBox'">
<xsl:text>gtk.gtkvbox</xsl:text>
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


  <xsl:otherwise>

   <xsl:text>no</xsl:text>

  </xsl:otherwise>

  </xsl:choose>

  </xsl:template>

 
  <xsl:template name="get_func_id_from_name">

  <xsl:param name="funcname" />

  <xsl:choose>

 <xsl:when test="$funcname='GtkAccelGroup'">
<xsl:text>gtk.gtkaccelgroup.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='lock'">
<xsl:text>gtk.gtkaccelgroup.method.lock</xsl:text>
</xsl:when>
<xsl:when test="$funcname='unlock'">
<xsl:text>gtk.gtkaccelgroup.method.unlock</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkAccelLabel'">
<xsl:text>gtk.gtkaccellabel.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_accel_width'">
<xsl:text>gtk.gtkaccellabel.method.get_accel_width</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_accel_widget'">
<xsl:text>gtk.gtkaccellabel.method.set_accel_width</xsl:text>
</xsl:when>
<xsl:when test="$funcname='refetch'">
<xsl:text>gtk.gtkaccellabel.method.refetch</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkAdjustment'">
<xsl:text>gtk.gtkadjustment.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='changed'">
<xsl:text>gtk.gtkadjustment.method.changed</xsl:text>
</xsl:when>
<xsl:when test="$funcname='value_changed'">
<xsl:text>gtk.gtkadjustment.method.value_changed</xsl:text>
</xsl:when>
<xsl:when test="$funcname='clamp_page'">
<xsl:text>gtk.gtkadjustment.method.clamp_page</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_value'">
<xsl:text>gtk.gtkadjustment.method.set_value</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkAlignment'">
<xsl:text>gtk.gtkalignment.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set'">
<xsl:text>gtk.gtkalignment.method.set</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkArrow'">
<xsl:text>gtk.gtkarrow.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set'">
<xsl:text>gtk.gtkarrow.method.set</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkAspectFrame'">
<xsl:text>gtk.gtkaspectframe.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set'">
<xsl:text>gtk.gtkaspectframe.method.set</xsl:text>
</xsl:when>
<xsl:when test="$funcname='pack_start'">
<xsl:text>gtk.gtkbox.method.pack_start</xsl:text>
</xsl:when>
<xsl:when test="$funcname='pack_end'">
<xsl:text>gtk.gtkbox.method.pack_end</xsl:text>
</xsl:when>
<xsl:when test="$funcname='pack_start_defaults'">
<xsl:text>gtk.gtkbox.method.pack_start_defaults</xsl:text>
</xsl:when>
<xsl:when test="$funcname='pack_end_defaults'">
<xsl:text>gtk.gtkbox.method.pack_end_defaults</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_homogeneous'">
<xsl:text>gtk.gtkbox.method.set_homogeneous</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_spacing'">
<xsl:text>gtk.gtkbox.method.set_spacing</xsl:text>
</xsl:when>
<xsl:when test="$funcname='reorder_child'">
<xsl:text>gtk.gtkbox.method.reorder_child</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_child_packing'">
<xsl:text>gtk.gtkbox.method.set_child_packing</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkButton'">
<xsl:text>gtk.gtkbutton.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='pressed'">
<xsl:text>gtk.gtkbutton.method.pressed</xsl:text>
</xsl:when>
<xsl:when test="$funcname='released'">
<xsl:text>gtk.gtkbutton.method.released</xsl:text>
</xsl:when>
<xsl:when test="$funcname='clicked'">
<xsl:text>gtk.gtkbutton.method.clicked</xsl:text>
</xsl:when>
<xsl:when test="$funcname='enter'">
<xsl:text>gtk.gtkbutton.method.enter</xsl:text>
</xsl:when>
<xsl:when test="$funcname='leave'">
<xsl:text>gtk.gtkbutton.method.leave</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_relief'">
<xsl:text>gtk.gtkbutton.method.set_relief</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_relief'">
<xsl:text>gtk.gtkbutton.method.get_relief</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_spacing'">
<xsl:text>gtk.gtkbuttonbox.method.get_spacing</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_layout'">
<xsl:text>gtk.gtkbuttonbox.method.get_layout</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_child_size'">
<xsl:text>gtk.gtkbuttonbox.method.get_child_size</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_child_ipadding'">
<xsl:text>gtk.gtkbuttonbox.method.get_child_ipadding</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_spacing'">
<xsl:text>gtk.gtkbuttonbox.method.set_spacing</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_layout'">
<xsl:text>gtk.gtkbuttonbox.method.set_layout</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_spacing'">
<xsl:text>gtk.gtkbuttonbox.method.set_child_size</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_spacing'">
<xsl:text>gtk.gtkbuttonbox.method.set_child_ipadding</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkCalendar'">
<xsl:text>gtk.gtkcalendar.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='select_month'">
<xsl:text>gtk.gtkcalendar.method.select_month</xsl:text>
</xsl:when>
<xsl:when test="$funcname='select_day'">
<xsl:text>gtk.gtkcalendar.method.select_day</xsl:text>
</xsl:when>
<xsl:when test="$funcname='mark_day'">
<xsl:text>gtk.gtkcalendar.method.mark_day</xsl:text>
</xsl:when>
<xsl:when test="$funcname='unmark_day'">
<xsl:text>gtk.gtkcalendar.method.unmark_day</xsl:text>
</xsl:when>
<xsl:when test="$funcname='clear_marks'">
<xsl:text>gtk.gtkcalendar.method.clear_marks</xsl:text>
</xsl:when>
<xsl:when test="$funcname='display_options'">
<xsl:text>gtk.gtkcalendar.method.display_options</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_date'">
<xsl:text>gtk.gtkcalendar.method.get_date</xsl:text>
</xsl:when>
<xsl:when test="$funcname='freeze'">
<xsl:text>gtk.gtkcalendar.method.freeze</xsl:text>
</xsl:when>
<xsl:when test="$funcname='thaw'">
<xsl:text>gtk.gtkcalendar.method.thaw</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkCheckButton'">
<xsl:text>gtk.gtkcheckbutton.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkCheckMenuItem'">
<xsl:text>gtk.gtkcheckmenuitem.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_active'">
<xsl:text>gtk.gtkcheckmenuitem.method.set_active</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_show_toggle'">
<xsl:text>gtk.gtkcheckmenuitem.method.set_show_toggle</xsl:text>
</xsl:when>
<xsl:when test="$funcname='toggled'">
<xsl:text>gtk.gtkcheckmenuitem.method.toggled</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkCList'">
<xsl:text>gtk.gtkclist.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_hadjustment'">
<xsl:text>gtk.gtkclist.method.set_hadjustment</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_vadjustment'">
<xsl:text>gtk.gtkclist.method.set_vadjustment</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_hadjustment'">
<xsl:text>gtk.gtkclist.method.get_hadjustment</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_vadjustment'">
<xsl:text>gtk.gtkclist.method.get_vadjustment</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_shadow_type'">
<xsl:text>gtk.gtkclist.method.set_shadow_type</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_selection_mode'">
<xsl:text>gtk.gtkclist.method.set_selection_mode</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_reorderable'">
<xsl:text>gtk.gtkclist.method.set_reorderable</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_use_drag_icons'">
<xsl:text>gtk.gtkclist.method.set_use_drag_icons</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_button_actions'">
<xsl:text>gtk.gtkclist.method.set_button_actions</xsl:text>
</xsl:when>
<xsl:when test="$funcname='freeze'">
<xsl:text>gtk.gtkclist.method.freeze</xsl:text>
</xsl:when>
<xsl:when test="$funcname='thaw'">
<xsl:text>gtk.gtkclist.method.thaw</xsl:text>
</xsl:when>
<xsl:when test="$funcname='column_titles_show'">
<xsl:text>gtk.gtkclist.method.column_titles_show</xsl:text>
</xsl:when>
<xsl:when test="$funcname='column_titles_hide'">
<xsl:text>gtk.gtkclist.method.column_titles_hide</xsl:text>
</xsl:when>
<xsl:when test="$funcname='column_title_active'">
<xsl:text>gtk.gtkclist.method.column_title_active</xsl:text>
</xsl:when>
<xsl:when test="$funcname='column_title_passive'">
<xsl:text>gtk.gtkclist.method.column_title_passive</xsl:text>
</xsl:when>
<xsl:when test="$funcname='column_titles_active'">
<xsl:text>gtk.gtkclist.method.column_titles_active</xsl:text>
</xsl:when>
<xsl:when test="$funcname='column_titles_passive'">
<xsl:text>gtk.gtkclist.method.column_titles_passive</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_column_title'">
<xsl:text>gtk.gtkclist.method.set_column_title</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_column_title'">
<xsl:text>gtk.gtkclist.method.get_column_title</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_column_widget'">
<xsl:text>gtk.gtkclist.method.set_column_widget</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_column_widget'">
<xsl:text>gtk.gtkclist.method.get_column_widget</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_column_justification'">
<xsl:text>gtk.gtkclist.method.set_column_justification</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_column_visibility'">
<xsl:text>gtk.gtkclist.method.set_column_visibility</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_column_resizeable'">
<xsl:text>gtk.gtkclist.method.set_column_resizeable</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_column_auto_resize'">
<xsl:text>gtk.gtkclist.method.set_column_auto_resize</xsl:text>
</xsl:when>
<xsl:when test="$funcname='columns_autosize'">
<xsl:text>gtk.gtkclist.method.columns_autosize</xsl:text>
</xsl:when>
<xsl:when test="$funcname='optimal_column_width'">
<xsl:text>gtk.gtkclist.method.optimal_column_width</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_column_width'">
<xsl:text>gtk.gtkclist.method.set_column_width</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_column_min_width'">
<xsl:text>gtk.gtkclist.method.set_column_min_width</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_column_max_width'">
<xsl:text>gtk.gtkclist.method.set_column_max_width</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_row_height'">
<xsl:text>gtk.gtkclist.method.set_row_height</xsl:text>
</xsl:when>
<xsl:when test="$funcname='moveto'">
<xsl:text>gtk.gtkclist.method.moveto</xsl:text>
</xsl:when>
<xsl:when test="$funcname='row_is_visible'">
<xsl:text>gtk.gtkclist.method.row_is_visible</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_cell_type'">
<xsl:text>gtk.gtkclist.method.get_cell_type</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_text'">
<xsl:text>gtk.gtkclist.method.set_text</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_text'">
<xsl:text>gtk.gtkclist.method.get_text</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_pixmap'">
<xsl:text>gtk.gtkclist.method.set_pixmap</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_pixtext'">
<xsl:text>gtk.gtkclist.method.set_pixtext</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_foreground'">
<xsl:text>gtk.gtkclist.method.set_foreground</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_background'">
<xsl:text>gtk.gtkclist.method.set_background</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_cell_style'">
<xsl:text>gtk.gtkclist.method.set_cell_style</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_cell_style'">
<xsl:text>gtk.gtkclist.method.get_cell_style</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_row_style'">
<xsl:text>gtk.gtkclist.method.set_row_style</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_row_style'">
<xsl:text>gtk.gtkclist.method.get_row_style</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_shift'">
<xsl:text>gtk.gtkclist.method.set_shift</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_selectable'">
<xsl:text>gtk.gtkclist.method.set_selectable</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_selectable'">
<xsl:text>gtk.gtkclist.method.get_selectable</xsl:text>
</xsl:when>
<xsl:when test="$funcname='prepend'">
<xsl:text>gtk.gtkclist.method.prepend</xsl:text>
</xsl:when>
<xsl:when test="$funcname='append'">
<xsl:text>gtk.gtkclist.method.append</xsl:text>
</xsl:when>
<xsl:when test="$funcname='insert'">
<xsl:text>gtk.gtkclist.method.insert</xsl:text>
</xsl:when>
<xsl:when test="$funcname='remove'">
<xsl:text>gtk.gtkclist.method.remove</xsl:text>
</xsl:when>
<xsl:when test="$funcname='select_row'">
<xsl:text>gtk.gtkclist.method.select_row</xsl:text>
</xsl:when>
<xsl:when test="$funcname='unselect_row'">
<xsl:text>gtk.gtkclist.method.unselect_row</xsl:text>
</xsl:when>
<xsl:when test="$funcname='undo_selection'">
<xsl:text>gtk.gtkclist.method.undo_selection</xsl:text>
</xsl:when>
<xsl:when test="$funcname='clear'">
<xsl:text>gtk.gtkclist.method.clear</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_selection_info'">
<xsl:text>gtk.gtkclist.method.get_selection_info</xsl:text>
</xsl:when>
<xsl:when test="$funcname='select_all'">
<xsl:text>gtk.gtkclist.method.select_all</xsl:text>
</xsl:when>
<xsl:when test="$funcname='unselect_all'">
<xsl:text>gtk.gtkclist.method.unselect_all</xsl:text>
</xsl:when>
<xsl:when test="$funcname='swap_rows'">
<xsl:text>gtk.gtkclist.method.swap_rows</xsl:text>
</xsl:when>
<xsl:when test="$funcname='row_move'">
<xsl:text>gtk.gtkclist.method.row_move</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_sort_column'">
<xsl:text>gtk.gtkclist.method.set_sort_column</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_sort_type'">
<xsl:text>gtk.gtkclist.method.set_sort_type</xsl:text>
</xsl:when>
<xsl:when test="$funcname='sort'">
<xsl:text>gtk.gtkclist.method.sort</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_auto_sort'">
<xsl:text>gtk.gtkclist.method.set_auto_sort</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkColorSelection'">
<xsl:text>gtk.gtkcolorselection.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_update_policy'">
<xsl:text>gtk.gtkcolorselection.method.set_update_policy</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_opacity'">
<xsl:text>gtk.gtkcolorselection.method.set_opacity</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_color'">
<xsl:text>gtk.gtkcolorselection.method.set_color</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_color'">
<xsl:text>gtk.gtkcolorselection.method.get_color</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkColorSelectionDialog'">
<xsl:text>gtk.gtkcolorselectiondialog.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkCombo'">
<xsl:text>gtk.gtkcombo.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_value_in_list'">
<xsl:text>gtk.gtkcombo.method.set_value_in_list</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_use_arrows'">
<xsl:text>gtk.gtkcombo.method.set_use_arrows</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_use_arrows_always'">
<xsl:text>gtk.gtkcombo.method.set_use_arrows_always</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_case_sensitive'">
<xsl:text>gtk.gtkcombo.method.set_case_sensitive</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_item_string'">
<xsl:text>gtk.gtkcombo.method.set_item_string</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_popdown_strings'">
<xsl:text>gtk.gtkcombo.method.set_popdown_strings</xsl:text>
</xsl:when>
<xsl:when test="$funcname='disable_activate'">
<xsl:text>gtk.gtkcombo.method.disable_activate</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_border_width'">
<xsl:text>gtk.gtkcontainer.method.set_border_width</xsl:text>
</xsl:when>
<xsl:when test="$funcname='add'">
<xsl:text>gtk.gtkcontainer.method.add</xsl:text>
</xsl:when>
<xsl:when test="$funcname='remove'">
<xsl:text>gtk.gtkcontainer.method.remove</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_resize_mode'">
<xsl:text>gtk.gtkcontainer.method.set_resize_mode</xsl:text>
</xsl:when>
<xsl:when test="$funcname='check_resize'">
<xsl:text>gtk.gtkcontainer.method.check_resize</xsl:text>
</xsl:when>
<xsl:when test="$funcname='children'">
<xsl:text>gtk.gtkcontainer.method.children</xsl:text>
</xsl:when>
<xsl:when test="$funcname='focus'">
<xsl:text>gtk.gtkcontainer.method.focus</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_reallocate_redraws'">
<xsl:text>gtk.gtkcontainer.method.set_reallocate_redraws</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_focus_child'">
<xsl:text>gtk.gtkcontainer.method.set_focus_child</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_focus_vadjustment'">
<xsl:text>gtk.gtkcontainer.method.set_focus_vadjustment</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_focus_hadjustment'">
<xsl:text>gtk.gtkcontainer.method.set_focus_hadjustment</xsl:text>
</xsl:when>
<xsl:when test="$funcname='register_toplevel'">
<xsl:text>gtk.gtkcontainer.method.register_toplevel</xsl:text>
</xsl:when>
<xsl:when test="$funcname='unregister_toplevel'">
<xsl:text>gtk.gtkcontainer.method.unregister_toplevel</xsl:text>
</xsl:when>
<xsl:when test="$funcname='resize_children'">
<xsl:text>gtk.gtkcontainer.method.resize_children</xsl:text>
</xsl:when>
<xsl:when test="$funcname='child_type'">
<xsl:text>gtk.gtkcontainer.method.child_type</xsl:text>
</xsl:when>
<xsl:when test="$funcname='queue_resize'">
<xsl:text>gtk.gtkcontainer.method.queue_resize</xsl:text>
</xsl:when>
<xsl:when test="$funcname='clear_resize_widgets'">
<xsl:text>gtk.gtkcontainer.method.clear_resize_widgets</xsl:text>
</xsl:when>
<xsl:when test="$funcname='child_composite_name'">
<xsl:text>gtk.gtkcontainer.method.child_composite_name</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkCTree'">
<xsl:text>gtk.gtkctree.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='insert_node'">
<xsl:text>gtk.gtkctree.method.insert_node</xsl:text>
</xsl:when>
<xsl:when test="$funcname='remove_node'">
<xsl:text>gtk.gtkctree.method.remove_node</xsl:text>
</xsl:when>
<xsl:when test="$funcname='is_viewable'">
<xsl:text>gtk.gtkctree.method.is_viewable</xsl:text>
</xsl:when>
<xsl:when test="$funcname='last'">
<xsl:text>gtk.gtkctree.method.last</xsl:text>
</xsl:when>
<xsl:when test="$funcname='node_nth'">
<xsl:text>gtk.gtkctree.method.node_nth</xsl:text>
</xsl:when>
<xsl:when test="$funcname='find'">
<xsl:text>gtk.gtkctree.method.find</xsl:text>
</xsl:when>
<xsl:when test="$funcname='is_ancestor'">
<xsl:text>gtk.gtkctree.method.is_ancestor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='is_hot_spot'">
<xsl:text>gtk.gtkctree.method.is_hot_spot</xsl:text>
</xsl:when>
<xsl:when test="$funcname='move'">
<xsl:text>gtk.gtkctree.method.move</xsl:text>
</xsl:when>
<xsl:when test="$funcname='expand'">
<xsl:text>gtk.gtkctree.method.expand</xsl:text>
</xsl:when>
<xsl:when test="$funcname='expand_recursive'">
<xsl:text>gtk.gtkctree.method.expand_recursive</xsl:text>
</xsl:when>
<xsl:when test="$funcname='expand_to_depth'">
<xsl:text>gtk.gtkctree.method.expand_to_depth</xsl:text>
</xsl:when>
<xsl:when test="$funcname='collapse'">
<xsl:text>gtk.gtkctree.method.collapse</xsl:text>
</xsl:when>
<xsl:when test="$funcname='collapse_recursive'">
<xsl:text>gtk.gtkctree.method.collapse_recursive</xsl:text>
</xsl:when>
<xsl:when test="$funcname='collapse_to_depth'">
<xsl:text>gtk.gtkctree.method.collapse_to_depth</xsl:text>
</xsl:when>
<xsl:when test="$funcname='toggle_expansion'">
<xsl:text>gtk.gtkctree.method.toggle_expansion</xsl:text>
</xsl:when>
<xsl:when test="$funcname='toggle_expansion_recursive'">
<xsl:text>gtk.gtkctree.method.toggle_expansion_recursive</xsl:text>
</xsl:when>
<xsl:when test="$funcname='select'">
<xsl:text>gtk.gtkctree.method.select</xsl:text>
</xsl:when>
<xsl:when test="$funcname='select_recursive'">
<xsl:text>gtk.gtkctree.method.select_recursive</xsl:text>
</xsl:when>
<xsl:when test="$funcname='unselect'">
<xsl:text>gtk.gtkctree.method.unselect</xsl:text>
</xsl:when>
<xsl:when test="$funcname='unselect_recursive'">
<xsl:text>gtk.gtkctree.method.unselect_recursive</xsl:text>
</xsl:when>
<xsl:when test="$funcname='node_set_text'">
<xsl:text>gtk.gtkctree.method.node_set_text</xsl:text>
</xsl:when>
<xsl:when test="$funcname='node_set_pixmap'">
<xsl:text>gtk.gtkctree.method.node_set_pixmap</xsl:text>
</xsl:when>
<xsl:when test="$funcname='node_set_pixtext'">
<xsl:text>gtk.gtkctree.method.node_set_pixtext</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_node_info'">
<xsl:text>gtk.gtkctree.method.set_node_info</xsl:text>
</xsl:when>
<xsl:when test="$funcname='node_set_shift'">
<xsl:text>gtk.gtkctree.method.node_set_shift</xsl:text>
</xsl:when>
<xsl:when test="$funcname='node_set_selectable'">
<xsl:text>gtk.gtkctree.method.node_set_selectable</xsl:text>
</xsl:when>
<xsl:when test="$funcname='node_get_selectable'">
<xsl:text>gtk.gtkctree.method.node_get_selectable</xsl:text>
</xsl:when>
<xsl:when test="$funcname='node_get_cell_type'">
<xsl:text>gtk.gtkctree.method.node_get_cell_type</xsl:text>
</xsl:when>
<xsl:when test="$funcname='node_get_text'">
<xsl:text>gtk.gtkctree.method.node_get_text</xsl:text>
</xsl:when>
<xsl:when test="$funcname='node_set_row_style'">
<xsl:text>gtk.gtkctree.method.node_set_row_style</xsl:text>
</xsl:when>
<xsl:when test="$funcname='node_get_row_style'">
<xsl:text>gtk.gtkctree.method.node_get_row_style</xsl:text>
</xsl:when>
<xsl:when test="$funcname='node_set_cell_style'">
<xsl:text>gtk.gtkctree.method.node_set_cell_style</xsl:text>
</xsl:when>
<xsl:when test="$funcname='node_get_cell_style'">
<xsl:text>gtk.gtkctree.method.node_get_cell_style</xsl:text>
</xsl:when>
<xsl:when test="$funcname='node_set_foreground'">
<xsl:text>gtk.gtkctree.method.node_set_foreground</xsl:text>
</xsl:when>
<xsl:when test="$funcname='node_set_background'">
<xsl:text>gtk.gtkctree.method.node_set_background</xsl:text>
</xsl:when>
<xsl:when test="$funcname='node_set_row_data'">
<xsl:text>gtk.gtkctree.method.node_set_row_data</xsl:text>
</xsl:when>
<xsl:when test="$funcname='node_get_row_data'">
<xsl:text>gtk.gtkctree.method.node_get_row_data</xsl:text>
</xsl:when>
<xsl:when test="$funcname='node_moveto'">
<xsl:text>gtk.gtkctree.method.node_moveto</xsl:text>
</xsl:when>
<xsl:when test="$funcname='node_is_visible'">
<xsl:text>gtk.gtkctree.method.node_is_visible</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_indent'">
<xsl:text>gtk.gtkctree.method.set_indent</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_spacing'">
<xsl:text>gtk.gtkctree.method.set_spacing</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_show_stub'">
<xsl:text>gtk.gtkctree.method.set_show_stub</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_line_style'">
<xsl:text>gtk.gtkctree.method.set_line_style</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_expander_style'">
<xsl:text>gtk.gtkctree.method.set_expander_style</xsl:text>
</xsl:when>
<xsl:when test="$funcname='sort_node'">
<xsl:text>gtk.gtkctree.method.sort_node</xsl:text>
</xsl:when>
<xsl:when test="$funcname='sort_recursive'">
<xsl:text>gtk.gtkctree.method.sort_recursive</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkCurve'">
<xsl:text>gtk.gtkcurve.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='reset'">
<xsl:text>gtk.gtkcurve.method.reset</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_gamma'">
<xsl:text>gtk.gtkcurve.method.set_gamma</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_range'">
<xsl:text>gtk.gtkcurve.method.set_range</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_vector'">
<xsl:text>gtk.gtkcurve.method.get_vector</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_vector'">
<xsl:text>gtk.gtkcurve.method.set_vector</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_curve_type'">
<xsl:text>gtk.gtkcurve.method.set_curve_type</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkDialog'">
<xsl:text>gtk.gtkdialog.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkDrawingArea'">
<xsl:text>gtk.gtkdrawingarea.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='size'">
<xsl:text>gtk.gtkdrawingarea.method.size</xsl:text>
</xsl:when>
<xsl:when test="$funcname='select_region'">
<xsl:text>gtk.gtkeditable.method.select_region</xsl:text>
</xsl:when>
<xsl:when test="$funcname='insert_text'">
<xsl:text>gtk.gtkeditable.method.insert_text</xsl:text>
</xsl:when>
<xsl:when test="$funcname='delete_text'">
<xsl:text>gtk.gtkeditable.method.delete_text</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_chars'">
<xsl:text>gtk.gtkeditable.method.get_chars</xsl:text>
</xsl:when>
<xsl:when test="$funcname='cut_clipboard'">
<xsl:text>gtk.gtkeditable.method.cut_clipboard</xsl:text>
</xsl:when>
<xsl:when test="$funcname='copy_clipboard'">
<xsl:text>gtk.gtkeditable.method.copy_clipboard</xsl:text>
</xsl:when>
<xsl:when test="$funcname='paste_clipboard'">
<xsl:text>gtk.gtkeditable.method.paste_clipboard</xsl:text>
</xsl:when>
<xsl:when test="$funcname='claim_selection'">
<xsl:text>gtk.gtkeditable.method.claim_selection</xsl:text>
</xsl:when>
<xsl:when test="$funcname='delete_selection'">
<xsl:text>gtk.gtkeditable.method.delete_selection</xsl:text>
</xsl:when>
<xsl:when test="$funcname='changed'">
<xsl:text>gtk.gtkeditable.method.changed</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_position'">
<xsl:text>gtk.gtkeditable.method.set_position</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_position'">
<xsl:text>gtk.gtkeditable.method.get_position</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_editable'">
<xsl:text>gtk.gtkeditable.method.set_editable</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkEntry'">
<xsl:text>gtk.gtkentry.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_text'">
<xsl:text>gtk.gtkentry.method.set_text</xsl:text>
</xsl:when>
<xsl:when test="$funcname='append_text'">
<xsl:text>gtk.gtkentry.method.append_text</xsl:text>
</xsl:when>
<xsl:when test="$funcname='prepend_text'">
<xsl:text>gtk.gtkentry.method.prepend_text</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_position'">
<xsl:text>gtk.gtkentry.method.set_position</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_text'">
<xsl:text>gtk.gtkentry.method.get_text</xsl:text>
</xsl:when>
<xsl:when test="$funcname='select_region'">
<xsl:text>gtk.gtkentry.method.select_region</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_visibility'">
<xsl:text>gtk.gtkentry.method.set_visibility</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_editable'">
<xsl:text>gtk.gtkentry.method.set_editable</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_max_length'">
<xsl:text>gtk.gtkentry.method.set_max_length</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkEventBox'">
<xsl:text>gtk.gtkeventbox.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkFileSelection'">
<xsl:text>gtk.gtkfileselection.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_filename'">
<xsl:text>gtk.gtkfileselection.method.set_filename</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_filename'">
<xsl:text>gtk.gtkfileselection.method.get_filename</xsl:text>
</xsl:when>
<xsl:when test="$funcname='complete'">
<xsl:text>gtk.gtkfileselection.method.complete</xsl:text>
</xsl:when>
<xsl:when test="$funcname='show_fileop_buttons'">
<xsl:text>gtk.gtkfileselection.method.show_fileop_buttons</xsl:text>
</xsl:when>
<xsl:when test="$funcname='hide_fileop_buttons'">
<xsl:text>gtk.gtkfileselection.method.hide_fileop_buttons</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkFixed'">
<xsl:text>gtk.gtkfixed.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='put'">
<xsl:text>gtk.gtkfixed.method.put</xsl:text>
</xsl:when>
<xsl:when test="$funcname='move'">
<xsl:text>gtk.gtkfixed.method.move</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkFontSelection'">
<xsl:text>gtk.gtkfontselection.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_font_name'">
<xsl:text>gtk.gtkfontselection.method.get_font_name</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_font'">
<xsl:text>gtk.gtkfontselection.method.get_font</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_font_name'">
<xsl:text>gtk.gtkfontselection.method.set_font_name</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_filter'">
<xsl:text>gtk.gtkfontselection.method.set_filter</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_preview_text'">
<xsl:text>gtk.gtkfontselection.method.get_preview_text</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_preview_text'">
<xsl:text>gtk.gtkfontselection.method.set_preview_text</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkFontSelectionDialog'">
<xsl:text>gtk.gtkfontselectiondialog.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_font_name'">
<xsl:text>gtk.gtkfontselectiondialog.method.get_font_name</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_font'">
<xsl:text>gtk.gtkfontselectiondialog.method.get_font</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_font_name'">
<xsl:text>gtk.gtkfontselectiondialog.method.set_font_name</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_filter'">
<xsl:text>gtk.gtkfontselectiondialog.method.set_filter</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_preview_text'">
<xsl:text>gtk.gtkfontselectiondialog.method.get_preview_text</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_preview_text'">
<xsl:text>gtk.gtkfontselectiondialog.method.set_preview_text</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkFrame'">
<xsl:text>gtk.gtkframe.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_label'">
<xsl:text>gtk.gtkframe.method.set_label</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_label_align'">
<xsl:text>gtk.gtkframe.method.set_label_align</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_shadow_type'">
<xsl:text>gtk.gtkframe.method.set_shadow_type</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkGammaCurve'">
<xsl:text>gtk.gtkgammacurve.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkHandleBox'">
<xsl:text>gtk.gtkhandlebox.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_shadow_type'">
<xsl:text>gtk.gtkhandlebox.method.set_shadow_type</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_handle_position'">
<xsl:text>gtk.gtkhandlebox.method.set_handle_position</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_snap_edge'">
<xsl:text>gtk.gtkhandlebox.method.set_snap_edge</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkHBox'">
<xsl:text>gtk.gtkhbox.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkHButtonBox'">
<xsl:text>gtk.gtkhbuttonbox.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkHPaned'">
<xsl:text>gtk.gtkhpaned.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkHRuler'">
<xsl:text>gtk.gtkhruler.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkHScale'">
<xsl:text>gtk.gtkhscale.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkHScrollbar'">
<xsl:text>gtk.gtkhscrollbar.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkHSeparator'">
<xsl:text>gtk.gtkhseparator.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkInputDialog'">
<xsl:text>gtk.gtkinputdialog.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkInvisible'">
<xsl:text>gtk.gtkinvisible.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='select'">
<xsl:text>gtk.gtkitem.method.select</xsl:text>
</xsl:when>
<xsl:when test="$funcname='deselect'">
<xsl:text>gtk.gtkitem.method.deselect</xsl:text>
</xsl:when>
<xsl:when test="$funcname='toggle'">
<xsl:text>gtk.gtkitem.method.toggle</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkItemFactory'">
<xsl:text>gtk.gtkitemfactory.constructor.construct</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_item'">
<xsl:text>gtk.gtkitemfactory.method.get_item</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_widget'">
<xsl:text>gtk.gtkitemfactory.method.get_widget</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_widget_by_action'">
<xsl:text>gtk.gtkitemfactory.method.get_widget_by_action</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_item_by_action'">
<xsl:text>gtk.gtkitemfactory.method.get_item_by_action</xsl:text>
</xsl:when>
<xsl:when test="$funcname='create_items'">
<xsl:text>gtk.gtkitemfactory.method.create_items</xsl:text>
</xsl:when>
<xsl:when test="$funcname='delete_item'">
<xsl:text>gtk.gtkitemfactory.method.delete_item</xsl:text>
</xsl:when>
<xsl:when test="$funcname='popup'">
<xsl:text>gtk.gtkitemfactory.method.popup</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkLabel'">
<xsl:text>gtk.gtklabel.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_text'">
<xsl:text>gtk.gtklabel.method.set_text</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_justify'">
<xsl:text>gtk.gtklabel.method.set_justify</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_pattern'">
<xsl:text>gtk.gtklabel.method.set_pattern</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_line_wrap'">
<xsl:text>gtk.gtklabel.method.set_line_wrap</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get'">
<xsl:text>gtk.gtklabel.method.get</xsl:text>
</xsl:when>
<xsl:when test="$funcname='parse_uline'">
<xsl:text>gtk.gtklabel.method.parse_uline</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkLayout'">
<xsl:text>gtk.gtklayout.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='put'">
<xsl:text>gtk.gtklayout.method.put</xsl:text>
</xsl:when>
<xsl:when test="$funcname='move'">
<xsl:text>gtk.gtklayout.method.move</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_size'">
<xsl:text>gtk.gtklayout.method.set_size</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_hadjustment'">
<xsl:text>gtk.gtklayout.method.get_hadjustment</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_vadjustment'">
<xsl:text>gtk.gtklayout.method.get_vadjustment</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_hadjustment'">
<xsl:text>gtk.gtklayout.method.set_hadjustment</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_vadjustment'">
<xsl:text>gtk.gtklayout.method.set_vadjustment</xsl:text>
</xsl:when>
<xsl:when test="$funcname='freeze'">
<xsl:text>gtk.gtklayout.method.freeze</xsl:text>
</xsl:when>
<xsl:when test="$funcname='thaw'">
<xsl:text>gtk.gtklayout.method.thaw</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkList'">
<xsl:text>gtk.gtklist.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='append_items'">
<xsl:text>gtk.gtklist.method.append_items</xsl:text>
</xsl:when>
<xsl:when test="$funcname='clear_items'">
<xsl:text>gtk.gtklist.method.clear_items</xsl:text>
</xsl:when>
<xsl:when test="$funcname='select_item'">
<xsl:text>gtk.gtklist.method.select_item</xsl:text>
</xsl:when>
<xsl:when test="$funcname='unselect_item'">
<xsl:text>gtk.gtklist.method.unselect_item</xsl:text>
</xsl:when>
<xsl:when test="$funcname='select_child'">
<xsl:text>gtk.gtklist.method.select_child</xsl:text>
</xsl:when>
<xsl:when test="$funcname='unselect_child'">
<xsl:text>gtk.gtklist.method.unselect_child</xsl:text>
</xsl:when>
<xsl:when test="$funcname='child_position'">
<xsl:text>gtk.gtklist.method.child_position</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_selection_mode'">
<xsl:text>gtk.gtklist.method.set_selection_mode</xsl:text>
</xsl:when>
<xsl:when test="$funcname='extend_selection'">
<xsl:text>gtk.gtklist.method.extend_selection</xsl:text>
</xsl:when>
<xsl:when test="$funcname='start_selection'">
<xsl:text>gtk.gtklist.method.start_selection</xsl:text>
</xsl:when>
<xsl:when test="$funcname='end_selection'">
<xsl:text>gtk.gtklist.method.end_selection</xsl:text>
</xsl:when>
<xsl:when test="$funcname='select_all'">
<xsl:text>gtk.gtklist.method.select_all</xsl:text>
</xsl:when>
<xsl:when test="$funcname='unselect_all'">
<xsl:text>gtk.gtklist.method.unselect_all</xsl:text>
</xsl:when>
<xsl:when test="$funcname='scroll_horizontal'">
<xsl:text>gtk.gtklist.method.scroll_horizontal</xsl:text>
</xsl:when>
<xsl:when test="$funcname='scroll_vertical'">
<xsl:text>gtk.gtklist.method.scroll_vertical</xsl:text>
</xsl:when>
<xsl:when test="$funcname='toggle_add_mode'">
<xsl:text>gtk.gtklist.method.toggle_add_mode</xsl:text>
</xsl:when>
<xsl:when test="$funcname='toggle_focus_row'">
<xsl:text>gtk.gtklist.method.toggle_focus_row</xsl:text>
</xsl:when>
<xsl:when test="$funcname='toggle_row'">
<xsl:text>gtk.gtklist.method.toggle_row</xsl:text>
</xsl:when>
<xsl:when test="$funcname='undo_selection'">
<xsl:text>gtk.gtklist.method.undo_selection</xsl:text>
</xsl:when>
<xsl:when test="$funcname='end_drag_selection'">
<xsl:text>gtk.gtklist.method.end_drag_selection</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkListItem'">
<xsl:text>gtk.gtklistitem.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='select'">
<xsl:text>gtk.gtklistitem.method.select</xsl:text>
</xsl:when>
<xsl:when test="$funcname='deselect'">
<xsl:text>gtk.gtklistitem.method.deselect</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkMenu'">
<xsl:text>gtk.gtkmenu.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='append'">
<xsl:text>gtk.gtkmenu.method.append</xsl:text>
</xsl:when>
<xsl:when test="$funcname='prepend'">
<xsl:text>gtk.gtkmenu.method.prepend</xsl:text>
</xsl:when>
<xsl:when test="$funcname='insert'">
<xsl:text>gtk.gtkmenu.method.insert</xsl:text>
</xsl:when>
<xsl:when test="$funcname='popup'">
<xsl:text>gtk.gtkmenu.method.popup</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_active'">
<xsl:text>gtk.gtkmenu.method.get_active</xsl:text>
</xsl:when>
<xsl:when test="$funcname='popdown'">
<xsl:text>gtk.gtkmenu.method.popdown</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_active'">
<xsl:text>gtk.gtkmenu.method.set_active</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_accel_group'">
<xsl:text>gtk.gtkmenu.method.set_accel_group</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_accel_group'">
<xsl:text>gtk.gtkmenu.method.get_accel_group</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_uline_accel_group'">
<xsl:text>gtk.gtkmenu.method.get_uline_accel_group</xsl:text>
</xsl:when>
<xsl:when test="$funcname='ensure_uline_accel_group'">
<xsl:text>gtk.gtkmenu.method.ensure_uline_accel_group</xsl:text>
</xsl:when>
<xsl:when test="$funcname='attach_to_widget'">
<xsl:text>gtk.gtkmenu.method.attach_to_widget</xsl:text>
</xsl:when>
<xsl:when test="$funcname='detach'">
<xsl:text>gtk.gtkmenu.method.detach</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_attach_widget'">
<xsl:text>gtk.gtkmenu.method.get_attach_widget</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_tearoff_state'">
<xsl:text>gtk.gtkmenu.method.set_tearoff_state</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_title'">
<xsl:text>gtk.gtkmenu.method.set_title</xsl:text>
</xsl:when>
<xsl:when test="$funcname='detach'">
<xsl:text>gtk.gtkmenu.method.reorder_child</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkMenuBar'">
<xsl:text>gtk.gtkmenubar.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='append'">
<xsl:text>gtk.gtkmenubar.method.append</xsl:text>
</xsl:when>
<xsl:when test="$funcname='prepend'">
<xsl:text>gtk.gtkmenubar.method.prepend</xsl:text>
</xsl:when>
<xsl:when test="$funcname='insert'">
<xsl:text>gtk.gtkmenubar.method.insert</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_shadow_type'">
<xsl:text>gtk.gtkmenubar.method.set_shadow_type</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkMenuItem'">
<xsl:text>gtk.gtkmenuitem.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_submenu'">
<xsl:text>gtk.gtkmenuitem.method.set_submenu</xsl:text>
</xsl:when>
<xsl:when test="$funcname='remove_submenu'">
<xsl:text>gtk.gtkmenuitem.method.remove_submenu</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_placement'">
<xsl:text>gtk.gtkmenuitem.method.set_placement</xsl:text>
</xsl:when>
<xsl:when test="$funcname='configure'">
<xsl:text>gtk.gtkmenuitem.method.configure</xsl:text>
</xsl:when>
<xsl:when test="$funcname='select'">
<xsl:text>gtk.gtkmenuitem.method.select</xsl:text>
</xsl:when>
<xsl:when test="$funcname='deselect'">
<xsl:text>gtk.gtkmenuitem.method.deselect</xsl:text>
</xsl:when>
<xsl:when test="$funcname='activate'">
<xsl:text>gtk.gtkmenuitem.method.activate</xsl:text>
</xsl:when>
<xsl:when test="$funcname='right_justify'">
<xsl:text>gtk.gtkmenuitem.method.right_justify</xsl:text>
</xsl:when>
<xsl:when test="$funcname='append'">
<xsl:text>gtk.gtkmenushell.method.append</xsl:text>
</xsl:when>
<xsl:when test="$funcname='prepend'">
<xsl:text>gtk.gtkmenushell.method.prepend</xsl:text>
</xsl:when>
<xsl:when test="$funcname='insert'">
<xsl:text>gtk.gtkmenushell.method.insert</xsl:text>
</xsl:when>
<xsl:when test="$funcname='deactivate'">
<xsl:text>gtk.gtkmenushell.method.deactivate</xsl:text>
</xsl:when>
<xsl:when test="$funcname='select_item'">
<xsl:text>gtk.gtkmenushell.method.select_item</xsl:text>
</xsl:when>
<xsl:when test="$funcname='deselect'">
<xsl:text>gtk.gtkmenushell.method.deselect</xsl:text>
</xsl:when>
<xsl:when test="$funcname='activate_item'">
<xsl:text>gtk.gtkmenushell.method.activate_item</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_alignment'">
<xsl:text>gtk.gtkmisc.method.set_alignment</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_padding'">
<xsl:text>gtk.gtkmisc.method.set_padding</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_type'">
<xsl:text>gtk.gtkobject.method.get_type</xsl:text>
</xsl:when>
<xsl:when test="$funcname='flags'">
<xsl:text>gtk.gtkobject.method.flags</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_flags'">
<xsl:text>gtk.gtkobject.method.set_flags</xsl:text>
</xsl:when>
<xsl:when test="$funcname='unset_flags'">
<xsl:text>gtk.gtkobject.method.unset_flags</xsl:text>
</xsl:when>
<xsl:when test="$funcname='default_construct'">
<xsl:text>gtk.gtkobject.method.default_construct</xsl:text>
</xsl:when>
<xsl:when test="$funcname='constructed'">
<xsl:text>gtk.gtkobject.method.constructed</xsl:text>
</xsl:when>
<xsl:when test="$funcname='sink'">
<xsl:text>gtk.gtkobject.method.sink</xsl:text>
</xsl:when>
<xsl:when test="$funcname='ref'">
<xsl:text>gtk.gtkobject.method.ref</xsl:text>
</xsl:when>
<xsl:when test="$funcname='unref'">
<xsl:text>gtk.gtkobject.method.unref</xsl:text>
</xsl:when>
<xsl:when test="$funcname='destroy'">
<xsl:text>gtk.gtkobject.method.destroy</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_data'">
<xsl:text>gtk.gtkobject.method.set_data</xsl:text>
</xsl:when>
<xsl:when test="$funcname='remove_data'">
<xsl:text>gtk.gtkobject.method.remove_data</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_data'">
<xsl:text>gtk.gtkobject.method.get_data</xsl:text>
</xsl:when>
<xsl:when test="$funcname='remove_no_notify'">
<xsl:text>gtk.gtkobject.method.remove_no_notify</xsl:text>
</xsl:when>
<xsl:when test="$funcname='signal_emit_stop'">
<xsl:text>gtk.gtkobject.method.signal_emit_stop</xsl:text>
</xsl:when>
<xsl:when test="$funcname='emit_stop_by_name'">
<xsl:text>gtk.gtkobject.method.emit_stop_by_name</xsl:text>
</xsl:when>
<xsl:when test="$funcname='connect'">
<xsl:text>gtk.gtkobject.method.connect</xsl:text>
</xsl:when>
<xsl:when test="$funcname='connect_after'">
<xsl:text>gtk.gtkobject.method.connect_after</xsl:text>
</xsl:when>
<xsl:when test="$funcname='connect_object'">
<xsl:text>gtk.gtkobject.method.connect_object</xsl:text>
</xsl:when>
<xsl:when test="$funcname='connect_object_after'">
<xsl:text>gtk.gtkobject.method.connect_object_after</xsl:text>
</xsl:when>
<xsl:when test="$funcname='disconnect'">
<xsl:text>gtk.gtkobject.method.disconnect</xsl:text>
</xsl:when>
<xsl:when test="$funcname='signal_handler_block'">
<xsl:text>gtk.gtkobject.method.signal_handler_block</xsl:text>
</xsl:when>
<xsl:when test="$funcname='signal_handler_unblock'">
<xsl:text>gtk.gtkobject.method.signal_handler_unblock</xsl:text>
</xsl:when>
<xsl:when test="$funcname='signal_handler_pending'">
<xsl:text>gtk.gtkobject.method.signal_handler_pending</xsl:text>
</xsl:when>
<xsl:when test="$funcname='signal_handler_pending_by_id'">
<xsl:text>gtk.gtkobject.signal_handler_pending_by_id</xsl:text>
</xsl:when>
<xsl:when test="$funcname='signal_handlers_destroy'">
<xsl:text>gtk.gtkobject.method.signal_handlers_destroy</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkOptionMenu'">
<xsl:text>gtk.gtkoptionmenu.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_menu'">
<xsl:text>gtk.gtkoptionmenu.method.get_menu</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_menu'">
<xsl:text>gtk.gtkoptionmenu.method.set_menu</xsl:text>
</xsl:when>
<xsl:when test="$funcname='remove_menu'">
<xsl:text>gtk.gtkoptionmenu.method.remove_menu</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_history'">
<xsl:text>gtk.gtkoptionmenu.method.set_history</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkPacker'">
<xsl:text>gtk.gtkpacker.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='add_defaults'">
<xsl:text>gtk.gtkpacker.method.add_defaults</xsl:text>
</xsl:when>
<xsl:when test="$funcname='add'">
<xsl:text>gtk.gtkpacker.method.add</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_child_packing'">
<xsl:text>gtk.gtkpacker.method.set_child_packing</xsl:text>
</xsl:when>
<xsl:when test="$funcname='reorder_child'">
<xsl:text>gtk.gtkpacker.method.reorder_child</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_spacing'">
<xsl:text>gtk.gtkpacker.method.set_spacing</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_default_border_width'">
<xsl:text>gtk.gtkpacker.method.set_default_border_width</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_default_pad'">
<xsl:text>gtk.gtkpacker.method.set_default_pad</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_default_ipad'">
<xsl:text>gtk.gtkpacker.method.set_default_ipad</xsl:text>
</xsl:when>
<xsl:when test="$funcname='add1'">
<xsl:text>gtk.gtkpaned.method.add1</xsl:text>
</xsl:when>
<xsl:when test="$funcname='add2'">
<xsl:text>gtk.gtkpaned.method.add2</xsl:text>
</xsl:when>
<xsl:when test="$funcname='pack1'">
<xsl:text>gtk.gtkpaned.method.pack1</xsl:text>
</xsl:when>
<xsl:when test="$funcname='pack2'">
<xsl:text>gtk.gtkpaned.method.pack2</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_position'">
<xsl:text>gtk.gtkpaned.method.set_position</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_handle_size'">
<xsl:text>gtk.gtkpaned.method.set_handle_size</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_gutter_size'">
<xsl:text>gtk.gtkpaned.method.set_gutter_size</xsl:text>
</xsl:when>
<xsl:when test="$funcname='compute_position'">
<xsl:text>gtk.gtkpaned.method.compute_position</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkPixmap'">
<xsl:text>gtk.gtkpixmap.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set'">
<xsl:text>gtk.gtkpixmap.method.set</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_build_insensitive'">
<xsl:text>gtk.gtkpixmap.method.set_build_insensitive</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkPlug'">
<xsl:text>gtk.gtkplug.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkPreview'">
<xsl:text>gtk.gtkpreview.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='size'">
<xsl:text>gtk.gtkpreview.method.size</xsl:text>
</xsl:when>
<xsl:when test="$funcname='put'">
<xsl:text>gtk.gtkpreview.method.put</xsl:text>
</xsl:when>
<xsl:when test="$funcname='draw_row'">
<xsl:text>gtk.gtkpreview.method.draw_row</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_expand'">
<xsl:text>gtk.gtkpreview.method.set_expand</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_show_text'">
<xsl:text>gtk.gtkprogress.method.set_show_text</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_text_alignment'">
<xsl:text>gtk.gtkprogress.method.set_text_alignment</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_format_string'">
<xsl:text>gtk.gtkprogress.method.set_format_string</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_adjustment'">
<xsl:text>gtk.gtkprogress.method.set_adjustment</xsl:text>
</xsl:when>
<xsl:when test="$funcname='configure'">
<xsl:text>gtk.gtkprogress.method.configure</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_percentage'">
<xsl:text>gtk.gtkprogress.method.set_percentage</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_value'">
<xsl:text>gtk.gtkprogress.method.set_value</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_value'">
<xsl:text>gtk.gtkprogress.method.get_value</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_activity_mode'">
<xsl:text>gtk.gtkprogress.method.set_activity_mode</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_current_text'">
<xsl:text>gtk.gtkprogress.method.get_current_text</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_text_from_value'">
<xsl:text>gtk.gtkprogress.method.get_text_from_value</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_current_percentage'">
<xsl:text>gtk.gtkprogress.method.get_current_percentage</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_percentage_from_value'">
<xsl:text>gtk.gtkprogress.method.get_percentage_from_value</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkProgressBar'">
<xsl:text>gtk.gtkprogressbar.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_bar_style'">
<xsl:text>gtk.gtkprogressbar.method.set_bar_style</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_discrete_blocks'">
<xsl:text>gtk.gtkprogressbar.method.set_discrete_blocks</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_activity_step'">
<xsl:text>gtk.gtkprogressbar.method.set_activity_step</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_activity_blocks'">
<xsl:text>gtk.gtkprogressbar.method.set_activity_blocks</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_orientation'">
<xsl:text>gtk.gtkprogressbar.method.set_orientation</xsl:text>
</xsl:when>
<xsl:when test="$funcname='update'">
<xsl:text>gtk.gtkprogressbar.method.update</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkRadioButton'">
<xsl:text>gtk.gtkradiobutton.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkRadioMenuItem'">
<xsl:text>gtk.gtkradiomenuitem.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_adjustment'">
<xsl:text>gtk.gtkrange.method.get_adjustment</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_update_policy'">
<xsl:text>gtk.gtkrange.method.set_update_policy</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_adjustment'">
<xsl:text>gtk.gtkrange.method.set_adjustment</xsl:text>
</xsl:when>
<xsl:when test="$funcname='draw_background'">
<xsl:text>gtk.gtkrange.method.draw_background</xsl:text>
</xsl:when>
<xsl:when test="$funcname='clear_background'">
<xsl:text>gtk.gtkrange.method.clear_background</xsl:text>
</xsl:when>
<xsl:when test="$funcname='draw_trough'">
<xsl:text>gtk.gtkrange.method.draw_trough</xsl:text>
</xsl:when>
<xsl:when test="$funcname='draw_slider'">
<xsl:text>gtk.gtkrange.method.draw_slider</xsl:text>
</xsl:when>
<xsl:when test="$funcname='draw_step_forw'">
<xsl:text>gtk.gtkrange.method.draw_step_forw</xsl:text>
</xsl:when>
<xsl:when test="$funcname='draw_step_back'">
<xsl:text>gtk.gtkrange.method.draw_step_back</xsl:text>
</xsl:when>
<xsl:when test="$funcname='slider_update'">
<xsl:text>gtk.gtkrange.method.slider_update</xsl:text>
</xsl:when>
<xsl:when test="$funcname='default_hslider_update'">
<xsl:text>gtk.gtkrange.method.default_hslider_update</xsl:text>
</xsl:when>
<xsl:when test="$funcname='default_vslider_update'">
<xsl:text>gtk.gtkrange.method.default_vslider_update</xsl:text>
</xsl:when>
<xsl:when test="$funcname='default_hmotion'">
<xsl:text>gtk.gtkrange.method.default_hmotion</xsl:text>
</xsl:when>
<xsl:when test="$funcname='default_vmotion'">
<xsl:text>gtk.gtkrange.method.default_vmotion</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_metric'">
<xsl:text>gtk.gtkruler.method.set_metric</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_range'">
<xsl:text>gtk.gtkruler.method.set_range</xsl:text>
</xsl:when>
<xsl:when test="$funcname='draw_ticks'">
<xsl:text>gtk.gtkruler.method.draw_ticks</xsl:text>
</xsl:when>
<xsl:when test="$funcname='draw_pos'">
<xsl:text>gtk.gtkruler.method.draw_pos</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_digits'">
<xsl:text>gtk.gtkscale.method.set_digits</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_draw_value'">
<xsl:text>gtk.gtkscale.method.set_draw_value</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_value_pos'">
<xsl:text>gtk.gtkscale.method.set_value_pos</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_value_width'">
<xsl:text>gtk.gtkscale.method.get_value_width</xsl:text>
</xsl:when>
<xsl:when test="$funcname='draw_value'">
<xsl:text>gtk.gtkscale.method.draw_value</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkScrolledWindow'">
<xsl:text>gtk.gtkscrolledwindow.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_hadjustment'">
<xsl:text>gtk.gtkscrolledwindow.method.set_hadjustment</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_vadjustment'">
<xsl:text>gtk.gtkscrolledwindow.method.set_vadjustment</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_hadjustment'">
<xsl:text>gtk.gtkscrolledwindow.method.get_hadjustment</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_vadjustment'">
<xsl:text>gtk.gtkscrolledwindow.method.get_vadjustment</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_policy'">
<xsl:text>gtk.gtkscrolledwindow.method.set_policy</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_placement'">
<xsl:text>gtk.gtkscrolledwindow.method.set_placement</xsl:text>
</xsl:when>
<xsl:when test="$funcname='add_with_viewport'">
<xsl:text>gtk.gtkscrolledwindow.method.add_with_viewport</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set'">
<xsl:text>gtk.gtkselectiondata.method.set</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkSocket'">
<xsl:text>gtk.gtksocket.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='steal'">
<xsl:text>gtk.gtksocket.method.steal</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkSpinButton'">
<xsl:text>gtk.gtkspinbutton.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='configure'">
<xsl:text>gtk.gtkspinbutton.method.configure</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_adjustment'">
<xsl:text>gtk.gtkspinbutton.method.set_adjustment</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_adjustment'">
<xsl:text>gtk.gtkspinbutton.method.get_adjustment</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_digits'">
<xsl:text>gtk.gtkspinbutton.method.set_digits</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_value_as_float'">
<xsl:text>gtk.gtkspinbutton.method.get_value_as_float</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_value_as_int'">
<xsl:text>gtk.gtkspinbutton.method.get_value_as_int</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_value'">
<xsl:text>gtk.gtkspinbutton.method.set_value</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_update_policy'">
<xsl:text>gtk.gtkspinbutton.method.set_update_policy</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_numeric'">
<xsl:text>gtk.gtkspinbutton.method.set_numeric</xsl:text>
</xsl:when>
<xsl:when test="$funcname='spin'">
<xsl:text>gtk.gtkspinbutton.method.spin</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_wrap'">
<xsl:text>gtk.gtkspinbutton.method.set_wrap</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_shadow_type'">
<xsl:text>gtk.gtkspinbutton.method.set_shadow_type</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_snap_to_ticks'">
<xsl:text>gtk.gtkspinbutton.method.set_snap_to_ticks</xsl:text>
</xsl:when>
<xsl:when test="$funcname='update'">
<xsl:text>gtk.gtkspinbutton.method.update</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkStatusBar'">
<xsl:text>gtk.gtkstatusbar.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_context_id'">
<xsl:text>gtk.gtkstatusbar.method.get_context_id</xsl:text>
</xsl:when>
<xsl:when test="$funcname='push'">
<xsl:text>gtk.gtkstatusbar.method.push</xsl:text>
</xsl:when>
<xsl:when test="$funcname='pop'">
<xsl:text>gtk.gtkstatusbar.method.pop</xsl:text>
</xsl:when>
<xsl:when test="$funcname='remove'">
<xsl:text>gtk.gtkstatusbar.method.remove</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkStyle'">
<xsl:text>gtk.gtkstyle.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='copy'">
<xsl:text>gtk.gtkstyle.method.copy</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkTable'">
<xsl:text>gtk.gtktable.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='resize'">
<xsl:text>gtk.gtktable.method.resize</xsl:text>
</xsl:when>
<xsl:when test="$funcname='attach'">
<xsl:text>gtk.gtktable.method.attach</xsl:text>
</xsl:when>
<xsl:when test="$funcname='attach_defaults'">
<xsl:text>gtk.gtktable.method.attach_defaults</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_row_spacing'">
<xsl:text>gtk.gtktable.method.set_row_spacing</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_col_spacing'">
<xsl:text>gtk.gtktable.method.set_col_spacing</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_row_spacings'">
<xsl:text>gtk.gtktable.method.set_row_spacings</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_col_spacings'">
<xsl:text>gtk.gtktable.method.set_col_spacings</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_homogeneous'">
<xsl:text>gtk.gtktable.method.set_homogeneous</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkTipsQuery'">
<xsl:text>gtk.gtktipsquery.constructor.construct</xsl:text>
</xsl:when>
<xsl:when test="$funcname='start_query'">
<xsl:text>gtk.gtktipsquery.method.start_query</xsl:text>
</xsl:when>
<xsl:when test="$funcname='stop_query'">
<xsl:text>gtk.gtktipsquery.method.stop_query</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_caller'">
<xsl:text>gtk.gtktipsquery.method.set_caller</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_labels'">
<xsl:text>gtk.gtktipsquery.method.set_labels</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkTearoffMenuItem'">
<xsl:text>gtk.gtktearoffmenuitem.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkText'">
<xsl:text>gtk.gtktext.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_editable'">
<xsl:text>gtk.gtktext.method.set_editable</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_word_wrap'">
<xsl:text>gtk.gtktext.method.set_word_wrap</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_line_wrap'">
<xsl:text>gtk.gtktext.method.set_line_wrap</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_adjustments'">
<xsl:text>gtk.gtktext.method.set_adjustments</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_point'">
<xsl:text>gtk.gtktext.method.set_point</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_point'">
<xsl:text>gtk.gtktext.method.get_point</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_length'">
<xsl:text>gtk.gtktext.method.get_length</xsl:text>
</xsl:when>
<xsl:when test="$funcname='freeze'">
<xsl:text>gtk.gtktext.method.freeze</xsl:text>
</xsl:when>
<xsl:when test="$funcname='thaw'">
<xsl:text>gtk.gtktext.method.thaw</xsl:text>
</xsl:when>
<xsl:when test="$funcname='insert'">
<xsl:text>gtk.gtktext.method.insert</xsl:text>
</xsl:when>
<xsl:when test="$funcname='backward_delete'">
<xsl:text>gtk.gtktext.method.backward_delete</xsl:text>
</xsl:when>
<xsl:when test="$funcname='forward_delete'">
<xsl:text>gtk.gtktext.method.forward_delete</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkToggleButton'">
<xsl:text>gtk.gtktogglebutton.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_mode'">
<xsl:text>gtk.gtktogglebutton.method.set_mode</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_active'">
<xsl:text>gtk.gtktogglebutton.method.set_active</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_active'">
<xsl:text>gtk.gtktogglebutton.method.get_active</xsl:text>
</xsl:when>
<xsl:when test="$funcname='toggled'">
<xsl:text>gtk.gtktogglebutton.method.toggled</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkToolbar'">
<xsl:text>gtk.gtktoolbar.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='append_space'">
<xsl:text>gtk.gtktoolbar.method.append_space</xsl:text>
</xsl:when>
<xsl:when test="$funcname='prepend_space'">
<xsl:text>gtk.gtktoolbar.method.prepend_space</xsl:text>
</xsl:when>
<xsl:when test="$funcname='insert_space'">
<xsl:text>gtk.gtktoolbar.method.insert_space</xsl:text>
</xsl:when>
<xsl:when test="$funcname='append_widget'">
<xsl:text>gtk.gtktoolbar.method.append_widget</xsl:text>
</xsl:when>
<xsl:when test="$funcname='prepend_widget'">
<xsl:text>gtk.gtktoolbar.method.prepend_widget</xsl:text>
</xsl:when>
<xsl:when test="$funcname='insert_widget'">
<xsl:text>gtk.gtktoolbar.method.insert_widget</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_orientation'">
<xsl:text>gtk.gtktoolbar.method.set_orientation</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_style'">
<xsl:text>gtk.gtktoolbar.method.set_style</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_space_size'">
<xsl:text>gtk.gtktoolbar.method.set_space_size</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_space_style'">
<xsl:text>gtk.gtktoolbar.method.set_space_style</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_tooltips'">
<xsl:text>gtk.gtktoolbar.method.set_tooltips</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_button_relief'">
<xsl:text>gtk.gtktoolbar.method.set_button_relief</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_button_relief'">
<xsl:text>gtk.gtktoolbar.method.get_button_relief</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkTooltips'">
<xsl:text>gtk.gtktooltips.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='enable'">
<xsl:text>gtk.gtktooltips.method.enable</xsl:text>
</xsl:when>
<xsl:when test="$funcname='disable'">
<xsl:text>gtk.gtktooltips.method.disable</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_delay'">
<xsl:text>gtk.gtktooltips.method.set_delay</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_tip'">
<xsl:text>gtk.gtktooltips.method.set_tip</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_colors'">
<xsl:text>gtk.gtktooltips.method.set_colors</xsl:text>
</xsl:when>
<xsl:when test="$funcname='force_window'">
<xsl:text>gtk.gtktooltips.method.force_window</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkTree'">
<xsl:text>gtk.gtktree.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='append'">
<xsl:text>gtk.gtktree.method.append</xsl:text>
</xsl:when>
<xsl:when test="$funcname='prepend'">
<xsl:text>gtk.gtktree.method.prepend</xsl:text>
</xsl:when>
<xsl:when test="$funcname='insert'">
<xsl:text>gtk.gtktree.method.insert</xsl:text>
</xsl:when>
<xsl:when test="$funcname='clear_items'">
<xsl:text>gtk.gtktree.method.clear_items</xsl:text>
</xsl:when>
<xsl:when test="$funcname='select_item'">
<xsl:text>gtk.gtktree.method.select_item</xsl:text>
</xsl:when>
<xsl:when test="$funcname='unselect_item'">
<xsl:text>gtk.gtktree.method.unselect_item</xsl:text>
</xsl:when>
<xsl:when test="$funcname='select_child'">
<xsl:text>gtk.gtktree.method.select_child</xsl:text>
</xsl:when>
<xsl:when test="$funcname='unselect_child'">
<xsl:text>gtk.gtktree.method.unselect_child</xsl:text>
</xsl:when>
<xsl:when test="$funcname='child_position'">
<xsl:text>gtk.gtktree.method.child_position</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_selection_mode'">
<xsl:text>gtk.gtktree.method.set_selection_mode</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_view_mode'">
<xsl:text>gtk.gtktree.method.set_view_mode</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_view_lines'">
<xsl:text>gtk.gtktree.method.set_view_lines</xsl:text>
</xsl:when>
<xsl:when test="$funcname='remove_item'">
<xsl:text>gtk.gtktree.method.remove_item</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkTreeItem'">
<xsl:text>gtk.gtktreeitem.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_subtree'">
<xsl:text>gtk.gtktreeitem.method.set_subtree</xsl:text>
</xsl:when>
<xsl:when test="$funcname='remove_subtree'">
<xsl:text>gtk.gtktreeitem.method.remove_subtree</xsl:text>
</xsl:when>
<xsl:when test="$funcname='select'">
<xsl:text>gtk.gtktreeitem.method.select</xsl:text>
</xsl:when>
<xsl:when test="$funcname='deselect'">
<xsl:text>gtk.gtktreeitem.method.deselect</xsl:text>
</xsl:when>
<xsl:when test="$funcname='expand'">
<xsl:text>gtk.gtktreeitem.method.expand</xsl:text>
</xsl:when>
<xsl:when test="$funcname='collapse'">
<xsl:text>gtk.gtktreeitem.method.collapse</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkVButtonBox'">
<xsl:text>gtk.gtkvbuttonbox.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkVBox'">
<xsl:text>gtk.gtkvbox.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkViewport'">
<xsl:text>gtk.gtkviewport.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_hadjustment'">
<xsl:text>gtk.gtkviewport.method.get_hadjustment</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_vadjustment'">
<xsl:text>gtk.gtkviewport.method.get_vadjustment</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_hadjustment'">
<xsl:text>gtk.gtkviewport.method.set_hadjustment</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_vadjustment'">
<xsl:text>gtk.gtkviewport.method.set_vadjustment</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_shadow_type'">
<xsl:text>gtk.gtkviewport.method.set_shadow_type</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkVPaned'">
<xsl:text>gtk.gtkvpaned.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkVRuler'">
<xsl:text>gtk.gtkvruler.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkVScale'">
<xsl:text>gtk.gtkvscale.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkVScrollbar'">
<xsl:text>gtk.gtkvscrollbar.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkVSeparator'">
<xsl:text>gtk.gtkvseparator.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='drag_highlight'">
<xsl:text>gtk.gtkwidget.method.drag_highlight</xsl:text>
</xsl:when>
<xsl:when test="$funcname='drag_unhighlight'">
<xsl:text>gtk.gtkwidget.method.drag_unhighlight</xsl:text>
</xsl:when>
<xsl:when test="$funcname='drag_dest_unset'">
<xsl:text>gtk.gtkwidget.method.drag_dest_unset</xsl:text>
</xsl:when>
<xsl:when test="$funcname='drag_source_unset'">
<xsl:text>gtk.gtkwidget.method.drag_source_unset</xsl:text>
</xsl:when>
<xsl:when test="$funcname='drag_source_set_icon'">
<xsl:text>gtk.gtkwidget.method.drag_source_set_icon</xsl:text>
</xsl:when>
<xsl:when test="$funcname='selection_owner_set'">
<xsl:text>gtk.gtkwidget.method.selection_owner_set</xsl:text>
</xsl:when>
<xsl:when test="$funcname='selection_add_target'">
<xsl:text>gtk.gtkwidget.method.selection_add_target</xsl:text>
</xsl:when>
<xsl:when test="$funcname='selection_convert'">
<xsl:text>gtk.gtkwidget.method.selection_convert</xsl:text>
</xsl:when>
<xsl:when test="$funcname='selection_remove_all'">
<xsl:text>gtk.gtkwidget.method.selection_remove_all</xsl:text>
</xsl:when>
<xsl:when test="$funcname='ref'">
<xsl:text>gtk.gtkwidget.method.ref</xsl:text>
</xsl:when>
<xsl:when test="$funcname='unref'">
<xsl:text>gtk.gtkwidget.method.unref</xsl:text>
</xsl:when>
<xsl:when test="$funcname='destroy'">
<xsl:text>gtk.gtkwidget.method.destroy</xsl:text>
</xsl:when>
<xsl:when test="$funcname='unparent'">
<xsl:text>gtk.gtkwidget.method.unparent</xsl:text>
</xsl:when>
<xsl:when test="$funcname='show'">
<xsl:text>gtk.gtkwidget.method.show</xsl:text>
</xsl:when>
<xsl:when test="$funcname='show_now'">
<xsl:text>gtk.gtkwidget.method.show_now</xsl:text>
</xsl:when>
<xsl:when test="$funcname='hide'">
<xsl:text>gtk.gtkwidget.method.hide</xsl:text>
</xsl:when>
<xsl:when test="$funcname='show_all'">
<xsl:text>gtk.gtkwidget.method.show_all</xsl:text>
</xsl:when>
<xsl:when test="$funcname='hide_all'">
<xsl:text>gtk.gtkwidget.method.hide_all</xsl:text>
</xsl:when>
<xsl:when test="$funcname='map'">
<xsl:text>gtk.gtkwidget.method.map</xsl:text>
</xsl:when>
<xsl:when test="$funcname='unmap'">
<xsl:text>gtk.gtkwidget.method.unmap</xsl:text>
</xsl:when>
<xsl:when test="$funcname='realize'">
<xsl:text>gtk.gtkwidget.method.realize</xsl:text>
</xsl:when>
<xsl:when test="$funcname='unrealize'">
<xsl:text>gtk.gtkwidget.method.unrealize</xsl:text>
</xsl:when>
<xsl:when test="$funcname='queue_draw'">
<xsl:text>gtk.gtkwidget.method.queue_draw</xsl:text>
</xsl:when>
<xsl:when test="$funcname='queue_draw_area'">
<xsl:text>gtk.gtkwidget.method.queue_draw_area</xsl:text>
</xsl:when>
<xsl:when test="$funcname='queue_clear'">
<xsl:text>gtk.gtkwidget.method.queue_clear</xsl:text>
</xsl:when>
<xsl:when test="$funcname='queue_clear_area'">
<xsl:text>gtk.gtkwidget.method.queue_clear_area</xsl:text>
</xsl:when>
<xsl:when test="$funcname='queue_resize'">
<xsl:text>gtk.gtkwidget.method.queue_resize</xsl:text>
</xsl:when>
<xsl:when test="$funcname='draw'">
<xsl:text>gtk.gtkwidget.method.draw</xsl:text>
</xsl:when>
<xsl:when test="$funcname='draw_focus'">
<xsl:text>gtk.gtkwidget.method.draw_focus</xsl:text>
</xsl:when>
<xsl:when test="$funcname='draw_default'">
<xsl:text>gtk.gtkwidget.method.draw_default</xsl:text>
</xsl:when>
<xsl:when test="$funcname='add_accelerator'">
<xsl:text>gtk.gtkwidget.method.add_accelerator</xsl:text>
</xsl:when>
<xsl:when test="$funcname='remove_accelerator'">
<xsl:text>gtk.gtkwidget.method.remove_accelerator</xsl:text>
</xsl:when>
<xsl:when test="$funcname='remove_accelerators'">
<xsl:text>gtk.gtkwidget.method.remove_accelerators</xsl:text>
</xsl:when>
<xsl:when test="$funcname='accelerator_signal'">
<xsl:text>gtk.gtkwidget.method.accelerator_signal</xsl:text>
</xsl:when>
<xsl:when test="$funcname='lock_accelerators'">
<xsl:text>gtk.gtkwidget.method.lock_accelerators</xsl:text>
</xsl:when>
<xsl:when test="$funcname='unlock_accelerators'">
<xsl:text>gtk.gtkwidget.method.unlock_accelerators</xsl:text>
</xsl:when>
<xsl:when test="$funcname='accelerators_locked'">
<xsl:text>gtk.gtkwidget.method.accelerators_locked</xsl:text>
</xsl:when>
<xsl:when test="$funcname='event'">
<xsl:text>gtk.gtkwidget.method.event</xsl:text>
</xsl:when>
<xsl:when test="$funcname='activate'">
<xsl:text>gtk.gtkwidget.method.activate</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_scroll_adjustment'">
<xsl:text>gtk.gtkwidget.method.set_scroll_adjustment</xsl:text>
</xsl:when>
<xsl:when test="$funcname='reparent'">
<xsl:text>gtk.gtkwidget.method.reparent</xsl:text>
</xsl:when>
<xsl:when test="$funcname='popup'">
<xsl:text>gtk.gtkwidget.method.popup</xsl:text>
</xsl:when>
<xsl:when test="$funcname='intersect'">
<xsl:text>gtk.gtkwidget.method.intersect</xsl:text>
</xsl:when>
<xsl:when test="$funcname='grab_focus'">
<xsl:text>gtk.gtkwidget.method.grab_focus</xsl:text>
</xsl:when>
<xsl:when test="$funcname='grab_default'">
<xsl:text>gtk.gtkwidget.method.grab_default</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_name'">
<xsl:text>gtk.gtkwidget.method.set_name</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_name'">
<xsl:text>gtk.gtkwidget.method.get_name</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_state'">
<xsl:text>gtk.gtkwidget.method.set_state</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_sensitive'">
<xsl:text>gtk.gtkwidget.method.set_sensitive</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_app_paintable'">
<xsl:text>gtk.gtkwidget.method.set_app_paintable</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_parent'">
<xsl:text>gtk.gtkwidget.method.set_parent</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_parent_window'">
<xsl:text>gtk.gtkwidget.method.set_parent_window</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_parent_window'">
<xsl:text>gtk.gtkwidget.method.get_parent_window</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_uposition'">
<xsl:text>gtk.gtkwidget.method.set_uposition</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_usize'">
<xsl:text>gtk.gtkwidget.method.set_usize</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_events'">
<xsl:text>gtk.gtkwidget.method.set_events</xsl:text>
</xsl:when>
<xsl:when test="$funcname='add_events'">
<xsl:text>gtk.gtkwidget.method.add_events</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_toplevel'">
<xsl:text>gtk.gtkwidget.method.get_toplevel</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_ancestor'">
<xsl:text>gtk.gtkwidget.method.get_ancestor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_colormap'">
<xsl:text>gtk.gtkwidget.method.get_colormap</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_visual'">
<xsl:text>gtk.gtkwidget.method.get_visual</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_colormap'">
<xsl:text>gtk.gtkwidget.method.set_colormap</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_visual'">
<xsl:text>gtk.gtkwidget.method.set_visual</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_events'">
<xsl:text>gtk.gtkwidget.method.get_events</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_pointer'">
<xsl:text>gtk.gtkwidget.method.get_pointer</xsl:text>
</xsl:when>
<xsl:when test="$funcname='is_ancestor'">
<xsl:text>gtk.gtkwidget.method.is_ancestor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='hide_on_delete'">
<xsl:text>gtk.gtkwidget.method.hide_on_delete</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_style'">
<xsl:text>gtk.gtkwidget.method.set_style</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_rc_style'">
<xsl:text>gtk.gtkwidget.method.set_rc_style</xsl:text>
</xsl:when>
<xsl:when test="$funcname='ensure_style'">
<xsl:text>gtk.gtkwidget.method.ensure_style</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_style'">
<xsl:text>gtk.gtkwidget.method.get_style</xsl:text>
</xsl:when>
<xsl:when test="$funcname='restore_default_style'">
<xsl:text>gtk.gtkwidget.method.restore_default_style</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_composite_name'">
<xsl:text>gtk.gtkwidget.method.set_composite_name</xsl:text>
</xsl:when>
<xsl:when test="$funcname='get_composite_name'">
<xsl:text>gtk.gtkwidget.method.get_composite_name</xsl:text>
</xsl:when>
<xsl:when test="$funcname='reset_rc_styles'">
<xsl:text>gtk.gtkwidget.method.reset_rc_styles</xsl:text>
</xsl:when>
<xsl:when test="$funcname='shape_combine_mask'">
<xsl:text>gtk.gtkwidget.method.shape_combine_mask</xsl:text>
</xsl:when>
<xsl:when test="$funcname='reset_shapes'">
<xsl:text>gtk.gtkwidget.method.reset_shapes</xsl:text>
</xsl:when>
<xsl:when test="$funcname='path'">
<xsl:text>gtk.gtkwidget.method.path</xsl:text>
</xsl:when>
<xsl:when test="$funcname='class_path'">
<xsl:text>gtk.gtkwidget.method.class_path</xsl:text>
</xsl:when>
<xsl:when test="$funcname='GtkWindow'">
<xsl:text>gtk.gtkwindow.constructor</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_title'">
<xsl:text>gtk.gtkwindow.method.set_title</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_wmclass'">
<xsl:text>gtk.gtkwindow.method.set_wmclass</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_policy'">
<xsl:text>gtk.gtkwindow.method.set_policy</xsl:text>
</xsl:when>
<xsl:when test="$funcname='add_accel_group'">
<xsl:text>gtk.gtkwindow.method.add_accel_group</xsl:text>
</xsl:when>
<xsl:when test="$funcname='remove_accel_group'">
<xsl:text>gtk.gtkwindow.method.remove_accel_group</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_position'">
<xsl:text>gtk.gtkwindow.method.set_position</xsl:text>
</xsl:when>
<xsl:when test="$funcname='activate_focus'">
<xsl:text>gtk.gtkwindow.method.activate_focus</xsl:text>
</xsl:when>
<xsl:when test="$funcname='activate_default'">
<xsl:text>gtk.gtkwindow.method.activate_default</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_transient_for'">
<xsl:text>gtk.gtkwindow.method.set_transient_for</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_default_size'">
<xsl:text>gtk.gtkwindow.method.set_default_size</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_modal'">
<xsl:text>gtk.gtkwindow.method.set_modal</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_focus'">
<xsl:text>gtk.gtkwindow.method.set_focus</xsl:text>
</xsl:when>
<xsl:when test="$funcname='set_default'">
<xsl:text>gtk.gtkwindow.method.set_default</xsl:text>
</xsl:when>


  <xsl:otherwise>

   <xsl:text>no</xsl:text>

  </xsl:otherwise>

  </xsl:choose>

  </xsl:template>

 
  <xsl:template name="get_sig_id_from_name">

  <xsl:param name="signame" />

  <xsl:choose>

 <xsl:when test="$signame='clicked'">
<xsl:text>gtk.gtkbutton.signal.clicked</xsl:text>
</xsl:when>
<xsl:when test="$signame='disconnect'">
<xsl:text>gtk.gtkdata.signal.disconnect</xsl:text>
</xsl:when>
<xsl:when test="$signame='start_query'">
<xsl:text>gtk.gtktipsquery.signal.start_query</xsl:text>
</xsl:when>
<xsl:when test="$signame='stop_query'">
<xsl:text>gtk.gtktipsquery.signal.stop_query</xsl:text>
</xsl:when>
<xsl:when test="$signame='widget_entered'">
<xsl:text>gtk.gtktipsquery.signal.widget_entered</xsl:text>
</xsl:when>
<xsl:when test="$signame='widget_selected'">
<xsl:text>gtk.gtktipsquery.signal.widget_selected</xsl:text>
</xsl:when>


  <xsl:otherwise>

   <xsl:text>no</xsl:text>

  </xsl:otherwise>

  </xsl:choose>

  </xsl:template>

  </xsl:stylesheet>
 