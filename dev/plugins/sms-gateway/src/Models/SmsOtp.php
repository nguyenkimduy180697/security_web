<?php

namespace Dev\Sms\Models;

use Dev\Base\Models\BaseModel;

class SmsOtp extends BaseModel
{
    protected $table = 'fob_otps';

    protected $fillable = [
        'identifier',
        'token',
        'validity',
        'generated_at',
    ];

    protected $casts = [
        'validity' => 'int',
        'generated_at' => 'datetime',
    ];
}
