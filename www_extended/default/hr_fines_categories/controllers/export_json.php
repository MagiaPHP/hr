<?php

if (!permissions_has_permission($u_rol, $c, "read")) {
    header("Location: index.php?c=home&a=no_access");
    die("Error has permission ");
}


$error = array();

if (!$error) {
    $hr_fines_categories = new Hr_fines_categories();
    $hr_fines_categories->setHr_fines_categories($id);

    include view("hr_fines_categories", "export_json");
} else {
    include view("home", "pageError");
}    
