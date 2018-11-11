package com.liaojl.shop.utils;

import java.util.ArrayList;
import java.util.Timer;

public class TimerRegister {
	static ArrayList<Timer> list = new ArrayList<Timer>();

	public synchronized static void register(Timer timer) {
		list.add(timer);
	}

	public static synchronized void remove(Timer timer) {
		list.remove(timer);
	}

	public static void cancel() {
//		ScheduledExecutorService executorService = new ScheduledThreadPoolExecutor(1,
//		        new BasicThreadFactory.Builder().namingPattern("example-schedule-pool-%d").daemon(true).build());
//		    executorService.scheduleAtFixedRate(new Runnable() {
//		        @Override
//		        public void run() {
//		            //do something
//		        }
//		    },1000,1000, TimeUnit.HOURS);
		for (Timer timer : list) {
			timer.purge();
			timer.cancel();
		}
		list.clear();
	}

}
