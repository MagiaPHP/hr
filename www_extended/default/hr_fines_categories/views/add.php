<?php
# MagiaPHP 
# file date creation: 2024-07-12 
?>
<?php include view("home", "header"); ?>  

<div class="row">
    <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
        <?php include "izq.php"; ?></div>

    <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
        <h1>
            <?php _menu_icon("top", 'hr_fines_categories'); ?> 
            <?php _t("Add"); ?>
        </h1>
        <?php include "form_add.php"; ?>
    </div>

    <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
        <?php include "der.php"; ?>

    </div>
</div>

<?php include view("home", "footer"); ?>

