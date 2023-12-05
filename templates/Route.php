<?php

namespace App\Forms\[FORM]\Routes;

use Finao\Forms\Routes\PostRoute;
use Finao\Forms\Routes\GetRoute;
use Finao\Forms\Routes\BaseRoute;
use Finao\Forms\Features\Update\Routes\PostUpdateRoute as BasePostUpdateRoute;
use Finao\Forms\Features\Edit\Routes\PostEditRoute as BasePostEditRoute;

class [NAME] extends [PARENT] {

    /**
     * Route attributes.
     *
     * @var string
     */
    public $path = '{id}/edit';
    public $name = 'postEdit';
    public $uses = 'postEdit';
}
