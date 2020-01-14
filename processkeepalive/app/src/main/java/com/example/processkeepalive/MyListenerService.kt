package com.example.processkeepalive

import android.annotation.TargetApi
import android.content.Intent
import android.os.Build
import android.os.IBinder
import android.service.notification.NotificationListenerService
import android.service.notification.StatusBarNotification
import android.util.Log


@TargetApi(Build.VERSION_CODES.JELLY_BEAN_MR2)
class MyListenerService : NotificationListenerService() {

    companion object {
        const val TAG = "MyListenerService"
    }

    override fun onCreate() {
        super.onCreate()
        Log.i(TAG, "$TAG onCreate")
    }

    override fun onBind(intent: Intent?): IBinder? {
        return super.onBind(intent)
        Log.i(TAG, "$TAG onBind")
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        return super.onStartCommand(intent, flags, startId)
        Log.i(TAG, "$TAG onStartCommand")
    }

    override fun onDestroy() {
        super.onDestroy()
        Log.i(TAG, "$TAG onDestroy")
    }

    override fun onNotificationPosted(sbn: StatusBarNotification) {
        Log.i(TAG, "$TAG onNotificationPosted")
    }

    override fun onNotificationRemoved(sbn: StatusBarNotification) {
        Log.i(TAG, "$TAG onNotificationRemoved")
    }
}