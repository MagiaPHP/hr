
<button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#hr_fines_categories_delete_<?php echo $hr_fines_categories_item['id'] ?>">
    <?php echo icon("trash"); ?>
    <?php _t("Delete"); ?>
</button>


<div class="modal fade" id="hr_fines_categories_delete_<?php echo $hr_fines_categories_item['id'] ?>" tabindex="-1" role="dialog" aria-labelledby="hr_fines_categories_edit_Label">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="hr_fines_categories_edit_Label"> <?php _t("Delete"); ?>
                    <?php echo $hr_fines_categories_item['id'] ?>    
                </h4>
            </div>

            <div class="modal-body">      
                <p>
                    <?php _t("Are you sure you want to delete"); ?>?
                </p>      
            </div>

            <div class="modal-footer"> 


                <?php
                switch ($c) {
                    case "contacts":
                        $url_redi = "index.php?c=contacts&a=hr_fines_categories&id=id=$id";
                        break;

                    case "hr_fines_categories":
                        $url_redi = "index.php?c=hr_fines_categories&a=delete&id=$hr_fines_categories_item[id]&redi[redi]=1&";
                        break;

                    default:
                        $url_redi = "index.php?c=hr_fines_categories&a=delete&id=$hr_fines_categories_item[id]&redi[redi]=1&";
                        break;
                }
                ?>        
                <a class="btn btn-danger" href="<?php echo $url_redi; ?>"><?php echo icon("trash"); ?> <?php echo _t("Delete"); ?></a>


            </div>


        </div>
    </div>
</div>