<?php

namespace Framework\Adapter\Cache;

interface CacheAdapterInterface
{
    /**
     * @param string|array $path
     * @return self
     */
    public function setPath(string|array $path): self;

    /**
     * @param string|null $field
     * @return string|array|null
     */
    public function get(?string $field = null): mixed;

    /**
     * @param string|array $value
     * @return string|array|null
     */
    public function set(string|array $value): mixed;

    /**
     * @param string $criteria
     * @param string|null $field
     * @return string|array|null
     */
    public function search(string $criteria, ?string $field = null): mixed;
}
