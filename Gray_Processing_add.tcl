set mdldir [file dirname [info script]]

puts "Adding DSP Builder System Gray_Processing to project\n"

set_global_assignment -name "QIP_FILE" [file join $mdldir "Gray_Processing.qip" ]

if { [file exist [file join $mdldir "Gray_Processing_add_user.tcl" ]] } {
	source [file join $mdldir "Gray_Processing_add_user.tcl" ]
}


# Add an index file for the Librarian
set ipDir "[get_project_directory]/ip/Gray_Processing/";
if { ![file exists $ipDir] } {
	file mkdir $ipDir;
}
# Reference the file by relative path if possible
if { [file pathtype $mdldir] == "relative" } {
	set mdlIPX "../../$mdldir/Gray_Processing.ipx"
} else {
	set mdlIPX "${mdldir}/Gray_Processing.ipx"
}
set ipxFP [open "$ipDir/Gray_Processing.ipx" w]
puts $ipxFP "<library><index file='$mdlIPX'/></library>"
close $ipxFP

