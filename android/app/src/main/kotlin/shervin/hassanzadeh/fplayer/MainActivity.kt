package shervin.hassanzadeh.fplayer

import android.speech.tts.TextToSpeech.Engine
import android.Manifest
import android.annotation.TargetApi
import android.content.ContentResolver
import android.content.Context
import android.os.Build
import android.os.Bundle
import android.content.pm.PackageManager
import android.database.Cursor
import android.media.MediaMetadataRetriever
import android.provider.MediaStore
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.util.Base64
import java.io.ByteArrayOutputStream

class MainActivity : FlutterActivity(), ActivityCompat.OnRequestPermissionsResultCallback {

    private val CHANNEL = "fplayer.permission/channel"
    private var permissionResult: MethodChannel.Result? = null
    private var currentPermission: String = ""
    private val REQUEST_CODE : Int = 2025

    private val MEDIA_CHANNEL = "fplayer.media/channel"

    private val METADATA_CHANNEL = "fplayer.metadata_reader/channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            permissionResult = result
            when (call.method) {
                "requestStoragePermission" -> {
                    currentPermission = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU)
                        Manifest.permission.READ_MEDIA_AUDIO
                    else
                        Manifest.permission.READ_EXTERNAL_STORAGE
                    checkAndRequest(currentPermission)
                }

                "requestSmsPermission" -> {
                    currentPermission = Manifest.permission.SEND_SMS
                    checkAndRequest(currentPermission)
                }

                "requestCameraPermission" -> {
                    currentPermission = Manifest.permission.CAMERA
                    checkAndRequest(currentPermission)
                }

