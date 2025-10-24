<?php

namespace Dev\Table\Columns;

use Dev\Base\Facades\BaseHelper;
use Dev\Table\Contracts\FormattedColumn as FormattedColumnContract;
use Carbon\Carbon;

class DateColumn extends FormattedColumn implements FormattedColumnContract
{
    protected string $dateFormat;

    protected bool $isHumanReadable = false;

    public static function make(array|string $data = [], string $name = ''): static
    {
        return parent::make($data, $name)
            ->type('date')
            ->width(100)
            ->withEmptyState();
    }

    public function dateFormat(string $format): static
    {
        $this->dateFormat = $format;

        return $this;
    }

    public function diffForHumans(): static
    {
        $this->isHumanReadable = true;

        return $this;
    }

    public function formattedValue($value): string
    {
        if (! $value) {
            return '';
        }

        if ($this->isHumanReadable) {
            return Carbon::parse($value)->diffForHumans();
        }

        return BaseHelper::formatDate($value, $this->dateFormat ?? BaseHelper::getDateFormat());
    }
}
