<?php

/* set up the tools for the job - this array tests class and enum names
in order to capitalize them correctly, throughout the search routines */
$classes = array('GtkAccelGroup.', 'GtkAccelLabel.', 'GtkAdjustment.', 'GtkAlignment.', 'GtkArrow.', 'GtkAspectFrame.', 'GtkBin.', 'GtkBox.', 'GtkBoxChild.', 'GtkButton.', 'GtkButtonBox.', 'GtkCalendar.', 'GtkCheckButton.', 'GtkCheckMenuItem.', 'GtkCList.', 'GtkCListRow.', 'GtkColorSelection.', 'GtkColorSelectionDialog.', 'GtkCombo.', 'GtkContainer.', 'GtkCTree.', 'GtkCTreeNode.', 'GtkCurve.', 'GtkData.', 'GtkDialog.', 'GtkDrawingArea.', 'GtkEditable.', 'GtkEntry.', 'GtkEventBox.', 'GtkFileSelection.', 'GtkFixed.', 'GtkFixedChild.', 'GtkFontSelection.', 'GtkFontSelectionDialog.', 'GtkFrame.', 'GtkGammaCurve.', 'GtkHandleBox.', 'GtkHBox.', 'GtkHButtonBox.', 'GtkHPaned.', 'GtkHRuler.', 'GtkHScale.', 'GtkHScrollbar.', 'GtkHSeparator.', 'GtkImage.', 'GtkInputDialog.', 'GtkInvisible.', 'GtkItem.', 'GtkItemFactory.', 'GtkLabel.', 'GtkLayout.', 'GtkList.', 'GtkListItem.', 'GtkMenu.', 'GtkMenuBar.', 'GtkMenuItem.', 'GtkMenuShell.', 'GtkMisc.', 'GtkNotebook.', 'GtkObject.', 'GtkOptionMenu.', 'GtkPacker.', 'GtkPaned.', 'GtkPixmap.', 'GtkPlug.', 'GtkPreview.', 'GtkProgress.', 'GtkProgressbar.', 'GtkRadioButton.', 'GtkRadioMenuItem.', 'GtkRange.', 'GtkRuler.', 'GtkScale.', 'GtkScrollbar.', 'GtkScrolledWindow.', 'GtkSelectionData.', 'GtkSeparator.', 'GtkSocket.', 'GtkSpinButton.', 'GtkStatusBar.', 'GtkStyle.', 'GtkTable.', 'GtkTableChild.', 'GtkTearoffMenuItem.', 'GtkText.', 'GtkTipsQuery.', 'GtkToggleButton.', 'GtkToolBar.', 'GtkToolTips.', 'GtkTree.', 'GtkTreeItem.', 'GtkVBox.', 'GtkVButtonBox.', 'GtkViewport.', 'GtkVPaned.', 'GtkVRuler.', 'GtkVScale.', 'GtkVScrollbar.', 'GtkVSeparator.', 'GtkWidget.', 'GtkWindow.', 'GdkAtom.', 'GdkBitmap.', 'GdkColor.', 'GdkColormap.', 'GdkCursor.', 'GdkDragContext.', 'GdkEvent.', 'GdkEventAny.', 'GdkEventExpose.', 'GdkFont.', 'GdkGC.', 'GdkPixmap.', 'GdkVisual.', 'GdkWindow.', 'GdkCapStyle.', 'GdkCursorType.', 'GdkDragAction.', 'GdkEventMask.', 'GdkEventType.', 'GdkFill.', 'GdkFontType.', 'GdkFunction.', 'GdkInputCondition.', 'GdkJoinStyle.', 'GdkLineStyle.', 'GdkModifierType.', 'GdkRgbDither.', 'GdkSubwindowMode.', 'GdkVisualType.', 'GtkAccelFlags.', 'GtkAnchorType.', 'GtkArrowType.', 'GtkAttachOptions.', 'GtkButtonAction.', 'GtkButtonBoxStyle.', 'GtkCalendarDisplayOptions.', 'GtkCellType.', 'GtkCornerStyle.', 'GtkCTreeExpanderStyle.', 'GtkCTreeExpansionType.', 'GtkCTreeLineStyle.', 'GtkCurveType.', 'GtkDestDefaults.', 'GtkDirectionType.', 'GtkFontFilterType.', 'GtkFontType.', 'GtkJustification.', 'GtkObjectFlags.', 'GtkOrientation.', 'GtkPackerOptions.', 'GtkPackType.', 'GtkPolicyType.', 'GtkPositionType.', 'GtkPreviewType.', 'GtkProgressBarOrientation.', 'GtkProgressBarStyle.', 'GtkReliefStyle.', 'GtkResizeMode.', 'GtkScrollType.', 'GtkSelectionMode.', 'GtkShadowType.', 'GtkSideType.', 'GtkSortType.', 'GtkSpinButtonUpdatePolicy.', 'GtkSpinType.', 'GtkStateType.', 'GtkSubmenuPlacement.', 'GtkToolbarChildType.', 'GtkToolbarSpaceStyle.', 'GtkToolbarStyle.', 'GtkTreeViewMode.', 'GtkUpdateType.', 'GtkVisibility.', 'GtkWidgetFlags.', 'GtkWindowPosition.', 'GtkWindowType.');

