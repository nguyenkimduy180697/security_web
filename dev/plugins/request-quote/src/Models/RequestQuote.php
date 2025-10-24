<?php

namespace Dev\RequestQuote\Models;

use Dev\Base\Models\BaseModel;
use Dev\Ecommerce\Models\Product;
use Dev\RequestQuote\Enums\RequestQuoteStatusEnum;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class RequestQuote extends BaseModel
{
    protected $table = 'fob_request_quotes';

    protected $fillable = [
        'product_id',
        'name',
        'email',
        'phone',
        'company',
        'quantity',
        'message',
        'status',
        'admin_notes',
    ];

    protected $casts = [
        'quantity' => 'integer',
        'status' => RequestQuoteStatusEnum::class,
    ];

    public function product(): BelongsTo
    {
        return $this->belongsTo(Product::class, 'product_id');
    }
}
