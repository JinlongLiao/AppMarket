package com.liaojl.shop.utils;

import java.util.Collection;
import java.util.Set;


/**
 * ICache：<对这个类的简单描述>
 *
 * @see
 * 
 */

public interface IMapCache<K, V> {
    public void cache(K k, V v);
    public boolean inCacheKey(K k);
    public boolean inCacheValue(V v);
    public void remove(K k);
    public void setCacheSize(int cacheSize);
    public int getCacheSize();
    public V get(K k);
    public void clear();
    public Set<K> getKeys();
    public Collection<V> getValues();

}
