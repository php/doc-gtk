<?php

function tryprefix($func, $prefix) {

/* set up the tools for the job - this array tests class and enum names */
$classes = array('GtkAccelGroup.', 'GtkAccelLabel.', 'GtkAdjustment.', 'GtkAlignment.', 'GtkArrow.', 'GtkAspectFrame.', 'GtkBin.', 'GtkBox.', 'GtkBoxChild.', 'GtkButton.', 'GtkButtonBox.', 'GtkCalendar.', 'GtkCheckButton.', 'GtkCheckMenuItem.', 'GtkCList.', 'GtkCListRow.', 'GtkColorSelection.', 'GtkColorSelectionDialog.', 'GtkCombo.', 'GtkContainer.', 'GtkCTree.', 'GtkCTreeNode.', 'GtkCurve.', 'GtkData.', 'GtkDialog.', 'GtkDrawingArea.', 'GtkEditable.', 'GtkEntry.', 'GtkEventBox.', 'GtkFileSelection.', 'GtkFixed.', 'GtkFixedChild.', 'GtkFontSelection.', 'GtkFontSelectionDialog.', 'GtkFrame.', 'GtkGammaCurve.', 'GtkHandleBox.', 'GtkHBox.', 'GtkHButtonBox.', 'GtkHPaned.', 'GtkHRuler.', 'GtkHScale.', 'GtkHScrollbar.', 'GtkHSeparator.', 'GtkImage.', 'GtkInputDialog.', 'GtkInvisible.', 'GtkItem.', 'GtkItemFactory.', 'GtkLabel.', 'GtkLayout.', 'GtkList.', 'GtkListItem.', 'GtkMenu.', 'GtkMenuBar.', 'GtkMenuItem.', 'GtkMenuShell.', 'GtkMisc.', 'GtkNotebook.', 'GtkObject.', 'GtkOptionMenu.', 'GtkPacker.', 'GtkPaned.', 'GtkPixmap.', 'GtkPlug.', 'GtkPreview.', 'GtkProgress.', 'GtkProgressbar.', 'GtkRadioButton.', 'GtkRadioMenuItem.', 'GtkRange.', 'GtkRuler.', 'GtkScale.', 'GtkScrollbar.', 'GtkScrolledWindow.', 'GtkSelectionData.', 'GtkSeparator.', 'GtkSocket.', 'GtkSpinButton.', 'GtkStatusBar.', 'GtkStyle.', 'GtkTable.', 'GtkTableChild.', 'GtkTearoffMenuItem.', 'GtkText.', 'GtkTipsQuery.', 'GtkToggleButton.', 'GtkToolBar.', 'GtkToolTips.', 'GtkTree.', 'GtkTreeItem.', 'GtkVBox.', 'GtkVButtonBox.', 'GtkViewport.', 'GtkVPaned.', 'GtkVRuler.', 'GtkVScale.', 'GtkVScrollbar.', 'GtkVSeparator.', 'GtkWidget.', 'GtkWindow.', 'GdkAtom.', 'GdkBitmap.', 'GdkColor.', 'GdkColormap.', 'GdkCursor.', 'GdkDragContext.', 'GdkEvent.', 'GdkEventAny.', 'GdkEventExpose.', 'GdkFont.', 'GdkGC.', 'GdkPixmap.', 'GdkVisual.', 'GdkWindow.', 'GdkCapStyle.', 'GdkCursorType.', 'GdkDragAction.', 'GdkEventMask.', 'GdkEventType.', 'GdkFill.', 'GdkFontType.', 'GdkFunction.', 'GdkInputCondition.', 'GdkJoinStyle.', 'GdkLineStyle.', 'GdkModifierType.', 'GdkRgbDither.', 'GdkSubwindowMode.', 'GdkVisualType.', 'GtkAccelFlags.', 'GtkAnchorType.', 'GtkArrowType.', 'GtkAttachOptions.', 'GtkButtonAction.', 'GtkButtonBoxStyle.', 'GtkCalendarDisplayOptions.', 'GtkCellType.', 'GtkCornerStyle.', 'GtkCTreeExpanderStyle.', 'GtkCTreeExpansionType.', 'GtkCTreeLineStyle.', 'GtkCurveType.', 'GtkDestDefaults.', 'GtkDirectionType.', 'GtkFontFilterType.', 'GtkFontType.', 'GtkJustification.', 'GtkObjectFlags.', 'GtkOrientation.', 'GtkPackerOptions.', 'GtkPackType.', 'GtkPolicyType.', 'GtkPositionType.', 'GtkPreviewType.', 'GtkProgressBarOrientation.', 'GtkProgressBarStyle.', 'GtkReliefStyle.', 'GtkResizeMode.', 'GtkScrollType.', 'GtkSelectionMode.', 'GtkShadowType.', 'GtkSideType.', 'GtkSortType.', 'GtkSpinButtonUpdatePolicy.', 'GtkSpinType.', 'GtkStateType.', 'GtkSubmenuPlacement.', 'GtkToolbarChildType.', 'GtkToolbarSpaceStyle.', 'GtkToolbarStyle.', 'GtkTreeViewMode.', 'GtkUpdateType.', 'GtkVisibility.', 'GtkWidgetFlags.', 'GtkWindowPosition.', 'GtkWindowType.');

$types = array('method.', 'signal.', 'property.');
$first = substr($prefix, 0, 3);
$hit = array();

/* just so's we don't have to guess wildly at capitalisation in classes/enums */
for($i = 0; $i < sizeof($classes); $i++) {
	if(stristr($classes[$i], "${func}.")) $pos = $i;
	}
$realname = $classes[$pos];

/* checking for classes, enums and static functions */
	if(strstr($func, "gdk") || strstr($func, "gtk") || strstr($prefix, "method")) {
/* checking for full function name (e.g. 'gtkwindow::set_default_size') */
		if(strstr($prefix, "method") && strlen($prefix) > 11) {
			$try = "/manual/${first}.${prefix}${func}.php";
			if (file_exists("$_SERVER[DOCUMENT_ROOT]$try")) $hit[] = $try;
			}
		else {
/* it's either a gtk/gdk static function or it's a full class or enum name */
			$try = "/manual/${prefix}${func}.php";
			$constructor = "/manual/${prefix}${func}.constructor.php";
			if (file_exists("$_SERVER[DOCUMENT_ROOT]$constructor")) {
				$try = "/manual/${prefix}${realname}php";
				$constructor = "/manual/${prefix}${realname}constructor.php";
				$hit = array($try, $constructor);
				}
			else if (file_exists("$_SERVER[DOCUMENT_ROOT]$try"))
			$hit[] = $try;
			}
/* full queries can only have this return, so send it straight home to Daddy */
		return $hit;
	}

/* undeclared class/constructor or enum */
	$try = "/manual/${prefix}${first}${func}.php";
	$constructor = "/manual/${prefix}${first}${func}.constructor.php";
	if (file_exists("$_SERVER[DOCUMENT_ROOT]$constructor")) {
		for($i = 0; $i < sizeof($classes); $i++) {
			if(stristr($classes[$i], "${first}${func}.")) $pos = $i;
			}
		$realname = $classes[$pos];
		$try = "/manual/${prefix}${realname}php";
		$constructor = "/manual/${prefix}${realname}constructor.php";
		$hit = array($try, $constructor);
	}
	else {
		if (file_exists("$_SERVER[DOCUMENT_ROOT]$try")) {
		for($i = 0; $i < sizeof($classes); $i++) {
			if(stristr($classes[$i], "${first}${func}.")) {
				$pos = $i;
				$realname = $classes[$pos];
				$try = "/manual/${prefix}${realname}php";
				}
			}
		$hit[] = $try;
		}
	}

/* undeclared static function */
	$try = "/manual/${prefix}method.${func}.php";
		if(file_exists("$_SERVER[DOCUMENT_ROOT]$try")) $hit[] = $try;

/* class methods, signals and properties with no clues attached */
	foreach($classes as $class) {
		$lowclass = strtolower($class);
		foreach($types as $type) {
			if($first == substr($lowclass, 0, 3)) {
				$try = "/manual/${prefix}${lowclass}${type}${func}.php";
				$uc = "/manual/${prefix}${class}${type}${func}.php";
			if(file_exists("$_SERVER[DOCUMENT_ROOT]$try"))
				$hit[] = $uc;
			}
		}
	}
	return $hit;
}

function find_manual_page($function) {

/* names of xml-generated sections */
$sections = array("gdk.enum.", "gdk.", "gtk.enum.", "gtk.");

/* if there's no :: in there we could be looking for anything */
	if(!strstr($function, "::")) {
		foreach($sections as $section) {
			$try = tryprefix($function, $section);
			if($try) $result = array_merge($try, $result);
			}
		if($result) return $result;
		}
	else {
/* fast track, single return :) */
		list($funcpre, $funcpost) = split("::", $function);
		$try = tryprefix($funcpost, "$funcpre.method.");
		if($try) return $try;
		}
	return "";
}

?>