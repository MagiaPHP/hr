        
<form class="navbar-form navbar-left" method="get" action="index.php">
    <input type="hidden" name="c" value="hr_payroll_by_month">
    <input type="hidden" name="a" value="by_month">        

    <div class="form-group">
        <label class="sr-only" for="month"></label>
        <select 
            class="form-control" 
            name="month"
            id='month'
            <?php echo (json_decode(_options_option('config_hr_payroll_by_month_fix_date'), true)['fix']) ? " disabled " : ""; ?>
            >
                <?php
                for ($m = 1; $m < 13; $m++) {
                    $month_selected = ($m == $month) ? " selected " : "";
                    echo '<option value="' . $m . '" ' . $month_selected . '>' . _tr(magia_dates_month($m)) . '</option>';
                }
                ?>


        </select>
    </div>

    <div class="form-group">
        <label class="sr-only" for="year"></label>
        <select 
            class="form-control" 
            name="year"
            id='year'
            <?php echo (json_decode(_options_option('config_hr_payroll_by_month_fix_date'), true)['fix']) ? " disabled " : ""; ?>
            >
                <?php
                for ($y = 2020; $y < date('Y') + 1; $y++) {
                    $year_selected = ($y == $year) ? " selected " : "";
                    echo '<option value="' . $y . '" ' . $year_selected . '>' . $y . '</option>';
                }
                ?>
        </select>
    </div>

        <button 
            type="submit" 
            class="btn btn-default"
            <?php echo (json_decode(_options_option('config_hr_payroll_by_month_fix_date'), true)['fix']) ? " disabled " : ""; ?>
            >
                <?php echo icon("refresh"); ?> 
                <?php _t("Change"); ?>
        </button>

    
</form>


