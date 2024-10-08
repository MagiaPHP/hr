<?php

if (!permissions_has_permission($u_rol, $c, "create")) {
    header("Location: index.php?c=home&a=no_access");
    die("Error has permission ");
}

$category_code = (isset($_POST["category_code"]) && $_POST["category_code"] != "" && $_POST["category_code"] != "null" ) ? clean($_POST["category_code"]) : null;
$category = (isset($_POST["category"]) && $_POST["category"] != "" && $_POST["category"] != "null" ) ? clean($_POST["category"]) : null;
$order_by = (isset($_POST["order_by"]) && $_POST["order_by"] != "" ) ? clean($_POST["order_by"]) : 1;
$status = (isset($_POST["status"]) && $_POST["status"] != "" ) ? clean($_POST["status"]) : 1;
$redi = (isset($_POST["redi"]) && $_POST["redi"] != "" ) ? ($_POST["redi"]) : false;
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
################################################################################
if (!$error) {
    $lastInsertId = hr_fines_categories_add(
            $category_code, $category, $order_by, $status
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
            // ejemplo index.php?c=hr_fines_categories&a=ok_add&redi[redi]=5&redi[c]=contacts&redi[a]=details&redi[params]=id%3D1022
            header("Location: index.php?c=" . $redi['c'] . "&a=" . $redi['a'] . "&" . $redi['params'] . "#5");
            break;

        default:
            header("Location: index.php?");
            break;
    }
} else {

    include view("home", "pageError");
}


