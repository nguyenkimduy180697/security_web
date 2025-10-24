<?php

namespace Dev\Base\Http\Controllers;

use Dev\Base\Http\Controllers\Concerns\HasBreadcrumb;
use Dev\Base\Http\Controllers\Concerns\HasHttpResponse;
use Dev\Base\Http\Controllers\Concerns\HasPageTitle;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller;

class BaseController extends Controller
{
    use HasBreadcrumb;
    use HasHttpResponse;
    use HasPageTitle;
    use AuthorizesRequests;
    use DispatchesJobs;
    use ValidatesRequests;
}
