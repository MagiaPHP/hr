<?php

class Payroll extends Hr_payroll {

    use Hr;

    public $_lines = array();

    public function setPayroll($id) {
        parent::setHr_payroll($id);

        //$this->setTotal_to_pay(); 
        //$this->setTag("%total_to_pay%", $this->getTotal_to_pay());
//        $this->setTag("%total_to_pay%", 1973);
        //$this->setTag("%total_to_pay%", $this->getTotal_to_pay());

        foreach (hr_payroll_items_list() as $key => $value) {
            $this->setTag('%' . $value['code'] . '%', hr_payroll_lines_value_by_payroll_id_code($this->_id, $value['code']));
            array_push($this->_tag_list, '%' . $value['code'] . '%');
        }
    }

    ////////////////////////////////////////////////////////////////////////////
    function setLines() {
        foreach (hr_payroll_lines_search_by('payroll_id', $this->_id) as $key => $line) {
            array_push($this->_lines, $line);
        }
    }

    ////////////////////////////////////////////////////////////////////////////
    function getLines() {
        return $this->_lines;
    }

    ////////////////////////////////////////////////////////////////////////////
    function template($tag) {
        //return parent::template($tag);
        return $this->getTag($tag);
    }
}
