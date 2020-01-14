package com.example.processkeepalive

import android.accounts.Account
import android.accounts.AccountManager
import android.app.AppOpsManager
import android.content.ContentResolver
import android.content.Context
import android.content.Intent
import android.content.pm.ApplicationInfo
import android.os.Bundle
import android.provider.Settings
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.bumptech.glide.Glide
import com.example.processkeepalive.account.AccountProvider
import com.example.processkeepalive.account.AuthenticatorActivity
import kotlinx.android.synthetic.main.activity_main.*
import java.lang.reflect.Field
import java.lang.reflect.Method


class MainActivity : AppCompatActivity() {
    companion object {
        const val ACTION = "android.settings.ACTION_NOTIFICATION_LISTENER_SETTINGS"
        const val CHECK_OP_NO_THROW = "checkOpNoThrow"
        const val OP_POST_NOTIFICATION = "OP_POST_NOTIFICATION"

        const val ENABLED_NOTIFICATION_LISTENERS = "enabled_notification_listeners"
    }

    private lateinit var accountManager: AccountManager

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

//        notification_btn.setOnClickListener { getNLPermission(MainActivity@ this) }
//
//        notification_check.setOnClickListener {
//            if (checkNotificationPermission(MainActivity@ this)) {
//                Toast.makeText(MainActivity@ this, "权限已开启", Toast.LENGTH_LONG).show()
//            }
//            Toast.makeText(MainActivity@ this, "权限未开启", Toast.LENGTH_LONG).show()
//        }
//
//        accountManager = getSystemService(Context.ACCOUNT_SERVICE) as AccountManager
//        val account = Account("User", AuthenticatorActivity.ACCOUNT_TYPE)
//        accountManager.addAccountExplicitly(account, null, null)
//
//        // 自动同步
//        val bundle = Bundle()
//        ContentResolver.setIsSyncable(account, AccountProvider.AUTHORITY, 1)
//        ContentResolver.setSyncAutomatically(account, AccountProvider.AUTHORITY, true)
//        ContentResolver.addPeriodicSync(account, AccountProvider.AUTHORITY, bundle, 60)

        Glide.with(MainActivity@ this).load(R.drawable.ic_launcher).into(glide_img)


    }


    private fun getNLPermission(content: Context) {
        try {
            val intent = Intent(ACTION)
            startActivity(intent)
        } catch (e: Exception) {

        }
    }

    private fun checkNotificationPermission(context: Context): Boolean {
        val pkg = context.packageName
        val flat: String = Settings.Secure.getString(
            context.contentResolver,
            ENABLED_NOTIFICATION_LISTENERS
        )
        return flat != null && flat.contains(pkg)
    }

}
