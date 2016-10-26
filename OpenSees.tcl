# 
# GiD to OpenSees Interface
#
# Lab of R/C and Masonry Structures
# School of Civil Engineering, AUTh
#
# Development team
# T. Kartalis-Kaounis, Civil Engineer AUTh
# V. Protopapadakis, Civil Engineer AUTh
# T. Papadopoulos, Civil Engineer AUTh
#
# Project coordinator
# V.K. Papanikolaou, Assistant Professor AUTh
#
#
# TCL macros
#

set VersionNumber "v1.5.0"

#
# Toolbar 1 commands
#

proc Opt1_1 { } {

	GidOpenMaterials Standard_Uniaxial_Materials
	HideInfoBar
}

proc Opt1_2 { } {

	GidOpenMaterials Uniaxial_Concrete_Materials
	HideInfoBar
}

proc Opt1_3 { } {

	GidOpenMaterials Uniaxial_Steel_Materials
	HideInfoBar
}

proc Opt1_4 { } {

	GidOpenMaterials "Multidimensional_(nD)_Materials"
	HideInfoBar
}

proc Opt1_5 { } {

	GidOpenMaterials "Section_Force-Deformation"
	HideInfoBar
}

proc Opt1_6 { } {

	GidOpenConditions Restraints
	HideInfoBar
}

proc Opt1_7 { } {

	GidOpenConditions Constraints
	HideInfoBar
}

proc Opt1_8 { } {

	GidOpenConditions Masses
	HideInfoBar
}

proc Opt1_9 { } {

	GidOpenConditions Loads
	HideInfoBar
}

proc Toolbar1 {{type "DEFAULT INSIDELEFT"}} {

    global ToolbarNames ToolbarCommands ToolbarHelp OpenSees problem_dir

    set ToolbarNames(0) "img/Toolbar/btn_Mat_Uni.png img/Toolbar/btn_Mat_UniC.png img/Toolbar/btn_Mat_UniS.png img/Toolbar/btn_Mat_ND.png img/Toolbar/btn_Mat_Section.png \
		img/Toolbar/btn_Separator.png img/Toolbar/btn_Restraints.png img/Toolbar/btn_Constraints.png img/Toolbar/btn_Mass.png img/Toolbar/btn_Loads.png \
		img/Toolbar/btn_Separator.png img/Toolbar/btn_About.png"
    set ToolbarCommands(0) [list \
		[list -np- Opt1_1] \
		[list -np- Opt1_2] \
	    [list -np- Opt1_3] \
		[list -np- Opt1_4] \
		[list -np- Opt1_5] \
		"" \
		[list -np- Opt1_6] \
		[list -np- Opt1_7] \
	    [list -np- Opt1_8] \
		[list -np- Opt1_9] \
		"" \
		"-np- VisitWeb http://gidopensees.rclab.civil.auth.gr"
	]

    set ToolbarHelp(0) { \
		"Define Standard Unixaxial Materials" \
		"Define Concrete Uniaxial Materials" \
		"Define Steel Uniaxial Materials" \
		"Define Multidimensional Materials" \
		"Define Section Force-Deformation" \
		"" \
		"Assign Restraints" \
		"Assign Constraints" \
		"Assign Masses" \
		"Assign Loads" \
		"" \
		"GiD+OpenSees website" }

    set prefix Pre
	
    set OpenSees(pretoolbarwin) [CreateOtherBitmaps MyPreBar "OpenSees Pre-Processor Toolbar 1" \
	    ToolbarNames ToolbarCommands ToolbarHelp $problem_dir Toolbar1 $type $prefix]
		AddNewToolbar "OpenSees 1 toolbar" ${prefix}MyBarWindowGeom Toolbar1 
}

proc EndToolbar1 {} {
    global OpenSees1
    
    ReleaseToolbar "OpenSees 1 toolbar"
    rename Toolbar1 ""
    
    catch { destroy $OpenSees1(pretoolbarwin) }
}

#
# Toolbar 2 commands
#

