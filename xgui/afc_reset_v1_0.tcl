# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "g_reset_in_cycles" -parent ${Page_0}
  ipgui::add_param $IPINST -name "g_reset_out_cycles" -parent ${Page_0}
  ipgui::add_param $IPINST -name "g_reset_positive" -parent ${Page_0}


}

proc update_PARAM_VALUE.g_reset_in_cycles { PARAM_VALUE.g_reset_in_cycles } {
	# Procedure called to update g_reset_in_cycles when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.g_reset_in_cycles { PARAM_VALUE.g_reset_in_cycles } {
	# Procedure called to validate g_reset_in_cycles
	return true
}

proc update_PARAM_VALUE.g_reset_out_cycles { PARAM_VALUE.g_reset_out_cycles } {
	# Procedure called to update g_reset_out_cycles when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.g_reset_out_cycles { PARAM_VALUE.g_reset_out_cycles } {
	# Procedure called to validate g_reset_out_cycles
	return true
}

proc update_PARAM_VALUE.g_reset_positive { PARAM_VALUE.g_reset_positive } {
	# Procedure called to update g_reset_positive when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.g_reset_positive { PARAM_VALUE.g_reset_positive } {
	# Procedure called to validate g_reset_positive
	return true
}


proc update_MODELPARAM_VALUE.g_reset_positive { MODELPARAM_VALUE.g_reset_positive PARAM_VALUE.g_reset_positive } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.g_reset_positive}] ${MODELPARAM_VALUE.g_reset_positive}
}

proc update_MODELPARAM_VALUE.g_reset_in_cycles { MODELPARAM_VALUE.g_reset_in_cycles PARAM_VALUE.g_reset_in_cycles } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.g_reset_in_cycles}] ${MODELPARAM_VALUE.g_reset_in_cycles}
}

proc update_MODELPARAM_VALUE.g_reset_out_cycles { MODELPARAM_VALUE.g_reset_out_cycles PARAM_VALUE.g_reset_out_cycles } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.g_reset_out_cycles}] ${MODELPARAM_VALUE.g_reset_out_cycles}
}

