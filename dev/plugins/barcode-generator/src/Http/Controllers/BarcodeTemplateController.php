<?php

namespace Dev\BarcodeGenerator\Http\Controllers;

use Dev\Base\Events\CreatedContentEvent;
use Dev\Base\Events\DeletedContentEvent;
use Dev\Base\Events\UpdatedContentEvent;
use Dev\Base\Facades\Assets;
use Dev\Base\Http\Controllers\BaseController;
use Dev\Base\Http\Responses\BaseHttpResponse;
use Dev\BarcodeGenerator\Forms\BarcodeTemplateForm;
use Dev\BarcodeGenerator\Http\Requests\BarcodeTemplateRequest;
use Dev\BarcodeGenerator\Models\BarcodeTemplate;
use Dev\BarcodeGenerator\Tables\BarcodeTemplateTable;

class BarcodeTemplateController extends BaseController
{
    public function index(BarcodeTemplateTable $table)
    {
        $this->pageTitle(trans('plugins/barcode-generator::barcode-generator.templates.name'));

        return $table->renderTable();
    }

    public function create()
    {
        $this->pageTitle(trans('plugins/barcode-generator::barcode-generator.templates.create'));

        Assets::addStylesDirectly('vendor/core/plugins/barcode-generator/css/barcode-generator.css')
            ->addScriptsDirectly('vendor/core/plugins/barcode-generator/js/barcode-generator.js');

        return BarcodeTemplateForm::create()->renderForm();
    }

    public function store(BarcodeTemplateRequest $request): BaseHttpResponse
    {
        $template = BarcodeTemplate::query()->create($request->validated());

        event(new CreatedContentEvent(BARCODE_TEMPLATE_MODULE_SCREEN_NAME, $request, $template));

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('barcode-generator.templates.index'))
            ->setNextUrl(route('barcode-generator.templates.edit', $template->getKey()))
            ->setMessage(trans('plugins/barcode-generator::barcode-generator.messages.template_created'));
    }

    public function edit(BarcodeTemplate $template)
    {
        $this->pageTitle(trans('plugins/barcode-generator::barcode-generator.templates.edit'));

        Assets::addStylesDirectly('vendor/core/plugins/barcode-generator/css/barcode-generator.css')
            ->addScriptsDirectly('vendor/core/plugins/barcode-generator/js/barcode-generator.js');

        return BarcodeTemplateForm::createFromModel($template)
            ->setMethod('PUT')
            ->setUrl(route('barcode-generator.templates.update', $template->getKey()))
            ->renderForm();
    }

    public function update(BarcodeTemplate $template, BarcodeTemplateRequest $request): BaseHttpResponse
    {
        $template->fill($request->validated());
        $template->save();

        event(new UpdatedContentEvent(BARCODE_TEMPLATE_MODULE_SCREEN_NAME, $request, $template));

        return $this
            ->httpResponse()
            ->setPreviousUrl(route('barcode-generator.templates.index'))
            ->setMessage(trans('plugins/barcode-generator::barcode-generator.messages.template_updated'));
    }

    public function destroy(BarcodeTemplate $template): BaseHttpResponse
    {
        $template->delete();

        event(new DeletedContentEvent(BARCODE_TEMPLATE_MODULE_SCREEN_NAME, request(), $template));

        return $this
            ->httpResponse()
            ->setMessage(trans('plugins/barcode-generator::barcode-generator.messages.template_deleted'));
    }
}