proc Opt2_1 { } {

	GidOpenConditions ZeroLength_Elements
	HideInfoBar
}

proc Opt2_2 { } {

	GidOpenMaterials Truss_Elements
	HideInfoBar
}

proc Opt2_3 { } {

	GidOpenMaterials "Beam-Column_Elements"
	HideInfoBar
}

proc Opt2_4 { } {

	GidOpenMaterials Surface_Elements
	HideInfoBar
}

proc Opt2_5 { } {

	GidOpenMaterials Solid_Elements
	HideInfoBar
}

proc Opt2_6 { } {

	GidOpenProblemData
	HideInfoBar
}

proc Opt2_7 { } {

	GiD_Process Mescape Data IDataWindow
	HideInfoBar
}

proc Opt2_8 { } {

	GiD_Process Mescape Meshing generate
	HideInfoBar
}

proc Opt2_9 { } {

	GiD_Process Mescape Utilities calculate
}

set ElemDrawStatus 0

proc Opt2_10 { } { # Switch draw elements

	global ElemDrawStatus

	switch $ElemDrawStatus {

	0 {
		GiD_Process Mescape Data Materials DrawMaterial -DrawAll-
		set ElemDrawStatus 1
	}

	1 {
		GiD_Process escape escape escape escape
		set ElemDrawStatus 0
	}
	}
}

set ConditionsDrawStatus 0

proc Opt2_11 { } { # Switch draw conditions

	global ConditionsDrawStatus

	switch $ConditionsDrawStatus {

	0 {
		GiD_Process Mescape Data Conditions DrawCond -DrawAll-
		set ConditionsDrawStatus 1
	}

	1 {
		GiD_Process escape escape escape escape
		set ConditionsDrawStatus 0
	}
	}
}

proc Opt2_12 { } {

	GiD_Process Mescape Data Intervals ChangeInterval
	UpdateInfoBar
}

proc Toolbar2 {{type "DEFAULT INSIDELEFT"}} {

    global ToolbarNames2 ToolbarCommands2 ToolbarHelp2 OpenSees2 problem_dir

    set ToolbarNames2(0) "img/Toolbar/btn_Elem_ZeroLength.png img/Toolbar/btn_Elem_Truss.png img/Toolbar/btn_Elem_Beam.png img/Toolbar/btn_Elem_Quad.png img/Toolbar/btn_Elem_Brick.png \
	    img/Toolbar/btn_Separator.png img/Toolbar/btn_Data.png img/Toolbar/btn_Interval.png img/Toolbar/btn_Mesh.png img/Toolbar/btn_Calc.png img/Toolbar/btn_Separator.png img/Toolbar/btn_ViewElem.png img/Toolbar/btn_ViewCond.png \
		img/Toolbar/btn_ActiveInterval.png"
    set ToolbarCommands2(0) [list \
		[list -np- Opt2_1] \
	    [list -np- Opt2_2] \
		[list -np- Opt2_3] \
		[list -np- Opt2_4] \
		[list -np- Opt2_5] \
		"" \
		[list -np- Opt2_6] \
		[list -np- Opt2_7] \
		[list -np- Opt2_8] \
		[list -np- Opt2_9] \
		"" \
		[list -np- Opt2_10] \
		[list -np- Opt2_11] \
		[list -np- Opt2_12]
	]

    set ToolbarHelp2(0) { \
		"Define Zero Length Elements" \
		"Define Truss Elements" \
		"Define Beam-Column_Elements" \
		"Define Surface Elements" \
		"Define Solid Elements" \
		"" \
		"Set Problem Data" \
		"Set Interval Data" \
		"Generate Mesh" \
		"Calculate" \
		"" \
		"Show/Hide Elements" \
		"Show/Hide all Conditions for active interval" \
		"Select active Interval"
	    }

    set prefix Pre

    set OpenSees2(toolbarwin) [CreateOtherBitmaps MyBar "OpenSees Pre-Processor Toolbar 2" \
	    ToolbarNames2 ToolbarCommands2 ToolbarHelp2 $problem_dir Toolbar2 $type $prefix]
		AddNewToolbar "OpenSees 2 toolbar" ${prefix}MyBarWindowGeom Toolbar2
}

