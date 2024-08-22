<?php

if (!permissions_has_permission($u_rol, $c, "update")) {
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
if (!hr_fines_categories_is_id($id)) {
    array_push($error, 'Id format error');
}
###############################################################################
# CONDICIONAL
################################################################################
if (!hr_fines_categories_field_id("id", $id)) {
    array_push($error, "Id not exist");
}
################################################################################
################################################################################
################################################################################
if (!$error) {
    $hr_fines_categories = new Hr_fines_categories();
    $hr_fines_categories->setHr_fines_categories($id);

    include view("hr_fines_categories", "edit");
} else {
    include view("home", "pageError");
}    


