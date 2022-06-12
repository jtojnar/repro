<?php

declare(strict_types=1);

return static function (Rector\Config\RectorConfig $rectorConfig): void {
    $rectorConfig->rule(Rector\PSR4\Rector\FileWithoutNamespace\NormalizeNamespaceByPSR4ComposerAutoloadRector::class);
    $rectorConfig->rule(Rector\PostRector\Rector\ClassRenamingPostRector::class);
    $rectorConfig->rule(Rector\PostRector\Rector\NameImportingPostRector::class);
    $rectorConfig->rule(Rector\PostRector\Rector\UseAddingPostRector::class);

    $rectorConfig->paths([
        __DIR__ . '/src',
    ]);
};
