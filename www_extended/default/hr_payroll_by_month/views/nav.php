
<nav class="navbar navbar-default">
    <div class="container-fluid">

        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Nav</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.php?c=hr_payroll_by_month&a=by_month">
                <?php _menu_icon("top", 'hr_payroll_by_month'); ?>
                <?php echo ( _options_option("config_menus_debug") ) ? _menus_get_file_name(__FILE__) : _t("Hr payroll by month"); ?>
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

            <?php include view("hr_payroll_by_month", "form_search", $arg = ["redi" => 1]) ?>

            <ul class="nav navbar-nav">

                <li>
                    <?php include "modal_fix_date.php"; ?>
                </li>


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
                                        <h4 class="modal-title" id="hr_payroll_by_month_addLabel">
                                            <?php _t("Columne to show"); ?>                
                                        </h4>
                                    </div>
                                    <div class="modal-body">

                                        <?php
                                        include view("hr_payroll_by_month", "form_show_col_from_table");
                                        ?>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </li>   

                <?php } ?>

            </ul>


            <ul class="nav navbar-nav">

                <?php if (permissions_has_permission($u_rol, "export", "readdddddddd")) { ?>

                    <li><a href="index.php?c=hr_payroll_by_month&a=search_advanced"><?php _t("Search avanced"); ?></a></li>



                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            <?php echo _t("Export"); ?>
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="index.php?c=hr_payroll_by_month&a=export_json"><?php _t("Json"); ?></a></li>
                            <li><a href="index.php?c=hr_payroll_by_month&a=export_pdf"><?php _t("Pdf"); ?></a></li>
                            <li><a href="index.php?c=hr_payroll_by_month&a=export_csv"><?php _t("CSV"); ?></a></li>
                            <li><a href="index.php?c=hr_payroll_by_month&a=export_xml"><?php _t("XML"); ?></a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">Other</a></li>
                        </ul>
                    </li>
                <?php } ?>    

            </ul>




            <div class="collapse navbar-collapse" id="hr_payroll_by_month_add">


                <?php
                _menus_create_menu_items_by_controller_location($c, __FILE__);
                ?>

                <?php if (permissions_has_permission($u_rol, "hr_payroll_by_month", "createeeeee")) { ?>     

                    <button type="button" class="btn btn-primary navbar-btn navbar-right" data-toggle="modal" data-target="#hr_payroll_by_monthModal">
                        <span class="glyphicon glyphicon-plus-sign"></span>
                        <?php _t("New hr_payroll_by_month"); ?>
                    </button>

                    <div class="modal fade" id="hr_payroll_by_monthModal" tabindex="-1" role="dialog" aria-labelledby="hr_payroll_by_monthModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="hr_payroll_by_month_addLabel">
                                        <?php _t("Add new hr_payroll_by_month"); ?>                
                                    </h4>
                                </div>

                                <div class="modal-body">
                                    <?php include view("hr_payroll_by_month", "form_add"); ?>
                                </div>

                            </div>
                        </div>
                    </div>

                <?php } ?>    
            </div>           
        </div>
    </div>
</nav>


