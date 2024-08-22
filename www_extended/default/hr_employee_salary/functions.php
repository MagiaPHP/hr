<?php

/**
 * Doy una fecha y me da el salario de esa fecha 
 * @global type $db
 * @param type $employee_id
 * @param type $date
 * @return type
 */
function hr_employee_salary_in_date($employee_id, $date) {

    global $db;

    $sql = "
            SELECT  `month`,  `hour`
                       
            FROM `hr_employee_salary` 
            
            WHERE `employee_id` = :employee_id 
            
            AND ( :date BETWEEN `date_start` AND (IF(`date_end` IS NULL, NOW() , `date_end` )))
                        
            ORDER BY `date_start`";

    $query = $db->prepare($sql);
    $query->bindValue(':employee_id', $employee_id, PDO::PARAM_INT);
    $query->bindValue(':date', $date, PDO::PARAM_STR);

    $query->execute();
    $data = $query->fetch();
    return $data;
}

// Cual es la date_start mas reciente del salario
function hr_employee_salary_date_last_salary($employee_id) {

    global $db;
    $sql = "
            SELECT  MAX(`date_start`) as date FROM `hr_employee_salary` WHERE `employee_id` = :employee_id ";

    $query = $db->prepare($sql);
    $query->bindValue(':employee_id', $employee_id, PDO::PARAM_INT);
    $query->execute();
    $data = $query->fetch();
    return $data['date'];
}

// SEARCH
function hr_employee_salary_search_by($field, $txt, $start = 0, $limit = 999, $order_by = 'date_start') {
    global $db;
    $data = null;
    $sql = "SELECT `id`,  `employee_id`,  `month`,  `hour`,  `date_start`,  `date_end`,  `order_by`,  `status`    FROM `hr_employee_salary` 
    WHERE `$field` = '$txt' 
    ORDER BY $order_by 
    Limit  $limit OFFSET $start
";
    $query = $db->prepare($sql);
//    $query->bindValue(':field', "field", PDO::PARAM_STR);
//    $query->bindValue(':txt',   "%$txt%", PDO::PARAM_STR);
//    $query->bindValue(':start', (int) $start, PDO::PARAM_INT);
//    $query->bindValue(':limit', (int) $limit, PDO::PARAM_INT);
    $query->execute();
    $data = $query->fetchall();
    return $data;
}
