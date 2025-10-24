<?php

namespace Dev\Sms\Http\Controllers;

use Dev\Base\Http\Actions\DeleteResourceAction;
use Dev\Base\Http\Controllers\BaseController;
use Dev\Base\Supports\Breadcrumb;
use Dev\Sms\Models\SmsLog;
use Dev\Sms\Tables\SmsLogTable;

class SmsLogController extends BaseController
{
    protected function breadcrumb(): Breadcrumb
    {
        return parent::breadcrumb()->add(trans('plugins/sms-gateway::sms.logs.title'), route('sms.logs.index'));
    }

    public function index(SmsLogTable $smsLogTable)
    {
        $this->pageTitle(trans('plugins/sms-gateway::sms.logs.title'));

        return $smsLogTable->renderTable();
    }

    public function show(string $id)
    {
        $this->pageTitle(trans('plugins/sms-gateway::sms.logs.detail_title', ['id' => $id]));

        $smsLog = SmsLog::query()->findOrFail($id);

        return view('plugins/sms-gateway::logs.show', compact('smsLog'));
    }

    public function destroy(string $id)
    {
        $smsLog = SmsLog::query()->findOrFail($id);

        return DeleteResourceAction::make($smsLog);
    }
}
