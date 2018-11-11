package com.liaojl.shop.utils;

import java.io.Serializable;
import java.util.Collection;
import java.util.Set;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.ConcurrentHashMap;

/**
 * TestTask：带周期性清理的缓存器，自身是一个定时任务，自动启动，每次清理后确保缓存中没有上一个周期的对象
 *
 * @see
 * 
 */

public class MapCache<K, V> extends TimerTask implements IMapCache<K, V>, Serializable {
	private static final long serialVersionUID = -5163817326010036146L;
	private int cacheSize = -1;
	ConcurrentHashMap<K, V> cacheMap = new ConcurrentHashMap<K, V>();
	private ListCache<K> keyList = new ListCache<K>() {
		private static final long serialVersionUID = -2422034408358408025L;

		public void onRemoveFromCache(K element) {
			cacheMap.remove(element);
		};
	};

	/**
	 * 构造函数，不限制缓存大小，不定期清理
	 */
	public MapCache() {
		this(-1);
	}

	/**
	 * 构造函数
	 * 
	 * @param cacheSize 缓存大小,-1不限制
	 */
	public MapCache(int cacheSize) {
		this(cacheSize, -1);
	}

	/**
	 * 构造函数
	 * 
	 * @param cacheSize 缓存大小,-1不限制
	 * @param period    清理周期,-1不清理
	 */
	public MapCache(int cacheSize, int period) {
		this(cacheSize, period, 0);
	}

	/**
	 * 构造函数
	 * 
	 * @param cacheSize 缓存大小,-1不限制
	 * @param period    清理周期,-1不清理
	 * @param delay     延期启动时间，单位分钟
	 */
	public MapCache(int cacheSize, int period, int delay) {
		this.cacheSize = cacheSize;
		if (-1 != period) {
			Timer timer = new Timer();
			TimerRegister.register(timer);
			timer.schedule(this, delay * 60 * 1000, period * 60 * 1000);
		}
	}

	public boolean inCacheKey(K key) {
		if (null == key) {
			return false;
		}
		return cacheMap.keySet().contains(key);
	}

	public boolean inCacheValue(V value) {
		return cacheMap.values().contains(value);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see kl.comm.cache.ICache#cache(java.lang.Object)
	 */
	@Override
	public void cache(K k, V v) {
		keyList.cache(k);
		cacheMap.put(k, v);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see kl.comm.cache.ICache#remove(java.lang.Object)
	 */
	@Override
	public void remove(K key) {
		cacheMap.remove(key);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see kl.comm.cache.ICache#setCacheSize()
	 */
	@Override
	public void setCacheSize(int cacheSize) {
		this.cacheSize = cacheSize;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see kl.comm.cache.ICache#getCacheSize()
	 */
	@Override
	public int getCacheSize() {
		return cacheSize;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see kl.comm.cache.ICache#clear()
	 */
	@Override
	public void clear() {
		keyList.clear();
		cacheMap.clear();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see java.util.TimerTask#run()
	 */
	@Override
	public void run() {
		keyList.run();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see kl.comm.cache.IMapCache#get(java.lang.Object)
	 */
	@Override
	public V get(K k) {
		return cacheMap.get(k);
	}

	public Set<K> getKeys() {
		return cacheMap.keySet();
	}

	public Collection<V> getValues() {
		return cacheMap.values();
	}
}
