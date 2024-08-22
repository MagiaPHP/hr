<?php

function hr_employee_family_dependents_resumen($employee_id) {

    //  enum('Spouses', 'Children', 'Others')  
    $cargas['Spouses']['n'] = hr_employee_family_dependents_total_by_relation($employee_id, 'Spouses', 0);
    $cargas['Spouses']['h'] = hr_employee_family_dependents_total_by_relation($employee_id, 'Spouses', 1);

    $cargas['Children']['n'] = hr_employee_family_dependents_total_by_relation($employee_id, 'Children', 0);
    $cargas['Children']['h'] = hr_employee_family_dependents_total_by_relation($employee_id, 'Children', 1);

    $cargas['OthersP65']['n'] = hr_employee_family_dependents_total_by_relation($employee_id, 'Others', 0, true);
    $cargas['OthersP65']['h'] = hr_employee_family_dependents_total_by_relation($employee_id, 'Others', 1, true);

    $cargas['OthersM65']['n'] = hr_employee_family_dependents_total_by_relation($employee_id, 'Others', 0);
    $cargas['OthersM65']['h'] = hr_employee_family_dependents_total_by_relation($employee_id, 'Others', 1);

    return $cargas;
}

// SEARCH
function hr_employee_family_dependents_total_by_relation($employee_id, $relation, $handicap, $plus65 = false) {
    global $db;

    $data = null;

    // si mas de 65 

    if ($plus65) {
        // calculo edad 

        $AND_PLUS_65 = ' AND TIMESTAMPDIFF(YEAR, `birthday`, CURDATE()) > 65  ';
    } else {
        $AND_PLUS_65 = ' AND TIMESTAMPDIFF(YEAR, `birthday`, CURDATE()) < 65  ';
    }

    $sql = "SELECT COUNT(`id`) as total
        
    FROM `hr_employee_family_dependents` 
    
    WHERE ((`employee_id` = :employee_id AND `relation` = :relation AND `handicap` = :handicap ) AND `in_charge` = 1 ) $AND_PLUS_65 
        
    ORDER BY `order_by` , `id` DESC
        
";
    $query = $db->prepare($sql);
    $query->bindValue(':employee_id', $employee_id, PDO::PARAM_INT);
    $query->bindValue(':relation', $relation, PDO::PARAM_STR);
    $query->bindValue(':handicap', $handicap, PDO::PARAM_STR);
//    $query->bindValue(':txt',   "%$txt%", PDO::PARAM_STR);
//    $query->bindValue(':start', (int) $start, PDO::PARAM_INT);
//    $query->bindValue(':limit', (int) $limit, PDO::PARAM_INT);
    $query->execute();
    $data = $query->fetch();
    return $data[0] ? $data[0] : null;
}
