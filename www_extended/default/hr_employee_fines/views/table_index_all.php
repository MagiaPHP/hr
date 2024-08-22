<br>
<p><?php _t("List of all company workers"); ?></p>


<style>
    th {
        position: -webkit-sticky;
        position: sticky;
        top: 0;
        z-index: 2;
    }
</style>


<table class="table table-striped">
    <thead>
        <tr class="info">                              
            <th><?php _t("Worker"); ?></th>            
            <th></th>
        </tr>
    </thead>

    <tbody>
        <?php
        foreach (employees_list_by_company($u_owner_id) as $key => $employee) {


            echo '<tr>';
            echo '<td><a href="index.php?c=contacts&a=hr_employee_fines&id=' . $employee['contact_id'] . '">' . contacts_formated($employee['contact_id']) . '</a></td>';

            echo '<td>';
            include "part_table_index_all.php";
            include 'modal_add.php';
            echo '</td>';

            echo '</tr>';
        }
        ?>	
    </tbody>
</table>
