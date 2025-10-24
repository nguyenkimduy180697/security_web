<?php

namespace Dev\Sms\Tables;

use Dev\Table\Abstracts\TableAbstract;
use Dev\Table\Actions\Action;
use Dev\Table\Actions\DeleteAction;
use Dev\Table\BulkActions\DeleteBulkAction;
use Dev\Table\Columns\Column;
use Dev\Table\Columns\FormattedColumn;
use Dev\Table\Columns\IdColumn;
use Dev\Table\Columns\StatusColumn;
use Dev\Sms\Facades\Sms;
use Dev\Sms\Models\SmsLog;

class SmsLogTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(SmsLog::class)
            ->addColumns([
                IdColumn::make(),
                FormattedColumn::make('driver')
                    ->label(trans('plugins/sms-gateway::sms.logs.provider'))
                    ->getValueUsing(fn (FormattedColumn $column) => Sms::driver($column->getItem()->driver)->getName()),
                Column::make('from')
                    ->label(trans('plugins/sms-gateway::sms.logs.from')),
                Column::make('to')
                    ->label(trans('plugins/sms-gateway::sms.logs.to')),
                FormattedColumn::make('message')
                    ->label(trans('plugins/sms-gateway::sms.logs.message'))
                    ->limit(30),
                StatusColumn::make()
                    ->label(trans('plugins/sms-gateway::sms.logs.status')),
            ])
            ->addActions([
                Action::make('view')
                    ->label(trans('core/base::tables.view'))
                    ->icon('ti ti-eye')
                    ->route('sms.logs.show'),
                DeleteAction::make()->route('sms.logs.destroy'),
            ])
            ->addBulkAction(DeleteBulkAction::make());
    }
}
