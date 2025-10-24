<?php

namespace Dev\Sms\Enums;

use Dev\Base\Facades\BaseHelper;
use Dev\Base\Supports\Enum;

class SmsStatus extends Enum
{
    public const PENDING = 'pending';

    public const SUCCESS = 'success';

    public const FAILED = 'failed';

    protected static $langPath = 'plugins/sms-gateway::sms.enums.log_statuses';

    public function toHtml(): string
    {
        $color = match ($this->value) {
            self::PENDING => 'warning',
            self::SUCCESS => 'success',
            self::FAILED => 'danger',
            default => null,
        };

        return BaseHelper::renderBadge($this->label(), $color);
    }
}
