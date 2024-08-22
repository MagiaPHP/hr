
<div class="list-group">
    <a href="#" class="list-group-item active">
        <?php _menu_icon("top", 'hr_fines_categories'); ?>
        <?php echo _t("Hr_fines_categories"); ?>
    </a>
    <a href="index.php?c=hr_fines_categories" class="list-group-item"><?php _t("List"); ?></a>

    <?php if (permissions_has_permission($u_rol, "hr_fines_categories", "create")) { ?>
        <a href="index.php?c=hr_fines_categories&a=add" class="list-group-item"><?php _t("Add"); ?></a> 
    <?php } ?>

</div>