proc EndToolbar2 {} {
    global OpenSees2
    
    ReleaseToolbar "OpenSees 2 toolbar"
    rename Toolbar2 ""
    
    catch { destroy $OpenSees2(toolbarwin) }
}

proc InitGIDProject { dir } {

    global MenuNames MenuEntries MenuCommands MenuAcceler
    global MenuNamesP MenuEntriesP MenuCommandsP MenuAccelerP
	global InterfaceName
	global GidPriv
	global problem_dir

	set problem_dir $dir

	foreach filename {FindMaterialNumber.tcl ZeroLength.tcl UsedMaterials.tcl RigidDiaphragm.tcl BodyConstraints.tcl tkWidgets.tcl Utilities.tcl Fibers.tcl} {
		source [file join $dir tcl $filename]
    }
	
	set InterfaceName [_ "GiD+OpenSees Interface"]

    set num [lsearch $MenuNamesP [_ "View results"]]

    if { $num == -1 } {
		WarnWin "OpenSees is not compatible with this GiD version"
		return
    }
	
	global splashdir
    set splashdir 0
	global keepsplash
    set keepsplash 0 
	
    Splash $dir
	set splashdir $dir

	OpenSees_Menu $dir

	set ipos [lsearch $MenuNames [_ "Help"]]

    if { $ipos != -1 } {
		set MenuEntries($ipos) [linsert $MenuEntries($ipos) 0 "Help on OpenSees"]
		set MenuCommands($ipos) [linsert $MenuCommands($ipos) 0 [list -np- HelpOnOpenSees $dir]]
		set MenuAcceler($ipos) [linsert $MenuAcceler($ipos) 0 ""]

		CreateTopMenus
    }

    set ipos [lsearch $MenuNamesP Help]

    if { $ipos != -1 } {
		set MenuEntriesP($ipos) [linsert $MenuEntriesP($ipos) 0 "Help on OpenSees"]
		set MenuCommandsP($ipos) [linsert $MenuCommandsP($ipos) 0 [list -np- HelpOnOpenSees $dir]]
		set MenuAccelerP($ipos) [linsert $MenuAccelerP($ipos) 0 ""]
    }

    Toolbar1
    Toolbar2 
    
	set GidPriv(ProgName) $InterfaceName
	
    GidChangeDataLabel "Conditions" ""
    GidChangeDataLabel "Local Axes" ""
	GidChangeDataLabel "Materials" "Materials/Elements Definition" 
    
    GidAddUserDataOptions "Loads" "GidOpenConditions Loads" 2
    GidAddUserDataOptions "Restraints" "GidOpenConditions Restraints" 3
	GidAddUserDataOptions "Constraints" "GidOpenConditions Constraints" 4
	GidAddUserDataOptions "Masses" "GidOpenConditions Masses" 5
	GidAddUserDataOptions "ZeroLength Elements" "GidOpenConditions ZeroLength_Elements" 6
    GidAddUserDataOptions "---" "" 8
    
	GiD_DataBehaviour materials Standard_Uniaxial_Materials disable {assign unassign}
	GiD_DataBehaviour materials Uniaxial_Steel_Materials disable {assign unassign}
	GiD_DataBehaviour materials Uniaxial_Concrete_Materials disable {assign unassign}
	GiD_DataBehaviour materials Other_Uniaxial_Materials disable {assign unassign}
	GiD_DataBehaviour materials Multidimensional_(nD)_Materials disable {assign unassign}
	GiD_DataBehaviour materials "Beam-Column_Elements" geomlist {lines}
	GiD_DataBehaviour materials "Truss_Elements" geomlist {lines}
	GiD_DataBehaviour materials Surface_Elements geomlist {surfaces}
	GiD_DataBehaviour materials Solid_Elements geomlist {volumes}
	GiD_DataBehaviour materials "Section_Force-Deformation" disable {assign unassign}	
	
    GiDMenu::UpdateMenus

	after 1000 "{UpdateInfoBar}"
}

