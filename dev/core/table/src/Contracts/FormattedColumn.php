<?php

namespace Dev\Table\Contracts;

use Dev\Base\Contracts\BaseModel;
use Dev\Table\Abstracts\TableAbstract;
use stdClass;

interface FormattedColumn
{
    public function formattedValue($value): ?string;

    public function renderCell(BaseModel|stdClass|array $item, TableAbstract $table): string;
}
