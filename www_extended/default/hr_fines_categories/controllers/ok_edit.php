<?php

if (!permissions_has_permission($u_rol, $c, "update")) {
    header("Location: index.php?c=home&a=no_access");
    die("Error has permission ");
}
// Recolection vars
$id = (isset($_REQUEST["id"]) && $_REQUEST["id"] != "") ? clean($_REQUEST["id"]) : false;
$category_code = (isset($_REQUEST["category_code"]) && $_REQUEST["category_code"] != "") ? clean($_REQUEST["category_code"]) : false;
$category = (isset($_REQUEST["category"]) && $_REQUEST["category"] != "") ? clean($_REQUEST["category"]) : false;
$order_by = (isset($_REQUEST["order_by"]) && $_REQUEST["order_by"] != "") ? clean($_REQUEST["order_by"]) : false;
$status = (isset($_REQUEST["status"]) && $_REQUEST["status"] != "") ? clean($_REQUEST["status"]) : false;
$redi = (isset($_POST["redi"]) && $_POST["redi"] != "" ) ? clean($_POST["redi"]) : false;
$error = array();
################################################################################
# REQUIRED
################################################################################
if (!$category_code) {
    array_push($error, 'Category_code is mandatory');
}
if (!$category) {
    array_push($error, 'Category is mandatory');
}
if (!$order_by) {
    array_push($error, 'Order_by is mandatory');
}
if (!$status) {
    array_push($error, 'Status is mandatory');
}

###############################################################################
# FORMAT
###############################################################################
if (!hr_fines_categories_is_category_code($category_code)) {
    array_push($error, 'Category_code format error');
}
if (!hr_fines_categories_is_category($category)) {
    array_push($error, 'Category format error');
}
if (!hr_fines_categories_is_order_by($order_by)) {
    array_push($error, 'Order_by format error');
}
if (!hr_fines_categories_is_status($status)) {
    array_push($error, 'Status format error');
}

###############################################################################
# CONDITIONAL
################################################################################

if (hr_fines_categories_search_by_unique("id", "category_code", $category_code)) {
    array_push($error, 'Category_code already exists in data base');
}


//if( hr_fines_categories_search($status)){
//array_push($error, "That text with that context the database already exists");
//}
################################################################################
################################################################################
################################################################################
if (!$error) {

    hr_fines_categories_edit(
            $id, $category_code, $category, $order_by, $status
    );

    switch ($redi["redi"]) {
        case 1:
            header("Location: index.php?c=hr_fines_categories");
            break;

        case 2:
            header("Location: index.php?c=hr_fines_categories&a=details&id=$id");
            break;

        case 3:
            header("Location: index.php?c=hr_fines_categories&a=edit&id=$id");
            break;

        case 4:
            header("Location: index.php?c=hr_fines_categories&a=details&id=$lastInsertId");
            break;

        case 5: // custom
            // ejemplo index.php?c=hr_fines_categories&a=ok_edit&redi[redi]=5&redi[c]=contacts&redi[a]=details&redi[params]=id%3D1022
            header("Location: index.php?c=" . $redi['c'] . "&a=" . $redi['a'] . "&" . $redi['params'] . "#5");
            break;

        default:
            header("Location: index.php?");
            break;
    }
} else {

    include view("home", "pageError");
}
