<?php

declare(strict_types=1);

return static function (Rector\Config\RectorConfig $rectorConfig): void {
    $rectorConfig->paths([
        __DIR__,
    ]);
    $rectorConfig->skip([
        __DIR__ . '/vendor',
    ]);

    $rectorConfig->rule(Rector\Php74\Rector\LNumber\AddLiteralSeparatorToNumberRector::class);
};
