<?php

namespace App\Forms;

use Finao\Base\Features\CreateFeature;
use Finao\Base\Features\DeleteFeature;
use Finao\Base\Features\EditFeature;
use Finao\Base\Features\EditStageFeature;
use Finao\Base\Features\ExportFeature;
use Finao\Base\Features\ManageFeature;
use Finao\Base\Features\PrintFeature;
use Finao\Base\Features\QrFeature;
use Finao\Base\Features\ReorderFeature;
use Finao\Base\Features\SetStatusFeature;
use Finao\Base\Features\ShowFeature;
use Finao\Base\Features\UpdateFeature;
use Finao\Base\Forms\BaseForm;
use Finao\Base\Forms\MultiStageForm;
use Finao\Base\Forms\MultiStageStatusForm;
use Finao\Base\Forms\SingleStageForm;
use Finao\Base\Forms\SingleStageStatusForm;
use Illuminate\Support\Facades\Route;

class [FORM]Form extends [PARENT]
{

    /**
     * An override of the prefix used for the routes' "as" name without trailing dot.
     *
     * @var string  e.g. "settings.announcement"
     */
    protected $routeAs = '[AS]';

    /**
     * An override of the controller used for the route handlers.
     *
     * @var string  e.g. "Finao\Settings\Controllers\AnnouncementController"
     */
    protected $routeController = '[CONTROLLER]';

    /**
     * An override of the form middleware.
     *
     * @var array   e.g. ['auth', 'convertnull']
     */
    protected $routeMiddleware;

    /**
     * An override of the prefix used on routes.
     * 
     * @var string  e.g. "defect"
     */
    protected $routePrefix = '[PREFIX]';

    /**
     * Tabs for manage table
     *
     * @var array
     */
    protected $tabs = [
    ];

    public function __construct(
        protected CreateFeature $create,
        protected DeleteFeature $delete,
        protected EditFeature $edit,
        protected ManageFeature $manage,
        protected ShowFeature $show,
    ) {
        parent::__construct(collect(func_get_args()));

        $this->editStage
             ->getEditStage
             ->getEditStageRoute
             ->path = '{id}/edit/{stage}/{sid?}';
        $this->editStage
             ->postEditStage
             ->postEditStageRoute
             ->path = '{id}/edit/{stage}/{sid?}';
        $this->postEdit->postEditRoute->path = 'edit';
        $this->update
             ->postUpdate
             ->postUpdateRoute
             ->path = '{id}/update/{stage?}/{stage_id?}';
        
        // Show route is publicly available.
        $show->showRoute->routeMiddleware = ['web'];
    }

    /**
     * Define the method which declares any other routes the form requires.
     *
     * @return  void
     */
    protected static function otherFormRoutes() {
    }

    /**
     * Define the method which declares any other routes the form requires.
     *
     * @return  void
     */
    protected static function otherRoutes() {
    }
}
