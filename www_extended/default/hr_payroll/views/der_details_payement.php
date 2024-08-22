<ul class="nav nav-tabs">
    <li role="presentation" class="active"><a href="#">Home</a></li>
    <li role="presentation"><a href="#">Profile</a></li>
    <li role="presentation"><a href="#">Messages</a></li>
</ul>





<?php
vardump(_options_option('config_banks_registre'));

if (_options_option('config_banks_registre')) {
    include "der_details_payement_bank_lines.php";
} else {
    include "der_details_payement_manual.php";
}
?>





