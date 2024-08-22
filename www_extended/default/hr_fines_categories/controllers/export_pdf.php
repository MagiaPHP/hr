<?php

if (!permissions_has_permission($u_rol, $c, "read")) {
    header("Location: index.php?c=home&a=no_access");
    die("Error has permission ");
}
$error = array();
$hr_fines_categories = null;
$hr_fines_categories = hr_fines_categories_list();
//
include view("hr_fines_categories", "export_pdf");
if ($debug) {
    include "www/hr_fines_categories/views/debug.php";
}