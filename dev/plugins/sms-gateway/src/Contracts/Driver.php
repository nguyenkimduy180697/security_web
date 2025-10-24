<?php

namespace Dev\Sms\Contracts;

use Dev\Base\Forms\FormAbstract;

interface Driver
{
    public function getKey(): string;

    public function getName(): string;

    public function getLogo(): string;

    public function getDescription(): string;

    public function getInstructions(): string;

    public function getSettingForm(): FormAbstract;

    public function isEnabled(): bool;

    public function send(string $to, string $message): bool;

    public function normalizePhoneNumber(string $phone): string;
}
