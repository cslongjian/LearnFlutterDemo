package com.example.processkeepalive.account

import android.accounts.Account
import android.app.Service
import android.content.*
import android.os.Bundle
import android.os.IBinder
import android.util.Log


class SyncService : Service() {

    private val sSyncAdapterLock = Any()

    lateinit var sSyncAdapter: SyncAdapter

    override fun onCreate() {
        super.onCreate()
        synchronized(sSyncAdapterLock) {
            sSyncAdapter = SyncAdapter(applicationContext, true)
        }
    }

    override fun onBind(p0: Intent?): IBinder {
        return sSyncAdapter.syncAdapterBinder
    }

    class SyncAdapter(context: Context, autoInitialize: Boolean) :
        AbstractThreadedSyncAdapter(context, autoInitialize) {
        override fun onPerformSync(
            p0: Account?,
            p1: Bundle?,
            p2: String?,
            p3: ContentProviderClient?,
            p4: SyncResult?
        ) {
            context.contentResolver.notifyChange(AccountProvider.CONTENT_URI, null, false)
            Log.i("syncAccount", "SyncAdapter onPerformSync")
        }

    }
}