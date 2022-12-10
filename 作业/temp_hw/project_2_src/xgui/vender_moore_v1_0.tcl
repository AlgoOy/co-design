# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "S0" -parent ${Page_0}
  ipgui::add_param $IPINST -name "S10" -parent ${Page_0}
  ipgui::add_param $IPINST -name "S15" -parent ${Page_0}
  ipgui::add_param $IPINST -name "S20" -parent ${Page_0}
  ipgui::add_param $IPINST -name "S5" -parent ${Page_0}


}

proc update_PARAM_VALUE.S0 { PARAM_VALUE.S0 } {
	# Procedure called to update S0 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.S0 { PARAM_VALUE.S0 } {
	# Procedure called to validate S0
	return true
}

proc update_PARAM_VALUE.S10 { PARAM_VALUE.S10 } {
	# Procedure called to update S10 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.S10 { PARAM_VALUE.S10 } {
	# Procedure called to validate S10
	return true
}

proc update_PARAM_VALUE.S15 { PARAM_VALUE.S15 } {
	# Procedure called to update S15 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.S15 { PARAM_VALUE.S15 } {
	# Procedure called to validate S15
	return true
}

proc update_PARAM_VALUE.S20 { PARAM_VALUE.S20 } {
	# Procedure called to update S20 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.S20 { PARAM_VALUE.S20 } {
	# Procedure called to validate S20
	return true
}

proc update_PARAM_VALUE.S5 { PARAM_VALUE.S5 } {
	# Procedure called to update S5 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.S5 { PARAM_VALUE.S5 } {
	# Procedure called to validate S5
	return true
}


proc update_MODELPARAM_VALUE.S0 { MODELPARAM_VALUE.S0 PARAM_VALUE.S0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.S0}] ${MODELPARAM_VALUE.S0}
}

proc update_MODELPARAM_VALUE.S5 { MODELPARAM_VALUE.S5 PARAM_VALUE.S5 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.S5}] ${MODELPARAM_VALUE.S5}
}

proc update_MODELPARAM_VALUE.S10 { MODELPARAM_VALUE.S10 PARAM_VALUE.S10 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.S10}] ${MODELPARAM_VALUE.S10}
}

proc update_MODELPARAM_VALUE.S15 { MODELPARAM_VALUE.S15 PARAM_VALUE.S15 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.S15}] ${MODELPARAM_VALUE.S15}
}

proc update_MODELPARAM_VALUE.S20 { MODELPARAM_VALUE.S20 PARAM_VALUE.S20 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.S20}] ${MODELPARAM_VALUE.S20}
}

