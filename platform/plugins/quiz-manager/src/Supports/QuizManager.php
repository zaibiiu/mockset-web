<?php

namespace Botble\QuizManager\Supports;
/*
* File Name: Rental.php
* User: Muhammad Yasir
* Project: car-rental
* Date Time: 20/10/2023 11:30
*/

class QuizManager
{
    protected $vendor_id;

    /**
     * @param mixed $vendor_id
     * @return QuizManager
     */
    public function setVendorId($vendor_id)
    {
        $this->vendor_id = $vendor_id;
        return $this;
    }

    /**
     * @return mixed
     */
    public function getVendorId()
    {
        return $this->vendor_id ?: 1;
    }
}
