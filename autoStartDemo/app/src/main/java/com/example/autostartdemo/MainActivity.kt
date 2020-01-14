package com.example.autostartdemo

import android.content.ComponentName
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.provider.Settings
import android.util.Log
import androidx.appcompat.app.AppCompatActivity
import kotlinx.android.synthetic.main.activity_main.*


class MainActivity : AppCompatActivity() {

    companion object {

        //coloros3.0
        private const val p1 = "com.coloros.safecenter"
        private const val p1c1 =
            "com.coloros.safecenter.permission.startup.StartupAppListActivity"
        private const val p1c2 = "com.coloros.safecenter.startupapp.StartupAppListActivity"

        private const val p12 = "com.coloros.oppoguardelf"
        private const val p12c1 =
            "com.coloros.powermanager.fuelgaue.PowerConsumptionActivity"
        private const val p12c2 =
            "com.coloros.powermanager.fuelgaue.PowerUsageModelActivity"

        //OLD == ColorOS V2.1
        private const val p13 = "com.color.oppoguardelf"
        private const val p13c1 =
            "com.color.safecenter.permission.startup.StartupAppListActivity"
        private const val p13c2 = "com.color.safecenter.startupapp.StartupAppListActivity"

        private const val p2 = "com.oppo.safe"
        private const val p2c1 = "com.oppo.safe.permission.startup.StartupAppListActivity"

    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)


//        if (NotificationsUtils.isNotificationEnabled(this)) {
//            Log.i("aaa", "--> showPromptDialog -- 通知权限 已开启 = ")
//
//            val localIntent = Intent()
//            localIntent.action = "android.settings.APP_NOTIFICATION_SETTINGS"
//            localIntent.putExtra("app_package", this.packageName)
//            localIntent.putExtra("app_uid", this.applicationInfo.uid)
//
//            startActivity(localIntent)
//
//
//        } else {
//            Log.i("aaa", "--> showPromptDialog -- 通知权限 未开启 = ");
//            // TODO 弹框提示用户去设置，跳转到应用信息界面
//        }


        //打开账号同步
        open_power_btn.setOnClickListener{
            val intent = Intent(Settings.ACTION_SYNC_SETTINGS)
//            val intent = Intent(Settings.ACTION_ADD_ACCOUNT)
            intent.putExtra(Settings.EXTRA_AUTHORITIES,  arrayOf ("com.alhiwar.sync_account.AccountProvider"))
//            intent.putExtra(Settings.EXTRA_AUTHORITIES,  arrayOf ("com.alhiwar.type"))

            startActivity(intent)
        }

        //打开详情
        openDetial_btn.setOnClickListener {

            val intent = Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS)
////            intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
////            intent.action = "android.settings.APPLICATION_DETAILS_SETTINGS"
            intent.data = Uri.fromParts("package", packageName, null)
            startActivity(intent)
//




        }

        open_btn_one.setOnClickListener {
            val intent = Intent("android.intent.action.VIEW")
//            intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
            val componentName = ComponentName(
                "com.huawei.systemmanager",
                "com.huawei.systemmanager.startupmgr.ui.StartupNormalAppListActivity"//9。0ok
            )

            intent.component = componentName
            var resolveInfo = packageManager.resolveActivity(intent, 0)

            if (resolveInfo != null) {
                startActivityForResult(intent, 12, null)
//                val guideIntent = Intent(MainActivity@ this, GuideActivity::class.java)
//                startActivity(guideIntent)

                Thread() {
                    Thread.sleep(500)
                    val guideIntent = Intent(MainActivity@ this, GuideActivity::class.java)
                    guideIntent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
                    startActivity(guideIntent)
                }.start()
            }
        }

        //打开列表
        open_btn.setOnClickListener {
            val intent = Intent("android.intent.action.VIEW")
            intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
            val componentName = ComponentName(
                "com.huawei.systemmanager",
                "com.huawei.systemmanager.appcontrol.activity.StartupAppControlActivity"//9。0ok
            )

            intent.component = componentName

            var resolveInfo = packageManager.resolveActivity(intent, 0)

//            if (resolveInfo?.activityInfo != null && resolveInfo.activityInfo.permission == null) {
            if (resolveInfo?.activityInfo != null) {
                startActivityForResult(intent, 12, null)


//                val guideIntent = Intent(MainActivity@ this, GuideActivity::class.java)
//                startActivity(guideIntent)


                Thread() {
                    Thread.sleep(500)
                    val guideIntent = Intent(MainActivity@ this, GuideActivity::class.java)
                    guideIntent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
                    startActivity(guideIntent)
                }.start()

            }


        }

    }

}
