<?php

namespace Dev\WordpressImporter\Http\Controllers;

use Dev\Base\Facades\Assets;
use Dev\Base\Http\Controllers\BaseController;
use Dev\Blog\Models\Category;
use Dev\WordpressImporter\Forms\WordpressImporterForm;
use Dev\WordpressImporter\Http\Requests\WordpressImporterRequest;
use Dev\WordpressImporter\Importers\ProductImporter;
use Dev\WordpressImporter\WordpressImporter;

class WordpressImporterController extends BaseController
{
    public function index()
    {
        Assets::addScriptsDirectly('vendor/core/plugins/wordpress-importer/js/wordpress-importer.js');

        $this->pageTitle(trans('plugins/wordpress-importer::wordpress-importer.name'));

        $form = WordpressImporterForm::create();
        $productImporter = null;

        if (is_plugin_active('ecommerce')) {
            $productImporter = ProductImporter::make();
        }

        return view('plugins/wordpress-importer::import', compact('form', 'productImporter'));
    }

    public function import(WordpressImporterRequest $request, WordpressImporter $wordpressImporter)
    {
        $validate = $wordpressImporter->verifyRequest($request);

        if ($validate['error']) {
            return $this
                ->httpResponse()
                ->setError()
                ->setMessage($validate['message']);
        }

        $result = $wordpressImporter->import();

        return $this
            ->httpResponse()
            ->setMessage(trans('plugins/wordpress-importer::wordpress-importer.import_success', $result));
    }

    public function ajaxCategories()
    {
        return $this
            ->httpResponse()
            ->setData(Category::query()->select('name', 'id')->paginate());
    }
}
