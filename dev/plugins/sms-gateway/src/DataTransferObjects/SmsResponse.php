<?php

namespace Dev\Sms\DataTransferObjects;

class SmsResponse
{
    public function __construct(
        public bool $success,
        public ?string $messageId = null,
        public array $response = [],
    ) {
    }
}
