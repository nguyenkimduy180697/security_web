<?php

namespace Dev\RequestQuote\Tables;

use Dev\Table\Abstracts\TableAbstract;
use Dev\Table\Actions\DeleteAction;
use Dev\Table\Actions\ViewAction;
use Dev\Table\BulkActions\DeleteBulkAction;
use Dev\Table\Columns\Column;
use Dev\Table\Columns\CreatedAtColumn;
use Dev\Table\Columns\EmailColumn;
use Dev\Table\Columns\FormattedColumn;
use Dev\Table\Columns\IdColumn;
use Dev\Table\Columns\NameColumn;
use Dev\Table\Columns\StatusColumn;
use Dev\RequestQuote\Models\RequestQuote;
use Illuminate\Database\Eloquent\Builder;

class RequestQuoteTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(RequestQuote::class)
            ->addActions([
                ViewAction::make()->route('request-quote.show'),
                DeleteAction::make()->route('request-quote.destroy'),
            ])
            ->addBulkActions([
                DeleteBulkAction::make()->permission('request-quote.destroy'),
            ])
            ->addColumns([
                IdColumn::make(),
                NameColumn::make()
                    ->route('request-quote.show'),
                EmailColumn::make(),
                FormattedColumn::make('product_id')
                    ->title(trans('plugins/request-quote::request-quote.product'))
                    ->searchable(false)
                    ->orderable(false)
                    ->renderUsing(function (FormattedColumn $column) {
                        $item = $column->getItem();
                        if ($item->product) {
                            return sprintf(
                                '<a href="%s" target="_blank">%s</a>',
                                route('products.edit', $item->product->original_product->id),
                                e($item->product->name)
                            );
                        }

                        return null;
                    })
                    ->withEmptyState(),
                Column::make('quantity')
                    ->title(trans('plugins/request-quote::request-quote.quantity'))
                    ->searchable(false),
                StatusColumn::make(),
                CreatedAtColumn::make()
                    ->title(trans('plugins/request-quote::request-quote.submitted_at')),
            ])
            ->addFilters([])
            ->queryUsing(function (Builder $query) {
                $query->with(['product']);
            });
    }
}
