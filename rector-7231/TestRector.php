<?php

declare(strict_types=1);

namespace Maintenance;

use PhpParser\Node;
use PhpParser\Node\Expr\New_;
use Rector\Core\Application\FileSystem\RemovedAndAddedFilesCollector;
use Rector\Core\Rector\AbstractRector;
use Rector\FileSystemRector\ValueObject\AddedFileWithContent;
use Rector\PostRector\Collector\UseNodesToAddCollector;
use Rector\StaticTypeMapper\ValueObject\Type\FullyQualifiedObjectType;
use Symplify\RuleDocGenerator\ValueObject\CodeSample\CodeSample;
use Symplify\RuleDocGenerator\ValueObject\RuleDefinition;

final class TestRector extends AbstractRector
{
    private RemovedAndAddedFilesCollector $removedAndAddedFilesCollector;
    private UseNodesToAddCollector $useNodesToAddCollector;

    public function __construct(
        RemovedAndAddedFilesCollector $removedAndAddedFilesCollector,
        UseNodesToAddCollector $useNodesToAddCollector,
    ) {
        $this->removedAndAddedFilesCollector = $removedAndAddedFilesCollector;
        $this->useNodesToAddCollector = $useNodesToAddCollector;
    }

    public function getRuleDefinition(): RuleDefinition
    {
        return new RuleDefinition(
            'Test adding file.',
            [
                new CodeSample(
                    <<<'CODE_SAMPLE'
new Foo;
CODE_SAMPLE
                    ,
                    <<<'CODE_SAMPLE'
use Test\Foo;
/* … */
new Foo;
CODE_SAMPLE
                ),
            ]
        );
    }

    /**
     * @return array<class-string<Node>>
     */
    public function getNodeTypes(): array
    {
        return [New_::class];
    }

    /**
     * @param New_ $node
     */
    public function refactor(Node $node): ?Node
    {
        $new = $node;
        if (!$this->nodeNameResolver->isName($new->class, 'Foo')) {
            return null;
        }

        $this->useNodesToAddCollector->addUseImport(
            new FullyQualifiedObjectType('Test\\Foo')
        );

        // Create a fixture.
        $this->removedAndAddedFilesCollector->addAddedFile(
            new AddedFileWithContent(
                __DIR__ . '/test',
                'test'
            )
        );

        return $new;
    }
}
