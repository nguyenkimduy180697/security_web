<?php

namespace Dev\BarcodeGenerator\Tables;

use Dev\Table\Abstracts\TableAbstract;
use Dev\Table\Actions\DeleteAction;
use Dev\Table\Actions\EditAction;
use Dev\Table\BulkActions\DeleteBulkAction;
use Dev\Table\BulkChanges\CreatedAtBulkChange;
use Dev\Table\BulkChanges\NameBulkChange;
use Dev\Table\BulkChanges\StatusBulkChange;
use Dev\Table\Columns\Column;
use Dev\Table\Columns\CreatedAtColumn;
use Dev\Table\Columns\IdColumn;
use Dev\Table\Columns\NameColumn;
use Dev\Table\Columns\StatusColumn;
use Dev\Table\Columns\YesNoColumn;
use Dev\BarcodeGenerator\Models\BarcodeTemplate;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;

class BarcodeTemplateTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(BarcodeTemplate::class)
            ->addActions([
                EditAction::make()->route('barcode-generator.templates.edit'),
                DeleteAction::make()->route('barcode-generator.templates.destroy'),
            ]);
    }

    public function query(): Relation|Builder|QueryBuilder
    {
        $query = $this
            ->getModel()
            ->query()
            ->select([
                'id',
                'name',
                'description',
                'paper_size',
                'barcode_type',
                'is_default',
                'is_active',
                'created_at',
            ]);

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        return [
            IdColumn::make(),
            NameColumn::make()->route('barcode-generator.templates.edit'),
            Column::make('description')
                ->title(trans('plugins/barcode-generator::barcode-generator.templates.description')),
            Column::make('paper_size')
                ->title(trans('plugins/barcode-generator::barcode-generator.settings.paper_size')),
            Column::make('barcode_type')
                ->title(trans('plugins/barcode-generator::barcode-generator.settings.default_barcode_type')),
            YesNoColumn::make('is_default')
                ->title(trans('plugins/barcode-generator::barcode-generator.templates.is_default')),
            StatusColumn::make('is_active')
                ->title(trans('plugins/barcode-generator::barcode-generator.templates.is_active')),
            CreatedAtColumn::make(),
        ];
    }

    public function buttons(): array
    {
        return $this->addCreateButton(route('barcode-generator.templates.create'), 'barcode-generator.templates');
    }

    public function bulkActions(): array
    {
        return [
            DeleteBulkAction::make()->permission('barcode-generator.templates'),
        ];
    }

    public function getBulkChanges(): array
    {
        return [
            NameBulkChange::make(),
            StatusBulkChange::make(),
            CreatedAtBulkChange::make(),
        ];
    }

    public function getFilters(): array
    {
        return [
            'name' => [
                'title' => trans('core/base::tables.name'),
                'type' => 'text',
                'validate' => 'required|max:120',
            ],
            'created_at' => [
                'title' => trans('core/base::tables.created_at'),
                'type' => 'datePicker',
            ],
        ];
    }
}
