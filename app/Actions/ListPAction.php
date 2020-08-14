<?php
namespace App\Actions;

use TCG\Voyager\Actions\AbstractAction;

class ListPAction extends AbstractAction
{
    public function getTitle()
    {
        return 'List of Candidates';
    }

    public function getIcon()
    {
        // Action icon which display in left of button based on current status
        return 'voyager-people';
    }

    public function getAttributes()
    {
        // Action button class
        return [
            'class' => 'btn btn-sm btn-primary pull-right',
        ];
    }

    public function shouldActionDisplayOnDataType()
    {
        // show or hide the action button, in this case will show for posts model
        return $this->dataType->slug =='placements';
    }

    public function getDefaultRoute()
    {

        return route ('listP' ,$this->data->id);
    }
}
