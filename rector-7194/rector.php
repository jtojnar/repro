<?php

declare(strict_types=1);

use Rector\CodeQuality\Rector\Class_\InlineConstructorDefaultToPropertyRector;
use Rector\Config\RectorConfig;
use Rector\Nette\Set\NetteSetList;
use Rector\Set\ValueObject\LevelSetList;

return static function(RectorConfig $rectorConfig): void {
	$rectorConfig->paths([
		__DIR__ . '/test.php',
	]);

	$rectorConfig->sets([
		NetteSetList::NETTE_30,
	]);
};
