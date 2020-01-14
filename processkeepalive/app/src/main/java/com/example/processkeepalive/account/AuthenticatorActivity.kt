package com.example.processkeepalive.account

import android.accounts.Account
import android.accounts.AccountManager
import android.annotation.SuppressLint
import android.app.Activity
import android.content.ContentResolver
import android.content.Context
import android.os.Bundle
import android.widget.Toast
import com.example.processkeepalive.R

class AuthenticatorActivity : Activity() {

    companion object {
        const val ACCOUNT_TYPE =
            "com.example.processkeepalive.account.type"// TYPE必须与account_preferences.xml中的TYPE保持一致
    }

    private lateinit var accountManager: AccountManager

    @SuppressLint("MissingPermission")
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_authenticator)

        accountManager = getSystemService(Context.ACCOUNT_SERVICE) as AccountManager
        val accounts =
            accountManager.getAccountsByType(ACCOUNT_TYPE)   // 获取系统帐户列表中已添加的帐户是否存在我们的帐户，用TYPE做为标识
        if (accounts?.size > 0) {
            Toast.makeText(this, "已添加当前登录的帐户", Toast.LENGTH_SHORT).show()
            finish()
        } else {
            val account = Account("User", ACCOUNT_TYPE)
            accountManager.addAccountExplicitly(account, null, null)     // 帐户密码和信息这里用null演示

            // 自动同步
            val bundle = Bundle()
            ContentResolver.setIsSyncable(account, AccountProvider.AUTHORITY, 1)
            ContentResolver.setSyncAutomatically(account, AccountProvider.AUTHORITY, true)
            ContentResolver.addPeriodicSync(account, AccountProvider.AUTHORITY, bundle, 60)
            finish()
        }


    }
}