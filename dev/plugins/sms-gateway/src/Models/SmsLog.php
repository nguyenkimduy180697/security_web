<?php

namespace Dev\Sms\Models;

use Dev\Base\Models\BaseModel;
use Dev\Sms\Enums\SmsStatus;

class SmsLog extends BaseModel
{
    protected $table = 'fob_sms_logs';

    protected $fillable = [
        'driver',
        'message_id',
        'from',
        'to',
        'message',
        'status',
        'response',
    ];

    protected $casts = [
        'status' => SmsStatus::class,
        'response' => 'array',
    ];
}
