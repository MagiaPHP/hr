<?php
/**
 * 
  <button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#modal_add_short">
  <?php _t('Add new category'); ?>
  </button>
 */
?>


<div class="modal fade" id="modal_add_short" tabindex="-1" role="dialog" aria-labelledby="modal_add_shortLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="modal_add_shortLabel">
                    <?php _t('Add new category'); ?>
                </h4>
            </div>
            <div class="modal-body">

                <?php include view('hr_fines_categories', 'form_add_short'); ?>
            </div>


        </div>
    </div>
</div>