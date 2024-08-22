<ul class="nav nav-tabs">

    <li role="presentation" <?php echo ($c == 'hr_payroll_by_month') ? '  class="active" ' : ''; ?>>
        <a href="index.php?c=hr_payroll_by_month&a=by_month"><?php _t("Solde"); ?></a></li>



    <li role="presentation" <?php echo ($c == 'hr_employee_payroll_items') ? '  class="active" ' : ''; ?>>
        <a href="index.php?c=hr_employee_payroll_items&a=hr"><?php _t("Precompte"); ?></a></li>




    <li role="presentation" <?php echo ($c == 'hr_employee_benefits_by_month') ? '  class="active" ' : ''; ?>>
        <a href="index.php?c=hr_employee_benefits_by_month&a=by_month"><?php _t("Meal vouchers"); ?></a></li>



    <li role="presentation" <?php echo ($c == 'hr_employee_fines') ? '  class="active" ' : ''; ?>>
        <a href="index.php?c=hr_employee_fines"><?php _t("Fine / withdrawal"); ?></a></li>    



    <li role="presentation" <?php echo ($c == 'hr_employee_money_advance') ? '  class="active" ' : ''; ?>>
        <a href="index.php?c=hr_employee_money_advance"><?php _t("Money advance"); ?></a></li>    



    <li role="presentation" <?php echo ($c == 'veh_vehicles_drivers') ? '  class="active" ' : ''; ?>>
        <a href="index.php?c=veh_vehicles_drivers&a=hr"><?php _t("Drivers"); ?></a></li>    




</ul>
