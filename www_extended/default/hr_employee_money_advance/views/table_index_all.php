<style>
    th {
        position: -webkit-sticky;
        position: sticky;
        top: 0;
        z-index: 2;
    }
</style>


<table class="table table-striped">
    <thead>
        <tr class="info">                              
            <th><?php _t("Worker"); ?></th>
            <th><?php _t("Total hours worked"); ?> : <?php echo magia_dates_month($month) . " - $year"; ?></th>                        
            <th><?php _t("Remuneration by hour"); ?></th>
            <th><?php _t("Total in this month"); ?></th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <?php
        foreach (employees_list_by_company($u_owner_id) as $key => $employee) {

            $total_worked_hours = hr_employee_worked_days_total_hours_worked_by_year_month_employee($year, $month, $employee['contact_id'])['hours'];

            $salary = hr_employee_salary_in_date($employee['contact_id'], "$year-$month-01");

            if (isset($salary) && $salary) {
                $salary_month = $salary['month'];
                $salary_hour = $salary['hour'];
            }

            $total_this_month = ($total_worked_hours * $salary_hour );

            echo '<tr>';
            echo '<td><a href="index.php?c=contacts&a=hr_employee_money_advance&id=' . $employee['contact_id'] . '">' . contacts_formated($employee['contact_id']) . '</a></td>';
            echo '<td><a href="index.php?c=contacts&a=hr_employee_worked_days&id=' . $employee['contact_id'] . '">' . ($total_worked_hours) . '</a></td>';
            echo '<td><a href="index.php?c=contacts&a=hr_employee_salary&id=' . $employee['contact_id'] . '">' . moneda($salary_hour) . '</a></td>';
            echo '<td>' . moneda($total_this_month) . '</td>';
            echo '<td>';

            include "part_table_money_advance.php";
            include 'modal_add.php';
            echo '</td>';
            echo '</tr>';
        }




        /**

          foreach ($hr_employee_money_advance as $hr_employee_money_advance_item) {

          echo "</tr>";

          foreach ($cols_to_show_keys as $key => $col) {

          switch ($col) {
          case 'id':
          echo '<td><a href="index.php?c=hr_employee_money_advance&a=details&id=' . $hr_employee_money_advance_item[$col] . '">' . $hr_employee_money_advance_item[$col] . '</a></td>';
          break;
          case 'id':
          echo '<td>' . ($hr_employee_money_advance_item[$col]) . '</td>';
          break;
          case 'employee_id':
          echo '<td><a href="index.php?c=contacts&a=hr_employee_money_advance&id=' . $hr_employee_money_advance_item[$col] . '">' . contacts_formated($hr_employee_money_advance_item[$col]) . '</a></td>';
          break;
          case 'date':
          echo '<td>' . ($hr_employee_money_advance_item[$col]) . '</td>';
          break;

          case 'value':

          echo '<td>';
          echo ($hr_employee_money_advance_item[$col]);

          //include "modal_value_update.php";

          echo '</td>';

          break;

          case 'way':
          echo '<td  >' . ucfirst($hr_employee_money_advance_item[$col]) . '</td>';
          break;

          case 'order_by':
          echo '<td>' . ($hr_employee_money_advance_item[$col]) . '</td>';
          break;

          case 'status':
          echo '<td>' . ($hr_employee_money_advance_item[$col]) . '</td>';
          break;
          case 'button_details':
          echo '<td><a class="btn btn-sm btn-primary" href="index.php?c=hr_employee_money_advance&a=details&id=' . $hr_employee_money_advance_item['id'] . '">' . icon("eye-open") . ' ' . _tr('Details') . '</a></td>';
          break;

          case 'button_pay':

          if ($hr_employee_money_advance_item["way"] == 'bank') {
          echo '<td><a class = "btn btn-sm btn-primary" href = "index.php?c=hr_employee_money_advance&a=details_payment&id=' . $hr_employee_money_advance_item['id'] . '">' . icon("shopping-cart") . ' ' . _tr('Pay') . '</a></td>';
          } else {
          echo "<td></td>";
          }

          break;

          case 'button_edit':
          echo '<td><a class="btn btn-sm btn-danger" href="index.php?c=hr_employee_money_advance&a=edit&id=' . $hr_employee_money_advance_item['id'] . '">' . icon("pencil") . ' ' . _tr('Edit') . '</a></td>';
          break;

          case 'button_print':
          echo '<td><a class = "btn btn-sm btn-default" href = "index.php?c=hr_employee_money_advance&a=export_pdf&id=' . $hr_employee_money_advance_item['id'] . '">' . icon("print") . '</a></td>';
          break;

          case 'button_save':
          echo '<td><a class = "btn btn-sm btn-default" href = "index.php?c=hr_employee_money_advance&a=export_pdf&way=pdf&&id=' . $hr_employee_money_advance_item['id'] . '">' . icon("floppy-save") . '</a></td > ';
          break;

          case 'modal_delete':
          echo '<td>';

          $params = "index.php?c=hr_employee_money_advance&a=ok_delete&id=$hr_employee_money_advance_item[id]&redi[redi]=5&redi[c]=hr_employee_money_advance&redi[a]=search&redi[params]=" . urlencode("w=by_year_month&month=$month&year=$year");

          include "modal_delete.php";
          echo '</td>';
          //echo '<td><a class = "btn btn-sm btn-default" href = "index.php?c=hr_employee_money_advance&a=export_pdf&way=pdf&&id=' . $hr_employee_money_advance_item['id'] . '">' . icon("floppy-save") . '</a></td > ';
          break;

          default:
          echo '<td>' . ($hr_employee_money_advance[$col]) . '</td>';
          break;
          }
          }
          }
         * 
         */
        ?>	

    </tbody>

    <?php // include view("hr_employee_money_advance", "table_index_form_add");     ?>



</table>
<?php
//$pagination->createHtml();
?>
