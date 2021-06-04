package com.kitchenstore.service;

import java.util.List;

import com.kitchenstore.bean.Notification;

public interface NotificationService {

	List<Notification> getNotification(long userId);

	boolean NewNotification(long pId, long userId);

}
