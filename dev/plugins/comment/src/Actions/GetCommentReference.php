<?php

namespace Dev\Comment\Actions;

use Dev\Base\Models\BaseModel;

class GetCommentReference
{
    public function __invoke(string $referenceType, string $referenceId): BaseModel
    {
        abort_unless(class_exists($referenceType), 404);

        /**
         * @var BaseModel $reference
         */
        $reference = $referenceType::query()->findOrFail($referenceId);

        return $reference;
    }
}
