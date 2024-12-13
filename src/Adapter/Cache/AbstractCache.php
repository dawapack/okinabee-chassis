<?php

namespace Framework\Adapter\Cache;

use Framework\Repository\Cache\RepositoryCacheInterface;

abstract class AbstractCache implements CacheAdapterInterface
{
    abstract public function setKey(array|string $key): self;
    abstract public function get(): mixed;
    abstract public function set(string $value, ?string $field = null): mixed;
    abstract public function delete(?string $field): mixed;
    abstract public function search(string $criteria, ?string $field = null): mixed;

    public function __construct(
        readonly RepositoryCacheInterface $repositoryCache
    )
    {
    }

    protected function buildKey(): string
    {

    }
}