                else -> result.notImplemented()
            }
        }

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, MEDIA_CHANNEL).setMethodCallHandler {
            call, result -> when (call.method) {
                "queryAudioFiles" -> {
                    val files = queryAudioFiles(applicationContext)
                    result.success(files)
                }

                "queryVideoFiles" -> {
                    val videos = queryVideoFiles(applicationContext)
                    result.success(videos)
                }

                else -> result.notImplemented()
            }
        }

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, METADATA_CHANNEL).setMethodCallHandler {
            call, result -> when (call.method) {
                "getMetadata" -> {
                    val filePath = call.argument<String>("filePath")
                    if (filePath != null) {
                        val metadata = getMediaMetadata(filePath)
                        result.success(metadata)
                    } else {
                        result.error("INVALID_ARGUMENT", "File path is null", null)
                    }
                }

                "getCover" -> {
                    val filePath = call.argument<String>("filePath")
                    if (filePath != null) {
                        val cover = getCoverArtBase64(filePath)
                        result.success(cover)
                    } else {
                        result.error("INVALID_ARGUMENT", "File path is null", null)
                    }
                }

                else -> result.notImplemented()
            }
        }
    }

    // --- Permission Section --- //
    private fun checkAndRequest(permission: String) {
        if (ContextCompat.checkSelfPermission(this, permission) == PackageManager.PERMISSION_GRANTED) {
            permissionResult?.success("granted")
        } else {
            ActivityCompat.requestPermissions(this, arrayOf(permission), REQUEST_CODE)
        }
    }

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {
        if (requestCode == REQUEST_CODE && permissions.isNotEmpty()) {
            val granted = grantResults[0] == PackageManager.PERMISSION_GRANTED
            val shouldShowRationale = ActivityCompat.shouldShowRequestPermissionRationale(this, currentPermission)

            val resultString = when {
                granted -> "granted"
                !granted && !shouldShowRationale -> "permanentlyDenied"
                else -> "denied"
            }

            permissionResult?.success(resultString)
        }

        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
    }

    // --- Query Audio/Video Section --- //
    @TargetApi(Build.VERSION_CODES.JELLY_BEAN)
    private fun queryAudioFiles(context: Context): List<Map<String, String>> {
        val audioList = mutableListOf<Map<String, String>>()
        val contentResolver: ContentResolver = context.contentResolver
        val uri = MediaStore.Audio.Media.EXTERNAL_CONTENT_URI

        val projection = arrayOf(
            MediaStore.Audio.Media.TITLE,
            MediaStore.Audio.Media.ARTIST,
            MediaStore.Audio.Media.DATA,
            MediaStore.Audio.Media.DATE_ADDED,
            MediaStore.Audio.Media.ALBUM
        )

        val selection = "${MediaStore.Audio.Media.IS_MUSIC} != 0"
        val cursor: Cursor? = contentResolver.query(uri, projection, selection, null, null)

        cursor?.use {
            val titleIndex = it.getColumnIndexOrThrow(MediaStore.Audio.Media.TITLE)
            val artistIndex = it.getColumnIndexOrThrow(MediaStore.Audio.Media.ARTIST)
            val dataIndex = it.getColumnIndexOrThrow(MediaStore.Audio.Media.DATA)
            val dateIndex = it.getColumnIndexOrThrow(MediaStore.Audio.Media.DATE_ADDED)
            val albumIndex = it.getColumnIndexOrThrow(MediaStore.Audio.Media.ALBUM)

            while (it.moveToNext()) {
                val path = it.getString(dataIndex)
                val coverArt = getCoverArtBase64(path)

                val map = mapOf(
                    "title" to it.getString(titleIndex),
                    "artist" to it.getString(artistIndex),
                    "path" to it.getString(dataIndex),
                    "album" to it.getString(albumIndex),
                    "dateAdded" to it.getString(dateIndex),
                    "cover" to coverArt
                )
                audioList.add(map)
            }
        }

        return audioList
    }

    @TargetApi(Build.VERSION_CODES.JELLY_BEAN)
    private fun queryVideoFiles(context: Context): List<Map<String, String>> {
        val videoList = mutableListOf<Map<String, String>>()
        val contentResolver: ContentResolver = context.contentResolver
        val uri = MediaStore.Video.Media.EXTERNAL_CONTENT_URI

        val projection = arrayOf(
            MediaStore.Video.Media.TITLE,
            MediaStore.Video.Media.ARTIST,
            MediaStore.Video.Media.DATA,
            MediaStore.Video.Media.DATE_ADDED,
            MediaStore.Video.Media.DURATION
        )

        val cursor: Cursor? = contentResolver.query(uri, projection, null, null, null)

        cursor?.use {
            val titleIndex = it.getColumnIndexOrThrow(MediaStore.Video.Media.TITLE)
            val artistIndex = it.getColumnIndexOrThrow(MediaStore.Video.Media.ARTIST)
            val dataIndex = it.getColumnIndexOrThrow(MediaStore.Video.Media.DATA)
            val dateIndex = it.getColumnIndexOrThrow(MediaStore.Video.Media.DATE_ADDED)
            val durationIndex = it.getColumnIndexOrThrow(MediaStore.Video.Media.DURATION)

            while (it.moveToNext()) {
                val map = mapOf(
                    "title" to it.getString(titleIndex),
                    "artist" to it.getString(artistIndex),
                    "path" to it.getString(dataIndex),
                    "dateAdded" to it.getString(dateIndex),
                    "duration" to it.getString(durationIndex),
                )
                videoList.add(map)
            }
        }

        return videoList
    }

    // --- Audio/Video File Metadata Section --- //
    @TargetApi(Build.VERSION_CODES.GINGERBREAD_MR1)
    private fun getMediaMetadata(filePath: String): Map<String, String?> {
        val retriever = MediaMetadataRetriever()
        return try {
            retriever.setDataSource(filePath)

            val artBytes: ByteArray? = retriever.embeddedPicture
            val base64Image: String? = artBytes?.let {
                Base64.encodeToString(it, Base64.NO_WRAP)
            }

            mapOf(
                "title" to retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_TITLE),
                "artist" to retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ARTIST),
                "album" to retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_ALBUM),
                "duration" to retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DURATION),
                "mimeType" to retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_MIMETYPE),
                "bitrate" to retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_BITRATE),
                "date" to retriever.extractMetadata(MediaMetadataRetriever.METADATA_KEY_DATE),
                "cover" to base64Image
            )
        } catch (e: Exception) {
            mapOf("error" to e.message)
        } finally {
            retriever.release()
        }
    }

    @TargetApi(Build.VERSION_CODES.GINGERBREAD_MR1)
    private fun getCoverArtBase64(filePath: String): String {
        return try {
            val retriever = MediaMetadataRetriever()
            retriever.setDataSource(filePath)
            val bytes = retriever.embeddedPicture
            retriever.release()

            if (bytes != null) {
                Base64.encodeToString(bytes, Base64.NO_WRAP)
            } else {
                ""
            }
        } catch (e: Exception) {
            ""
        }
    }

}
