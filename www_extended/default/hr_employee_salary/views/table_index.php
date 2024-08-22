
<?php //Creation date:  2024-05-30 08:05:25      ?>

<style>
    th {
        position: -webkit-sticky;
        position: sticky;
        top: 0;
        z-index: 2;
    }
</style>

<?php
if (_options_option("config_hr_employee_salary_show_col_from_table")) {
    $colsToShow = json_decode(_options_option("config_hr_employee_salary_show_col_from_table"), true);
    ($cols_to_show_keys = array_keys($colsToShow["cols"]) );
} else {
    $cols_to_show_keys = array("id");
}
?>



<table class="table table-striped">
    <thead>
        <tr>

            <?php hr_employee_salary_index_generate_column_headers($cols_to_show_keys); ?>

        </tr>
    </thead>  
    <tbody>
        <tr>
            <?php
            if (!$hr_employee_salary) {
                message("info", "No items");
            }

            foreach ($hr_employee_salary as $hr_employee_salary_item) {
                $menu = '<div class="dropdown">
                            <button class="btn btn-default dropdown-toggle" type="button" id="dropTableIndex" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                              ' . _tr("Action") . '
                              <span class="caret"></span>
                            </button>
                            
                            <ul class="dropdown-menu" aria-labelledby="dropTableIndex">
                            
                            <?php if (permissions_has_permission($u_rol, "hr_employee_salary", "read")) { ?>
                              <li><a href="index.php?c=hr_employee_salary&a=details&id=' . $hr_employee_salary_item["id"] . '">' . _tr("Details") . '</a></li>
                            <?php } ?>
                            
                            <?php if (permissions_has_permission($u_rol, "hr_employee_salary", "update")) { ?>
                                <li><a href="index.php?c=hr_employee_salary&a=edit&id=' . $hr_employee_salary_item["id"] . '">' . _tr("Edit") . '</a></li>
                            <?php } ?>    

                             <?php if (permissions_has_permission($u_rol, "hr_employee_salary", "delete")) { ?>
                              <li role="separator" class="divider"></li>                              
                              <li><a href="index.php?c=hr_employee_salary&a=delete&id=' . $hr_employee_salary_item["id"] . '">' . _tr("Delete") . '</a></li>
                            <?php } ?>    
                            

                            </ul>
                          </div>';
                //     echo "<tr id=\"$hr_employee_salary_item[id]\">";
                // $checked_array = json_decode(_options_option("config_hr_employee_salary_show_col_from_table"), true);
//                foreach (hr_employee_salary_db_col_list_from_table($c) as $col_name) {
//                    if (isset($checked_array[$col_name]) || !isset($checked_array)) {
//                        //echo "<td>$hr_employee_salary_item[$col_name]</td>";
//                            
//                        // si una columna se llama xx
//                        if ($col_name == "xxxxxxxxxxxxxx") { // se pone un filtro en este caso la primera mayuscula
//                            echo "<td>" . hr_employee_salary_add_filter($col_name, $hr_employee_salary_item[$col_name], ucfirst($col_name)) . "</td>";
//                        } else {
//                            echo "<td>" . hr_employee_salary_add_filter($col_name, $hr_employee_salary_item[$col_name]) . "</td>";
//                        }                                                
//                    }
//                }                echo "<td>$menu</td>";
                echo "</tr>";

                //hr_employee_salary_index_generate_column_body_td($hr_employee_salary_item, $colsToShow);

                foreach ($cols_to_show_keys as $key => $col) {

                    switch ($col) {
                        case 'id':
                            echo '<td><a href="index.php?c=hr_employee_salary&a=details&id=' . $hr_employee_salary_item[$col] . '">' . $hr_employee_salary_item[$col] . '</a></td>';
                            break;
                        case 'id':
                            echo '<td>' . ($hr_employee_salary_item[$col]) . '</td>';
                            break;
                        case 'employee_id':
                            echo '<td><a href="index.php?c=contacts&a=hr_employee_salary&id=' . $hr_employee_salary_item[$col] . '">' . contacts_formated($hr_employee_salary_item[$col]) . '</a></td>';
                            break;
                        case 'month':
                            echo '<td>' . ($hr_employee_salary_item[$col]) . '</td>';
                            break;
                        case 'hour':
                            echo '<td>' . ($hr_employee_salary_item[$col]) . '</td>';
                            break;
                        case 'date_start':
                            echo '<td>' . ($hr_employee_salary_item[$col]) . '</td>';
                            break;
                        case 'date_end':
                            echo '<td>' . ($hr_employee_salary_item[$col]) . '</td>';
                            break;
                        case 'order_by':
                            echo '<td>' . ($hr_employee_salary_item[$col]) . '</td>';
                            break;
                        case 'status':
                            echo '<td>' . ($hr_employee_salary_item[$col]) . '</td>';
                            break;
                        case 'button_details':
                            echo '<td><a class="btn btn-sm btn-primary" href="index.php?c=hr_employee_salary&a=details&id=' . $hr_employee_salary_item['id'] . '">' . icon("eye-open") . ' ' . _tr('Details') . '</a></td>';
                            break;

                        case 'button_pay':
                            echo '<td><a class = "btn btn-sm btn-primary" href = "index.php?c=hr_employee_salary&a=details_payement&id=' . $hr_employee_salary_item['id'] . '">' . icon("shopping-cart") . ' ' . _tr('Pay') . '</a></td>';
                            break;

                        case 'button_edit':
                            echo '<td><a class="btn btn-sm btn-danger" href="index.php?c=hr_employee_salary&a=edit&id=' . $hr_employee_salary_item['id'] . '">' . icon("pencil") . ' ' . _tr('Edit') . '</a></td>';
                            break;

                        case 'button_print':
                            echo '<td><a class = "btn btn-sm btn-default" href = "index.php?c=hr_employee_salary&a=export_pdf&id=' . $hr_employee_salary_item['id'] . '">' . icon("print") . '</a></td>';
                            break;

                        case 'button_save':
                            echo '<td><a class = "btn btn-sm btn-default" href = "index.php?c=hr_employee_salary&a=export_pdf&way=pdf&&id=' . $hr_employee_salary_item['id'] . '">' . icon("floppy-save") . '</a></td > ';
                            break;

                        default:
                            echo '<td>' . ($hr_employee_salary[$col]) . '</td>';
                            break;
                    }
                }
            }
            ?>	
        </tr>
    </tbody>

    <?php // include view("hr_employee_salary", "table_index_form_add"); ?>



</table>
<?php
//$pagination->createHtml();
?>
