<?php

if (!permissions_has_permission($u_rol, $c, "read")) {
    header("Location: index.php?c=home&a=no_access");
    die("Error has permission ");
}

$id = (isset($_GET["id"]) && $_GET["id"] != "" ) ? clean($_GET["id"]) : null;
$error = array();

################################################################################
################################################################################
$order_by['col'] = (isset($_GET["order_col"]) && $_GET["order_col"] != "" ) ? clean($_GET["order_col"]) : "id";
$order_by['way'] = (isset($_GET["order_way"]) && $_GET["order_way"] != "" ) ? clean($_GET["order_way"]) : "desc";
// Actualizo con que columna esta ordenado 
if (isset($_GET["order_col"])) {
    $order_by_json = json_encode(array("order_col" => $order_by['col'], "order_way" => $order_by['way']));
    _options_push("config_hr_employee_payroll_items_order_col", $order_by_json, "hr_employee_payroll_items");
}
################################################################################
################################################################################


$hr_employee_payroll_items = null;

################################################################################
$pagination = new Pagination($page, hr_employee_payroll_items_list(null, null, $order_by));
// puede hacer falta
//$pagination->setUrl($url);
$hr_employee_payroll_items = hr_employee_payroll_items_list($pagination->getStart(), $pagination->getLimit(), $order_by);
################################################################################    


include view("hr_employee_payroll_items", "hr");

if ($debug) {
    include "www/hr_employee_payroll_items/views/debug.php";
}