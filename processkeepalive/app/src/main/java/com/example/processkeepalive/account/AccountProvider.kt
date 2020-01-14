package com.example.processkeepalive.account

import android.content.ContentProvider
import android.content.ContentValues
import android.database.Cursor
import android.net.Uri
import android.util.Log

class AccountProvider : ContentProvider() {

    companion object {
        const val AUTHORITY = "com.example.processkeepalive.account.AccountProvider"
        const val CONTENT_URI_BASE = "content://" + AUTHORITY
        const val TABLE_NAME = "data"
         val CONTENT_URI = Uri.parse(CONTENT_URI_BASE + "/" + TABLE_NAME)
    }

    override fun insert(uri: Uri, values: ContentValues?): Uri? {
        Log.i("syncAccount", " AccountProvider insert")
        return null
    }

    override fun query(
        uri: Uri,
        projection: Array<out String>?,
        selection: String?,
        selectionArgs: Array<out String>?,
        sortOrder: String?
    ): Cursor? {
        Log.i("syncAccount", "AccountProvider query")
        return null
    }

    override fun onCreate(): Boolean {
        Log.i("syncAccount", "AccountProvider onCreate")
        return false
    }

    override fun update(
        uri: Uri,
        values: ContentValues?,
        selection: String?,
        selectionArgs: Array<out String>?
    ): Int {
        Log.i("syncAccount", "AccountProvider update")
        return 0
    }

    override fun delete(uri: Uri, selection: String?, selectionArgs: Array<out String>?): Int {
        Log.i("syncAccount", "AccountProvider delete")
        return 0
    }

    override fun getType(uri: Uri): String? {
        Log.i("syncAccount", "AccountProvider getType")
        return null
    }
}
