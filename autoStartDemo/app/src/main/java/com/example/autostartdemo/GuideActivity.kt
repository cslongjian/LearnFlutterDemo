package com.example.autostartdemo

import android.app.Activity
import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.os.Build
import android.os.Bundle
import android.os.Handler
import kotlinx.android.synthetic.main.activity_guide.*


class GuideActivity : Activity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_guide)

        close_btn.setOnClickListener {
            sendNotification()
        }

        var handler = Handler()
        handler.postDelayed({
            switch_view.isChecked = true
        }, 2000)

    }

    fun sendNotification() {

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            // 1. 创建一个通知(必须设置channelId)
            val context = applicationContext
            val channelId = "ChannelId" // 通知渠道

            val notification: Notification = Notification.Builder(context)
                .setChannelId(channelId)
                .setSmallIcon(R.mipmap.ic_launcher)
                .setContentTitle("通知标题")
                .setContentText("通知内容")
                .build()
// 2. 获取系统的通知管理器(必须设置channelId)
            val notificationManager = context
                .getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            val channel = NotificationChannel(
                channelId,
                "通知的渠道名称",
                NotificationManager.IMPORTANCE_DEFAULT
            )

            notificationManager.createNotificationChannel(channel)
// 3. 发送通知(Notification与NotificationManager的channelId必须对应)
            notificationManager.notify(123, notification)
        } else {
// 创建通知(标题、内容、图标)
            val notification: Notification = Notification.Builder(this)
                .setContentTitle("通知标题")
                .setContentText("通知内容")
                .setSmallIcon(R.mipmap.ic_launcher)
                .build()
// 创建通知管理器
            val manager = applicationContext
                .getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
// 发送通知
            manager.notify(123, notification)
        }
    }

}