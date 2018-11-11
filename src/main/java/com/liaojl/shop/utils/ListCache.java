package com.liaojl.shop.utils;

import java.io.Serializable;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentLinkedDeque;

/**
 * TestTask：带周期性清理的缓存器，自身是一个定时任务，自动启动，每次清理后确保缓存中没有上一个周期的对象
 *
 * @see
 * 
 */

public class ListCache<T> extends TimerTask implements ICache<T>,Serializable{
	private static final long serialVersionUID = -7878097465990652850L;
//	private Logger logger = Logger.getLogger(ListCache.class);
    private int cacheSize = -1;
    private ConcurrentLinkedDeque<T> cacheList = new ConcurrentLinkedDeque<T>();
    private ConcurrentHashMap<Integer, Long> keyDateMap = new ConcurrentHashMap<Integer, Long>();
//    private T topElement = null;
    private long lastClearTime = System.currentTimeMillis();
    protected ListCache(){
        this(-1);
    }
    /**
     * 构造函数,立即启动
     * @param period  清理周期，单位分钟
     */
    public ListCache( int cacheSize){
        this(cacheSize, -1);
    }
    public ListCache( int cacheSize, int period){
        this(cacheSize, period, 0);
    }
    /**
     * 构造函数
     * @param maxSize  最大缓存条目
     * @param delay  延期启动时间，单位分钟
     * @param period  清理周期，单位分钟
     */
    protected ListCache(int cacheSize, int period, int delay){
        this.cacheSize = cacheSize;
        if(period > 0){
        	Timer timer = new Timer();
        	TimerRegister.register(timer);
            timer.schedule(this, delay * 60 * 1000, period * 60 * 1000);
        }
//        logger.debug(String.format("启用缓存..."));
//        if(cacheSize > 0){
//            logger.debug(String.format("缓存容量[cacheSize]=" + cacheSize));
//        }
//        if(period > 0){
//            logger.debug(String.format("定时清理周期[period]=" + period));
//        }
    }

    public boolean inCache(T element){
        return cacheList.contains(element);
    }

    /* (non-Javadoc)
     * @see kl.comm.cache.ICache#cache(java.lang.Object)
     */
    @Override
    public void cache(T t) {
        
//        logger.debug("缓存对象[" + t + "]...");
//        synchronized (cacheList) {
            if(cacheList.contains(t)){
//                logger.debug("更新缓存对象的位置");
                cacheList.remove(t);
                cacheList.push(t);
            } else {
                cacheList.push(t);
            }
            if(-1 != cacheSize && cacheList.size() > cacheSize){
//                logger.debug("缓存超标，清理末尾对象..");
                onRemoveFromCache(cacheList.pollLast());
            }
//        }
        keyDateMap.put(t.hashCode(), System.currentTimeMillis());
    }

    /* (non-Javadoc)
     * @see kl.comm.cache.ICache#remove(java.lang.Object)
     */
    @Override
    public void remove(T t) {
//        logger.debug("从缓存中清除对象[" + t + "]...");
//        synchronized (cacheList) {
            cacheList.remove(t);
//        }
        keyDateMap.remove(t.hashCode());
    }

    /* (non-Javadoc)
     * @see kl.comm.cache.ICache#setCacheSize()
     */
    @Override
    public void setCacheSize(int cacheSize) {
        this.cacheSize = cacheSize;
    }

    /* (non-Javadoc)
     * @see kl.comm.cache.ICache#getCacheSize()
     */
    @Override
    public int getCacheSize() {
        return cacheSize;
    }

    /* (non-Javadoc)
     * @see kl.comm.cache.ICache#clear()
     */
    @Override
    public void clear() {
//        logger.debug("清除缓存中所有对象...");
        cacheList.clear();
        keyDateMap.clear();
    }
    /* (non-Javadoc)
     * @see java.util.TimerTask#run()
     */
    @Override
    public void run() {
//        logger.debug("清理周期到，当前时间: " + new Date() + "开始清理...");
        T t = cacheList.peekLast();
//        logger.debug(t);
        while(null != t){
//            logger.debug("hashcode" + t.hashCode());
            long cacheTime = keyDateMap.get(t.hashCode());
            if(cacheTime < lastClearTime){
//                logger.debug("清理对象" + t  + "缓存时间: " + new Date(lastClearTime));
                remove(t);
                onRemoveFromCache(t);
            } else {
//                logger.debug("清理完毕！");
                break;
            }
            t = cacheList.peekLast();
        }
        lastClearTime = System.currentTimeMillis();
        /*
        if(null == topElement){ 
            //首次清理,记录最前面的元素
            topElement = cacheList.peek();  
            //清理，直到topElement
            synchronized (cacheList) {
                while(topElement != cacheList.peekLast()){
                    T keyElement = cacheList.pollLast();
                    onRemoveFromCache(keyElement);
                }
            }
        } else {
            //如果存在则需要清理，如果不存在测不需要清理
            synchronized (cacheList) {
                if(cacheList.contains(topElement)){
                    T keyElement = null;
                    do{
                        keyElement = cacheList.pollLast();
                        onRemoveFromCache(keyElement);
                    } while(topElement != keyElement);
                }
            }
            topElement = cacheList.peek();  
        }*/
        
    }
    public void onRemoveFromCache(T element){
        
    };
    public ConcurrentLinkedDeque<T> getValues(){
        return cacheList;
    }
//    public static void main(String[] args) {
//        PropertyConfigurator.configure("D:/test/20150923/pms/WebContent/WEB-INF/conf/log4j.properties");
//        ListCache<String> cache = new ListCache<String>(5000, 1,0);
//        for(int i = 0; i < 100000; i++){
//            cache.cache("" + i);
//            try {
//                Thread.sleep(17 * 1000);
//            } catch (InterruptedException e) {
//                // TODO Auto-generated catch block
//                e.printStackTrace();
//            }
//        }
//                
//    }
}
