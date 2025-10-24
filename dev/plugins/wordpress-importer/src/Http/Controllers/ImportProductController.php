<?php

namespace Dev\WordpressImporter\Http\Controllers;

use Dev\DataSynchronize\Http\Controllers\ImportController;
use Dev\DataSynchronize\Importer\Importer;
use Dev\WordpressImporter\Importers\ProductImporter;

class ImportProductController extends ImportController
{
    protected function getImporter(): Importer
    {
        return ProductImporter::make();
    }
}
