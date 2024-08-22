<?php

if (!permissions_has_permission($u_rol, $c, "read")) {
    header("Location: index.php?c=home&a=no_access");
    die("Error has permission ");
}

$id = (isset($_REQUEST["id"]) && $_REQUEST["id"] != "" ) ? clean($_REQUEST["id"]) : false;

$error = array();

###############################################################################
# REQUERIDO
################################################################################
if (!$id) {
    array_push($error, "Id is mandatory");
}
###############################################################################
# FORMAT
################################################################################
if (!hr_payroll_is_id($id)) {
    array_push($error, 'Id format error');
}
###############################################################################
# CONDICIONAL
################################################################################
if (!hr_payroll_field_id("id", $id)) {
    array_push($error, "Id is mandatory");
}
################################################################################
################################################################################
################################################################################
################################################################################
if (!$error) {
    $hr_payroll = new Payroll();
    $hr_payroll->setPayroll($id);
    $hr_payroll->setLines();

//    vardump(get_class_methods($hr_payroll)); 
    //vardump($hr_payroll->calculate_formule('%total_to_pay%')); 



    include view("hr_payroll", "details");
} else {
    include view("home", "pageError");
}    

