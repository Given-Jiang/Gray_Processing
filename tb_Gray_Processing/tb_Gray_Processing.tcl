set TESTBENCH "tb_Gray_Processing"
set DUT "dut"
set SIMDATA "Gray_Processing.simdata.tcl"
set outputdir "hdl"
set mdldir ".."
set importdir "../DSPBuilder_Gray_Processing_import"
set wysiwyglist "../Gray_Processing_msim_family_list.tcl"
set QUARTUS_ROOTDIR_ON_CREATE "E:/FPGA/SOC/Quartus/quartus"
# DSP Builder (Version 7.1)
# Quartus II development tool and MATLAB/Simulink Interface
# "
# Legal Notice: (C) 2001 Altera Corporation. All rights reserved.  Your use of Altera  
# Corporation's design tools, logic functions and other software and tools, and its  
# AMPP partner logic functions, and any output files any of the foregoing            
# (including device programming or simulation files), and any associated             
# documentation or information are expressly subject to the terms and conditions     
# of the Altera Program License Subscription Agreement, Altera MegaCore Function     
# License Agreement, or other applicable license agreement, including, without       
# limitation, that your use is for the sole purpose of programming logic devices     
# manufactured by Altera and sold by Altera or its authorized distributors.          
# Please refer to the applicable agreement for further details.                      
#                                                                                    

# read in the simulation data 
if { [file exist $SIMDATA ]} {
    source $SIMDATA
} else {
    error "Simulation data file $SIMDATA does not exist. This file is generated during Simulink simulation.  Please rerun simulation."  
}

# Directory Variables 
set workdir "."
set buildlibdir $workdir
if {[info exists env(QUARTUS_ROOTDIR_OVERRIDE)]} {
    set quartus_dir $env(QUARTUS_ROOTDIR_OVERRIDE)
} else {
# This is where quartus was when this script was first created.
    set quartus_dir $QUARTUS_ROOTDIR_ON_CREATE
}
set dspblibdir "$quartus_dir/libraries/vhdl/altera/"

set bForceRecompile 0

## build locations for libraries
set lpm "$buildlibdir/lpm"
set wysiwyg_components "$buildlibdir/wysiwyg_components"
set altera_mf "$buildlibdir/altera_mf"
set altera_lnsim "$buildlibdir/altera_lnsim"
set dspbuilder "$buildlibdir/dspblib"
set sgate "$buildlibdir/sgate"

# An association of device family names with the actual file list in acds hierarchy for compilation of wysiwyg libraries
set familytofiles(stratixv) [list "$quartus_dir/eda/sim_lib/stratixv_atoms.vhd" "$quartus_dir/eda/sim_lib/mentor/stratixv_atoms_ncrypt.v" "$quartus_dir/eda/sim_lib/stratixv_components.vhd" ]
set familytofiles(arriav) [list "$quartus_dir/eda/sim_lib/arriav_atoms.vhd" "$quartus_dir/eda/sim_lib/mentor/arriav_atoms_ncrypt.v" "$quartus_dir/eda/sim_lib/arriav_components.vhd"]
set familytofiles(cyclonev) [list "$quartus_dir/eda/sim_lib/cyclonev_atoms.vhd" "$quartus_dir/eda/sim_lib/mentor/cyclonev_atoms_ncrypt.v" "$quartus_dir/eda/sim_lib/cyclonev_components.vhd"]
set familytofiles(twentynm) [list "$quartus_dir/eda/sim_lib/twentynm_atoms.vhd" "$quartus_dir/eda/sim_lib/mentor/twentynm_atoms_ncrypt.v" "$quartus_dir/eda/sim_lib/twentynm_components.vhd"]

# Create ModelSim project 
if {[file exist [project env]] > 0} {project close}
cd $workdir
if {[file exist "$workdir/DspBuilder.mpf"] == 0} {
    project new $workdir DspBuilder work 
} else  {
    project open DspBuilder
}

## common procedures
proc compile_file {folder f} {
    if {[regexp {\.vhdl?$} $f] || [regexp {\.vho$} $f] } {
        vcom -93 -quiet -explicit -work $folder $f
    } elseif [regexp {\.vo?$} $f] {
        vlog -quiet -work $folder $f
    } elseif [regexp {\.sv?$} $f] {
        vlog -quiet -sv -work $folder $f
    }
}

proc compile_files {mapname folder files} {
    exec vlib $folder
    exec vmap $mapname $folder
    foreach f $files {
        if { [file exist "$f"] } {
            compile_file $folder  "$f"
        }
    }
     
}

