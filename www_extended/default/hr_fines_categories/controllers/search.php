<?php

if (!permissions_has_permission($u_rol, $c, "read")) {
    header("Location: index.php?c=home&a=no_access");
    die("Error has permission ");
}
$hr_fines_categories = null;
$order_col = (isset($_POST["order_col"]) && $_POST["order_col"] != "" ) ? clean($_POST["order_col"]) : "id";
$order_way = (isset($_POST["order_way"]) && $_POST["order_way"] != "" ) ? clean($_POST["order_way"]) : "desc";
$w = (isset($_GET["w"]) && $_GET["w"] != "") ? clean($_GET["w"]) : false;
$error = array();

################################################################################
################################################################################
switch ($w) {
    case "id":
        $txt = (isset($_GET["txt"]) && $_GET["txt"] != "" ) ? clean($_GET["txt"]) : false;
        $hr_fines_categories = hr_fines_categories_search_by_id($txt);
        break;

    #### --- ####################################################################
    case "by_category_code":
        $category_code = (isset($_GET["category_code"]) && $_GET["category_code"] != "" ) ? clean($_GET["category_code"]) : false;
        ################################################################################
        $pagination = new Pagination($page, hr_fines_categories_search_by("category_code", $category_code));
        // puede hacer falta
        $url = "index.php?c=hr_fines_categories&a=search&w=by_category_code&category_code=" . $category_code;
        $pagination->setUrl($url);
        $hr_fines_categories = hr_fines_categories_search_by("category_code", $category_code, $pagination->getStart(), $pagination->getLimit());
        ################################################################################ 
        break;

    case "by_category":
        $category = (isset($_GET["category"]) && $_GET["category"] != "" ) ? clean($_GET["category"]) : false;
        ################################################################################
        $pagination = new Pagination($page, hr_fines_categories_search_by("category", $category));
        // puede hacer falta
        $url = "index.php?c=hr_fines_categories&a=search&w=by_category&category=" . $category;
        $pagination->setUrl($url);
        $hr_fines_categories = hr_fines_categories_search_by("category", $category, $pagination->getStart(), $pagination->getLimit());
        ################################################################################ 
        break;

    case "by_order_by":
        $order_by = (isset($_GET["order_by"]) && $_GET["order_by"] != "" ) ? clean($_GET["order_by"]) : false;
        ################################################################################
        $pagination = new Pagination($page, hr_fines_categories_search_by("order_by", $order_by));
        // puede hacer falta
        $url = "index.php?c=hr_fines_categories&a=search&w=by_order_by&order_by=" . $order_by;
        $pagination->setUrl($url);
        $hr_fines_categories = hr_fines_categories_search_by("order_by", $order_by, $pagination->getStart(), $pagination->getLimit());
        ################################################################################ 
        break;

    case "by_status":
        $status = (isset($_GET["status"]) && $_GET["status"] != "" ) ? clean($_GET["status"]) : false;
        ################################################################################
        $pagination = new Pagination($page, hr_fines_categories_search_by("status", $status));
        // puede hacer falta
        $url = "index.php?c=hr_fines_categories&a=search&w=by_status&status=" . $status;
        $pagination->setUrl($url);
        $hr_fines_categories = hr_fines_categories_search_by("status", $status, $pagination->getStart(), $pagination->getLimit());
        ################################################################################ 
        break;

    #### --- ####################################################################

    default:
        $txt = (isset($_GET["txt"]) && $_GET["txt"] != "" ) ? clean($_GET["txt"]) : false;
        ################################################################################
        $pagination = new Pagination($page, hr_fines_categories_search($txt));
        // puede hacer falta
        $url = "index.php?c=hr_fines_categoriesa=search&w=&txt=" . $txt;
        $pagination->setUrl($url);
        $hr_fines_categories = hr_fines_categories_search($txt, $pagination->getStart(), $pagination->getLimit());
        ################################################################################ 
        //$hr_fines_categories = hr_fines_categories_search($txt);
        break;
}


include view("hr_fines_categories", "index");