function tryprefix($func, $prefix) {
global $classes;

$types = array('method.', 'signal.', 'property.');
$first = substr($prefix, 0, 3);
$hit = array();
$part = array();

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
		return $hit;
	}
}

function wildcard($func, $hit) {
global $classes;
	$dir = opendir("$_SERVER[DOCUMENT_ROOT]/manual");
	while(($item = readdir($dir))!== false) {
		$part = explode('.', $item);
		$gtk = $part[0];
		$class = substr($part[1], 0, 3);
		$enum = substr($part[2], 0, 3);
		$method = substr($part[3], 0, 3);
		if($gtk == $class || $gtk == $enum) {
			if(strstr($part[1], $func) || strstr($part[2], $func)) {
				if($part[2] !== "method" && $part[2] !== "property" 
						&& $part[2] !== "signal") {
				$try = "/manual/$item";
				if(file_exists("$_SERVER[DOCUMENT_ROOT]$try") &&
					!in_array($try, $hit)) {
					if(strstr($part[1], $func)) $uc = $part[1];
						else $uc = $part[2];
					for($i = 0; $i < sizeof($classes); $i++) {
						if(stristr($classes[$i], "$uc.")) $pos = $i;
					}
					$realname = $classes[$pos];
					if ($uc == $part[1])
						$try = "/manual/$part[0].$realname$part[2]";
					else
						$try = "/manual/$part[0].$part[1].$realname$part[3]";
					$hit[] = $try;
					}
				}
			}
		}

		if($part[1] == "method") {
			if(strstr($part[2], $func)) {
				$try = "/manual/$item";
				if(file_exists("$_SERVER[DOCUMENT_ROOT]$try") && !in_array($try, $hit)) $hit[] = $try;
			}
		}

		if($gtk == $class && strstr($part[3], $func)) {
			$try = "/manual/$item";
			if(file_exists("$_SERVER[DOCUMENT_ROOT]$try") && !in_array($try, $hit)) {
				for($i = 0; $i < sizeof($classes); $i++) {
					if(stristr($classes[$i], "$part[1].")) $pos = $i;
					}
				$realname = $classes[$pos];
				$try = "/manual/$part[0].$realname$part[2].$part[3].$part[4]";
				$hit[] = $try;
			}
		}
	}
	closedir($dir);
	return $hit;
}

function find_manual_page($function) {

$hit = array();

/* fast track, single return :) */
	if(strstr($function, "::")) {
		list($funcpre, $funcpost) = split("::", $function);
		$try = tryprefix($funcpost, "$funcpre.method.");
		if($try) return $try;
		}
	elseif(strtolower(substr($function, 0, 3)) == "gtk" || 
			strtolower(substr($function, 0, 3 == "gdk"))) {
		$prefix = strtolower(substr($function, 0, 3));
		$try = tryprefix($function, "$prefix.");
		if($try) return $try;
		}
	else {
/* if there's no :: or gtk in there we could be looking for anything */
		$try = wildcard($function, $hit);
		if($try) $result = array_merge($try, $result);
		}
	if($result) {
		return $result;
	}
	return "";
}

?>