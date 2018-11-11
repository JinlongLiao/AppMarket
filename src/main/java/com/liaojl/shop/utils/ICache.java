package com.liaojl.shop.utils;

import java.util.concurrent.ConcurrentLinkedDeque;


/**
 * ICache：<对这个类的简单描述>
 *
 * @see
 * 
 */

public interface ICache<T> {
    public void cache(T t);
    public boolean inCache(T t);
    public void remove(T t);
    public void setCacheSize(int cacheSize);
    public int getCacheSize();
    public void clear();
    public ConcurrentLinkedDeque<T> getValues();
}
