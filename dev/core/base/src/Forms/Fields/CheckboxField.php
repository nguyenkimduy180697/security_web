<?php

namespace Dev\Base\Forms\Fields;

use Dev\Base\Forms\FieldTypes\CheckableType;

class CheckboxField extends CheckableType
{
    protected function getTemplate(): string
    {
        return 'core/base::forms.fields.checkbox';
    }
}
