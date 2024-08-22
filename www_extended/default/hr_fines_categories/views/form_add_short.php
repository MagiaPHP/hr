<?php
# MagiaPHP 
# file date creation: 2024-07-12 
//vardump($args); 
?>

<form class="form-horizontal" action="index.php" method="post" >
    <input type="hidden" name="c" value="hr_fines_categories">
    <input type="hidden" name="a" value="ok_add_short">

    <input type="hidden" name="redi[redi]" value="5">
    <input type="hidden" name="redi[c]" value="contacts">
    <input type="hidden" name="redi[a]" value="hr_employee_fines">
    <input type="hidden" name="redi[params]" value="<?php echo "id=$id"; ?>">



    <?php # category  ?>
    <div class="form-group">
        <label class="control-label col-sm-3" for="category"><?php _t("Category"); ?></label>
        <div class="col-sm-8">
            <input type="text" name="category" class="form-control" id="category" placeholder="" value="" >
        </div>	
    </div>
    <?php # /category  ?>




    <div class="form-group">
        <label class="control-label col-sm-3" for=""></label>
        <div class="col-sm-8">    
            <button type="submit" class="btn btn-default"><?php echo icon("plus"); ?> <?php _t("Add"); ?></button>
        </div>      							
    </div>      							

</form>
