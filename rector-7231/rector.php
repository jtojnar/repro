<?php

declare(strict_types=1);

use Maintenance\TestRector;

return static function (Rector\Config\RectorConfig $rectorConfig): void {
    $rectorConfig->rule(TestRector::class);
    $rectorConfig->paths([
        __DIR__,
    ]);
    $rectorConfig->skip([
        __DIR__ . '/vendor',
    ]);
};