proc compile_required {mapname folder files} {
    if { [file exist $folder] } {
        set folderatime [file mtime $folder]
        foreach f $files {
            set fileatime [file mtime $f]
            if { $fileatime > $folderatime } {          
                return "true"                   
            } 
        }   
        return "false"
    } else {
        return "true"
    }
}

proc compile_if_needed {mapname folder files forceCompile} {
    if { ($forceCompile>0) || [compile_required $mapname $folder $files] } {
        compile_files $mapname $folder $files
    }
}

proc compile_folder {intofolder foldername basedir} {
    foreach g [glob -nocomplain "$foldername/*"] {
            compile_file $intofolder "$basedir/$g"
        }
    
}

# Compile LPM VHDL library 
compile_if_needed lpm $lpm [list "$quartus_dir/eda/sim_lib/220pack.vhd" "$quartus_dir/eda/sim_lib/220model.vhd"] $bForceRecompile
exec vmap lpm $lpm

# Compile Megafunction VHDL library 
compile_if_needed altera_mf $altera_mf [list "$quartus_dir/eda/sim_lib/altera_mf_components.vhd" "$quartus_dir/eda/sim_lib/altera_mf.vhd"] $bForceRecompile
exec vmap altera_mf $altera_mf

# Compile LNSIM library 
compile_if_needed altera_lnsim $altera_lnsim [list "$quartus_dir/eda/sim_lib/altera_lnsim_components.vhd" "$quartus_dir/eda/sim_lib/altera_lnsim.sv"] $bForceRecompile
exec vmap altera_lnsim $altera_lnsim

# Compile Sgate VHDL libraries 
compile_if_needed sgate $sgate [list "$quartus_dir/eda/sim_lib/sgate_pack.vhd" "$quartus_dir/eda/sim_lib/sgate.vhd"] $bForceRecompile
exec vmap sgate $sgate

# Compile DSPBuilder Libraries
compile_if_needed altera $dspbuilder [list "$dspblibdir/alt_dspbuilder_package.vhd"] $bForceRecompile
exec vmap altera $dspbuilder

# If the file containing list of families for which there are Wysiwyg blocks used exist, then source the file and compile required wysiwyg libraries
# Note that Wysiwyg libraries for different families should be compiled into a single library named 'wysiwyg' and the name of each family should be mapped 
# to the library to have both simulation and Quartus work.
if { [file exist $wysiwyglist ]} {
    source $wysiwyglist
    if {[info exists WYSIWYG_FAMILY_LIST] && ([llength $WYSIWYG_FAMILY_LIST] > 0)} {
        set joined_fileslist []
        foreach family $WYSIWYG_FAMILY_LIST {
           set joined_fileslist [concat $joined_fileslist $familytofiles($family)]
        }
        # Compiling wysiwyg components for specified list of families
        compile_if_needed wysiwyg_components $wysiwyg_components $joined_fileslist $bForceRecompile

        # Mapping a wysiwyg name to the library, so it can be used in the designs when both Quartus and Modelsim are run
        exec vmap wysiwyg $wysiwyg_components

        # Separately mapping each different device family name to a library, so these names can be used for ModelSim only cases
        foreach family $WYSIWYG_FAMILY_LIST {
            exec vmap $family $wysiwyg_components
        }
    }
}

# Create work lib  
if {[file exist work] ==0}  {exec vlib work}

# Copy in the data files 
foreach datadir [list "$mdldir" "$outputdir" "$importdir"] {
    foreach datatype [list "hex" "trace" "mif"] {
        foreach g [glob -nocomplain "$datadir/*.$datatype"] {
            file copy -force $g .
        }
    }
}

# Add simulation models
compile_file work "$quartus_dir/dsp_builder/lib/DFFE.vhd"
compile_file work "$quartus_dir/dsp_builder/lib/TFFE.vhd"

#Compile files for simulation
compile_folder work $outputdir .
# Add all imported files
foreach g [glob -nocomplain "$importdir/*_add_msim.tcl"] {
    source $g
}
    
# remove any old test bench output files
foreach g [glob -nocomplain  "*.msim"] {
        file delete $g
    }
vsim -quiet -t $SimulationTimeResolution "work.$TESTBENCH"
if { [batch_mode] == 0 } { 
    add wave -in -out "sim:/$TESTBENCH/$DUT/*"  
    wave zoomfull
}
run $SimulationTime
