<?php
//vardump($employee['contact_id']);
if (hr_employee_money_advance_search_by_employee_year_month($employee['contact_id'], $year, $month)) {
    ?>

    <table class="table table-striped table-bordered">
        <thead>
            <tr>
                <th></th>
                <th><?php _t("Bank"); ?></th>
                <th><?php _t("Cash"); ?></th>
            </tr>
        </thead>
        <?php
        $hrmabe_total_bank = 0;
        $hrmabe_total_cash = 0;

        $total_lines = (count(hr_employee_money_advance_search_by_employee_year_month($employee['contact_id'], $year, $month)));

        foreach (hr_employee_money_advance_search_by_employee_year_month($employee['contact_id'], $year, $month) as $key => $hrmabe) {

            //vardump($hrmabe);

            echo '<tr>';

            if ($hrmabe['way'] == 'bank') {
                $hrmabe_total_bank = $hrmabe_total_bank + $hrmabe['value'];
                echo '<td>' . magia_dates_formated($hrmabe['date']) . '</td>';
                echo '<td>' . moneda($hrmabe['value']) . '</td>';
                echo '<td></td>';
            } else {
                $hrmabe_total_cash = $hrmabe_total_cash + $hrmabe['value'];
                echo '<td>' . magia_dates_formated($hrmabe['date']) . '</td>';
                echo '<td></td>';
                echo '<td>' . moneda($hrmabe['value']) . '</td>';
            }

            echo '<td>';

            $params['id'] = $hrmabe['id'];
            $params['redi'] = 5;
            $params['c'] = 'hr_employee_money_advance';
            $params['a'] = 'index';
            $params['params'] = '';
            //$params = "index.php?c=hr_employee_money_advance&a=ok_delete&id=$hrmabe[id]&redi[redi]=5&redi[c]=hr_employee_money_advance&redi[a]=index&redi[params]=";
            include view('hr_employee_money_advance', 'modal_delete', $params);
            echo'</td>';
            echo '</tr>';
        }

        if ($total_lines > 1) {


            echo '<tr>';
            echo '<td><b>' . _tr('Totals') . '</b></td>';
            echo '<td><b>' . moneda($hrmabe_total_bank) . '</b></td>';
            echo '<td><b>' . moneda($hrmabe_total_cash) . '</b></td>';
            echo '<td><b>' . moneda($hrmabe_total_cash + $hrmabe_total_bank) . '</b></td>';
            echo '</tr>';
        }
        ?>


    </table>


<?php }
?>


