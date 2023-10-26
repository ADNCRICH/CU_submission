#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
# 

echo "This script was generated under a different operating system."
echo "Please update the PATH and LD_LIBRARY_PATH variables below, before executing this script"
exit

if [ -z "$PATH" ]; then
<<<<<<< HEAD
  PATH=D:/Programs/Xilinx/Vivado/2023.1/ids_lite/ISE/bin/nt64;D:/Programs/Xilinx/Vivado/2023.1/ids_lite/ISE/lib/nt64:D:/Programs/Xilinx/Vivado/2023.1/bin
else
  PATH=D:/Programs/Xilinx/Vivado/2023.1/ids_lite/ISE/bin/nt64;D:/Programs/Xilinx/Vivado/2023.1/ids_lite/ISE/lib/nt64:D:/Programs/Xilinx/Vivado/2023.1/bin:$PATH
=======
  PATH=D:/Xilinx/Vivado/2023.1/ids_lite/ISE/bin/nt64;D:/Xilinx/Vivado/2023.1/ids_lite/ISE/lib/nt64:D:/Xilinx/Vivado/2023.1/bin
else
  PATH=D:/Xilinx/Vivado/2023.1/ids_lite/ISE/bin/nt64;D:/Xilinx/Vivado/2023.1/ids_lite/ISE/lib/nt64:D:/Xilinx/Vivado/2023.1/bin:$PATH
>>>>>>> 3b6bdd4e5df1f64909a943b9b3c5fefc02b726d6
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

<<<<<<< HEAD
HD_PWD='D:/Code/CU/HW_Syn_Lab/Lab05/Lab05.runs/synth_1'
=======
HD_PWD='D:/AD/CU_submission/Hardware_Syn_Lab/ssob/Lab05/Lab05.runs/synth_1'
>>>>>>> 3b6bdd4e5df1f64909a943b9b3c5fefc02b726d6
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log nano_sc_system.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source nano_sc_system.tcl