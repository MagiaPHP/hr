<?php

if (!permissions_has_permission($u_rol, $c, "read")) {
    header("Location: index.php?c=home&a=no_access");
    die("Error has permission ");
}

$id = (isset($_GET["id"]) && $_GET["id"] != "" ) ? clean($_GET["id"]) : null;
$month = (isset($_GET["month"]) && $_GET["month"] != "" ) ? clean($_GET["month"]) : date('m', strtotime('-1 month'));
$year = (isset($_GET["year"]) && $_GET["year"] != "" ) ? clean($_GET["year"]) : date('Y');
################################################################################
//fecha fijada?
$fix_date = (json_decode(_options_option('config_hr_payroll_by_month_fix_date'), true));
// si la fecha esta fijada, los meses y año sera remplazados
if ($fix_date['fix']) {
    $month = $fix_date['month'];
    $year = $fix_date['year'];
}
################################################################################

$order_col = (isset($_GET["order_col"]) && $_GET["order_col"] != "" ) ? clean($_GET["order_col"]) : "id";
$order_way = (isset($_GET["order_way"]) && $_GET["order_way"] != "" ) ? clean($_GET["order_way"]) : "desc";
$error = array();
################################################################################
// Actualizo con que columna esta ordenado 
if (isset($_GET["order_col"])) {
    $data = json_encode(array("order_col" => $order_col, "order_way" => $order_way));
    _options_push("config_hr_employee_benefits_by_month_order_col", $data, "hr_employee_benefits_by_month");
}
################################################################################
$hr_employee_benefits_by_month = null;

################################################################################
$pagination = new Pagination($page, hr_employee_benefits_by_month_search_by_year_month($year, $month));
// puede hacer falta
//$pagination->setUrl($url);
$hr_employee_benefits_by_month = hr_employee_benefits_by_month_search_by_year_month($year, $month, $pagination->getStart(), $pagination->getLimit());
################################################################################    
// lista de personas que trabajadon ese mes 

$hr_employee_worked_days = hr_employee_worked_days_search_by_year_month($year, $month);

//vardump($hr_employee_worked_days); 
//
//
//vardump(array(
//    $year, $month
//)); 



include view("hr_employee_benefits_by_month", "by_month");