proc AfterRunCalculation { basename dir problemtypedir where error errorfilename } {

	if { [GidUtils::AreWindowsDisabled] } {
		return
	}

	loadProjectDirPath { "" }

	global GiDProjectDir GiDProjectName
	set filename [file join $GiDProjectDir OpenSees "$GiDProjectName.log"]
	set fexists [file exist $filename]

	switch $fexists {
	1 {
		CheckLogFile $GiDProjectDir $GiDProjectName
		}
	0 {
		AnalysisErrorInformationWindow "Error1"
		}
	}
}

proc CheckLogFile { projectDir projectName } {

	set file "$projectDir/OpenSees/$projectName.log"
	
	set fp [open $file r]
	set file_data [read $fp]
	close $fp 
	set data [split $file_data " "]
	foreach word $data {
		if { $word=="error" } {
			AnalysisErrorInformationWindow "Error2"
		}
	}
	return 
}

proc AnalysisErrorInformationWindow { analError } {

	if { [GidUtils::AreWindowsDisabled] } {
		return
	}
	
	switch $analError {
		"Error1" {
				set w .gid.win_example
				InitWindow $w [= "Analysis Error"] ErrorInfo "" "" 1
				if { ![winfo exists $w] } return ;# windows disabled || usemorewindows == 0
				ttk::frame $w.top
				ttk::label $w.top.title_text -text [= "\n\t\tAnalysis did not run !"] 
				ttk::frame $w.information -relief raised
				ttk::label $w.information.errormessage -text [= "Please check generated .tcl file and report any issues to\nhttps://github.com/rclab-auth/gidopensees/issues"]
				ttk::frame $w.bottom
				ttk::button $w.bottom.continue -text [= "Continue"] -command "destroy $w"
				grid $w.top.title_text -sticky ew
				grid $w.top -sticky new
				grid $w.information.errormessage -sticky w -padx 6 -pady 6
				grid $w.information -sticky nsew
				grid $w.bottom.continue -padx 6
				grid $w.bottom -sticky sew -padx 6 -pady 6
				if { $::tcl_version >= 8.5 } { grid anchor $w.bottom center }
				grid rowconfigure $w 1 -weight 1
				grid columnconfigure $w 0 -weight 1
		}
		"Error2" {
				set w .gid.win_example
				InitWindow $w [= "Analysis Error"] ErrorInfo "" "" 1
				if { ![winfo exists $w] } return ;# windows disabled || usemorewindows == 0
				ttk::frame $w.top
				ttk::label $w.top.title_text -text [= "\n\t\t\tAnalysis finished with errors !"]
				ttk::frame $w.information -relief raised
				ttk::label $w.information.errormessage -text [= "Errors were reported during analysis, please check generated .log file for more information"]
				ttk::frame $w.bottom
				ttk::button $w.bottom.continue -text [= "Continue"] -command "destroy $w"
				ttk::button $w.bottom.readlog -text [= "Open Log file"] -command "OpenLogFile"
				grid $w.top.title_text -sticky ew
				grid $w.top -sticky new
				grid $w.information.errormessage -sticky w -padx 6 -pady 6
				grid $w.information -sticky nsew
				grid $w.bottom.continue $w.bottom.readlog -padx 6
				grid $w.bottom -sticky sew -padx 6 -pady 6
				if { $::tcl_version >= 8.5 } { grid anchor $w.bottom center }
				grid rowconfigure $w 1 -weight 1
				grid columnconfigure $w 0 -weight 1
		}
	}
}

proc OpenLogFile { } {

	loadProjectDirPath { "" }

	global GiDProjectDir GiDProjectName
	set filename [file join $GiDProjectDir OpenSees "$GiDProjectName.log"]
	set fexists [file exist $filename]

	if { $fexists==1 } {
		exec {*}[auto_execok start] "" "$GiDProjectDir/OpenSees/$GiDProjectName.log"
	}
}

