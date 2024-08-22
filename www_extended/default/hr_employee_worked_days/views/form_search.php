
<form class="navbar-form navbar-left" method="get" action="index.php">

    <input type="hidden" name="c" value="hr_employee_worked_days">
    <input type="hidden" name="a" value="search">
    <input type="hidden" name="w" value="by_period">

    <div class="form-group">
        <input type="date" class="form-control" name="date_start" id="date_start" placeholder=""
        <?php echo (json_decode(_options_option('config_hr_payroll_by_month_fix_date'), true)['fix']) ? " disabled " : ""; ?>

               >
    </div>

    <div class="form-group">
        <input type="date" class="form-control" name="date_end" id="date_end" placeholder=""
        <?php echo (json_decode(_options_option('config_hr_payroll_by_month_fix_date'), true)['fix']) ? " disabled " : ""; ?>

               >
    </div>

    <button type="submit" class="btn btn-default"
    <?php echo (json_decode(_options_option('config_hr_payroll_by_month_fix_date'), true)['fix']) ? " disabled " : ""; ?>

            >
                <?php echo icon("search"); ?> 
                <?php _t("Search"); ?>
    </button>
</form>