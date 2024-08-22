<?php
# MagiaPHP 
# file date creation: 2024-05-30 
?>
<?php include view("home", "header"); ?> 

<?php include "nav_details.php"; ?>

<div class="row"> 


    <div class="col-sm-12 col-md-8 col-lg-8">


        <h3 class="text-center">
            <?php _menu_icon("top", 'hr_payroll'); ?>
            <?php _t("Payroll details"); ?> : Robinson coello
        </h3>


        <?php
        if ($_REQUEST) {
            foreach ($error as $key => $value) {
                message("info", "$value");
            }
        }
        ?>


        <?php include "details_header.php"; ?>
        <?php include "details_items_details.php"; ?>





    </div>


    <div class="col-sm-12 col-md-4 col-lg-4">
        <?php include "der_details_payement.php"; ?>
    </div>


</div>

<?php include view("home", "footer"); ?>