proc EndGIDProject {} {
    EndToolbar1
	EndToolbar2
}

proc HelpOnOpenSees { dir } {

    WarnWin [join [list "To obtain help for OpenSees, check the latest news in " \
                        "http://opensees.berkeley.edu/wiki/index.php/Main_Page "]]
}

proc getGiDProjectName {} {

	global GiDProjectName
	return $GiDProjectName
}

proc Splash { dir } {

    global GIDDEFAULT
	global keepsplash
	global VersionNumber

    if { [.gid.central.s disable windows] } { return }

    if { [winfo exist .splash]} {
		destroy .splash
		update
    }

    toplevel .splash
    
    set im [image create photo -file [file join $dir img/Toolbar/Splash.png]]

    set x [expr [winfo rootx .gid.central.s] + [winfo width .gid.central.s] / 2 - [image width $im] / 2]
    set y [expr [winfo rooty .gid.central.s] + [winfo height .gid.central.s] / 2 - [image height $im] / 2 ]

    wm geom .splash +$x+$y

    wm transient .splash .gid.central.s
    wm overrideredirect .splash 1
    pack [label .splash.l -image $im -bd 0]
    
    label .splash.lv -text $VersionNumber -background #292929 -foreground #FFFFD4  -font "calibri 11"
    place .splash.lv -x 324 -y 69

    #bind .splash <Button-1> "destroy .splash"
    #bind .splash <KeyPress> "destroy .splash"

    raise .splash

    after 3000 "if { (!$keepsplash) && [winfo exist .splash] } { 
		destroy .splash
		raise .gid
    }"
}

proc UpdateInfoBar { } {

	# remove bindings

	bind .gid <Configure>  {}
	bind .gid <Activate>   {}
	bind .gid <Deactivate> {}
    bind .gid <Map>        {}

	global problem_dir
	global VersionNumber

    if { [winfo exist .info]} {
	    destroy .info
	    update
    }

	# create toplevel

	toplevel .info
	
	wm attributes .info -topmost 1
	wm overrideredirect .info 1

	wm transient .info .gid

	.info configure -background #292929 
	.info configure -bd 0

	# set infobar geometry

    set x [winfo rootx .gid.central.s]
    set y [winfo rooty .gid.central.s]
	set w [winfo width .gid.central.s] 

	set geom "[winfo width .gid.central.s]x25+$x+$y"

	wm geometry .info $geom

	# set infobar rext

	set dim "[GiD_AccessValue get gendata "Dimensions"]D/[GiD_AccessValue get gendata "DOF"]DOF"

	set n [GiD_Info intvdata num]
	set act "Active Interval : [format "%2d" [lindex $n 0]]"

	# create infobar canvas

	canvas .info.c -width $w -height 25 -background #292929

	.info.c create line  0  24  $w 24 -fill #1A5B6B
	.info.c create line  60  0  60 52 -fill #1A5B6B
	.info.c create line 140  0 140 24 -fill #1A5B6B
	.info.c create line 280  0 280 24 -fill #1A5B6B

	.info.c create text  30 12 -text $VersionNumber -font "calibri 12" -fill #C2C5CA -anchor center 
	.info.c create text 100 12 -text $dim           -font "calibri 12" -fill #C2C5CA -anchor center 
	.info.c create text 210 12 -text $act           -font "calibri 12" -fill #C2C5CA -anchor center

	pack .info.c

	raise .info .gid

	# add bindings

	bind .gid <Configure>  {RefreshInfoBar}
	bind .gid <Activate>   {RefreshInfoBar}
	bind .gid <Deactivate> {HideInfoBar}
    bind .gid <Map>        {UpdateInfoBar}

	focus .gid.central.s
	update
}

proc RefreshInfoBar { } {

    set x [winfo rootx .gid.central.s]
    set y [winfo rooty .gid.central.s]
	set w [winfo width .gid.central.s]

	set geom "[winfo width .gid.central.s]x25+$x+$y"

	wm geometry .info $geom

    raise .info
	update
}

proc HideInfoBar { } {

    lower .info
	update
}