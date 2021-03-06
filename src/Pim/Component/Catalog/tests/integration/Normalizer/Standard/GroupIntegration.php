<?php

namespace tests\integration\Pim\Component\Catalog\Standard;

use Test\Integration\TestCase;

/**
 * @author    Marie Bochu <marie.bochu@akeneo.com>
 * @copyright 2016 Akeneo SAS (http://www.akeneo.com)
 * @license   http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 */
class GroupIntegration extends TestCase
{
    public function testGroup()
    {
        $expected = [
            'code'   => 'groupA',
            'type'   => 'RELATED',
            'labels' => []
        ];

        $repository = $this->get('pim_catalog.repository.group');
        $serializer = $this->get('pim_serializer');

        $result = $serializer->normalize($repository->findOneByIdentifier('groupA'), 'standard');

        $this->assertSame($expected, $result);
    }
}
