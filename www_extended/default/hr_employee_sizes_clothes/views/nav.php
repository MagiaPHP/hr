
<nav class="navbar navbar-default">
    <div class="container-fluid">

        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation hr_employee_sizes_clothes</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.php?c=hr_employee_sizes_clothes">
                <?php _menu_icon("top", 'hr_employee_sizes_clothes'); ?>
                <?php echo ( _options_option("config_menus_debug") ) ? _menus_get_file_name(__FILE__) : _t("Sizes clothes"); ?>
            </a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">


            <ul class="nav navbar-nav">
                <li>
                    <?php
                    if (modules_field_module("status", "docu")) {
                        echo docu_modal_bloc($c, $a, _menus_get_file_name(__FILE__));
                    }
                    ?>
                </li>
            </ul>



            <?php //  include view("hr_employee_sizes_clothes", "form_search", $arg = ["redi" => 1]) ?>

            <ul class="nav navbar-nav">
                <?php if (permissions_has_permission($u_rol, "config", "update")) { ?>
                    <li>
                        <a 
                            data-toggle="modal" 
                            data-target="#show_col_from_table_Modal"
                            href="#"                             
                            >
                            <span class="glyphicon glyphicon-cog"></span>
                        </a>

                        <div class="modal fade" id="show_col_from_table_Modal" tabindex="-1" role="dialog" aria-labelledby="show_col_from_table_ModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="hr_employee_sizes_clothes_addLabel">
                                            <?php _t("Columne to show"); ?>                
                                        </h4>
                                    </div>
                                    <div class="modal-body">

                                        <?php
                                        include view("hr_employee_sizes_clothes", "form_show_col_from_table");
                                        ?>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </li>                                       
                <?php } ?>

            </ul>


            <ul class="nav navbar-nav">

                <?php if (permissions_has_permission($u_rol, "export", "reasssssd")) { ?>
                    <li><a href="index.php?c=hr_employee_sizes_clothes&a=search_advanced"><?php _t("Search avanced"); ?></a></li>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            <?php echo _t("Export"); ?>
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="index.php?c=hr_employee_sizes_clothes&a=export_json"><?php _t("Json"); ?></a></li>
                            <li><a href="index.php?c=hr_employee_sizes_clothes&a=export_pdf"><?php _t("Pdf"); ?></a></li>
                            <li><a href="index.php?c=hr_employee_sizes_clothes&a=export_csv"><?php _t("CSV"); ?></a></li>
                            <li><a href="index.php?c=hr_employee_sizes_clothes&a=export_xml"><?php _t("XML"); ?></a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">Other</a></li>
                        </ul>
                    </li>
                <?php } ?>    

            </ul>




            <div class="collapse navbar-collapse" id="hr_employee_sizes_clothes_add">


                <?php
                _menus_create_menu_items_by_controller_location($c, __FILE__);
                ?>

                <?php if (permissions_has_permission($u_rol, "hr_employee_sizes_clothes", "creassssste")) { ?>     

                    <button type="button" class="btn btn-primary navbar-btn navbar-right" data-toggle="modal" data-target="#hr_employee_sizes_clothesModal">
                        <span class="glyphicon glyphicon-plus-sign"></span>
                        <?php _t("New hr_employee_sizes_clothes"); ?>
                    </button>

                    <div class="modal fade" id="hr_employee_sizes_clothesModal" tabindex="-1" role="dialog" aria-labelledby="hr_employee_sizes_clothesModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="hr_employee_sizes_clothes_addLabel">
                                        <?php _t("Add new hr_employee_sizes_clothes"); ?>                
                                    </h4>
                                </div>

                                <div class="modal-body">
                                    <?php include view("hr_employee_sizes_clothes", "form_add"); ?>
                                </div>

                            </div>
                        </div>
                    </div>

                <?php } ?>    
            </div>           
        </div>
    </div>
</nav>


