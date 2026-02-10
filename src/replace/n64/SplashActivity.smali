.class public Lpaulscode/android/mupen64plusae/SplashActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "SourceFile"

# interfaces
.implements Lpaulscode/android/mupen64plusae/task/ExtractAssetsOrCleanupTask$ExtractAssetsListener;


# static fields
.field static final NUM_PERMISSIONS:I

.field static final PERMISSION_REQUEST:I = 0xb1

.field public static final SOURCE_DIR:Ljava/lang/String; = "mupen64plus_data"

.field private static final SPLASH_DELAY:I = 0x3e8

.field private static final STATE_REQUESTING_PERMISSIONS:Ljava/lang/String; = "STATE_REQUESTING_PERMISSIONS"


# instance fields
.field private final extractAssetsTaskLauncher:Ljava/lang/Runnable;

.field private mAppData:Lpaulscode/android/mupen64plusae/persistent/AppData;

.field private mGlobalPrefs:Lpaulscode/android/mupen64plusae/persistent/GlobalPrefs;

.field private mPermissionsNeeded:Landroidx/appcompat/app/AlertDialog;

.field private mRequestingPermissions:Z

.field private mTextView:Landroid/widget/TextView;


# direct methods
.method public static bridge synthetic -$$Nest$fgetmAppData(Lpaulscode/android/mupen64plusae/SplashActivity;)Lpaulscode/android/mupen64plusae/persistent/AppData;
    .locals 0

    .line 1
    iget-object p0, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mAppData:Lpaulscode/android/mupen64plusae/persistent/AppData;

    return-object p0
.end method

.method public static bridge synthetic -$$Nest$fgetmGlobalPrefs(Lpaulscode/android/mupen64plusae/SplashActivity;)Lpaulscode/android/mupen64plusae/persistent/GlobalPrefs;
    .locals 0

    .line 1
    iget-object p0, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mGlobalPrefs:Lpaulscode/android/mupen64plusae/persistent/GlobalPrefs;

    return-object p0
.end method

.method public static bridge synthetic -$$Nest$fgetmTextView(Lpaulscode/android/mupen64plusae/SplashActivity;)Landroid/widget/TextView;
    .locals 0

    .line 1
    iget-object p0, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mTextView:Landroid/widget/TextView;

    return-object p0
.end method

.method public static bridge synthetic -$$Nest$fputmPermissionsNeeded(Lpaulscode/android/mupen64plusae/SplashActivity;Landroidx/appcompat/app/AlertDialog;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mPermissionsNeeded:Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method public static bridge synthetic -$$Nest$mextractAssets(Lpaulscode/android/mupen64plusae/SplashActivity;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lpaulscode/android/mupen64plusae/SplashActivity;->extractAssets()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    sput v0, Lpaulscode/android/mupen64plusae/SplashActivity;->NUM_PERMISSIONS:I

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mAppData:Lpaulscode/android/mupen64plusae/persistent/AppData;

    iput-object v0, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mGlobalPrefs:Lpaulscode/android/mupen64plusae/persistent/GlobalPrefs;

    iput-object v0, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mPermissionsNeeded:Landroidx/appcompat/app/AlertDialog;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mRequestingPermissions:Z

    new-instance v0, Lpaulscode/android/mupen64plusae/SplashActivity$6;

    invoke-direct {v0, p0}, Lpaulscode/android/mupen64plusae/SplashActivity$6;-><init>(Lpaulscode/android/mupen64plusae/SplashActivity;)V

    iput-object v0, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->extractAssetsTaskLauncher:Ljava/lang/Runnable;

    return-void
.end method

.method private checkExtractAssetsOrCleanup()V
    .locals 4

    .line 1
    iget-object v0, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mAppData:Lpaulscode/android/mupen64plusae/persistent/AppData;

    .line 2
    .line 3
    invoke-virtual {v0}, Lpaulscode/android/mupen64plusae/persistent/AppData;->getAssetCheckNeeded()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mAppData:Lpaulscode/android/mupen64plusae/persistent/AppData;

    .line 10
    .line 11
    invoke-virtual {v0}, Lpaulscode/android/mupen64plusae/persistent/AppData;->getAppVersion()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mAppData:Lpaulscode/android/mupen64plusae/persistent/AppData;

    .line 16
    .line 17
    iget v1, v1, Lpaulscode/android/mupen64plusae/persistent/AppData;->appVersionCode:I

    .line 18
    .line 19
    if-ne v0, v1, :cond_1

    .line 20
    .line 21
    invoke-static {p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferencesName(Landroid/content/Context;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v1, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mAppData:Lpaulscode/android/mupen64plusae/persistent/AppData;

    .line 31
    .line 32
    iget-object v1, v1, Lpaulscode/android/mupen64plusae/persistent/AppData;->coreSharedDataDir:Ljava/lang/String;

    .line 33
    .line 34
    const-string v2, "mupen64plus_data"

    .line 35
    .line 36
    invoke-static {v0, v2, v1}, Lpaulscode/android/mupen64plusae/task/ExtractAssetsOrCleanupTask;->areAllAssetsValid(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-nez v0, :cond_0

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {p0, v0}, Lpaulscode/android/mupen64plusae/ActivityHelper;->startGalleryActivity(Landroid/content/Context;Landroid/content/Intent;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 51
    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_1
    :goto_0
    iget-object v0, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mAppData:Lpaulscode/android/mupen64plusae/persistent/AppData;

    .line 55
    .line 56
    iget v1, v0, Lpaulscode/android/mupen64plusae/persistent/AppData;->appVersionCode:I

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Lpaulscode/android/mupen64plusae/persistent/AppData;->putAppVersion(I)V

    .line 59
    .line 60
    .line 61
    new-instance v0, Landroid/os/Handler;

    .line 62
    .line 63
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 68
    .line 69
    .line 70
    iget-object v1, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->extractAssetsTaskLauncher:Ljava/lang/Runnable;

    .line 71
    .line 72
    const-wide/16 v2, 0x3e8

    .line 73
    .line 74
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 75
    .line 76
    .line 77
    :goto_1
    return-void
.end method

.method private createChannel()V
    .locals 7

    .line 1
    new-instance v0, Landroidx/lifecycle/MethodCallsLogger;

    .line 2
    .line 3
    const/16 v1, 0x16

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroidx/lifecycle/MethodCallsLogger;-><init>(I)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Landroid/content/Intent;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    const-class v3, Lpaulscode/android/mupen64plusae/SplashActivity;

    .line 15
    .line 16
    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 17
    .line 18
    .line 19
    const/high16 v2, 0x18000000

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 22
    .line 23
    .line 24
    iget-object v2, v0, Landroidx/lifecycle/MethodCallsLogger;->calledMethods:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v2, Landroid/content/ContentValues;

    .line 27
    .line 28
    const-string v3, "type"

    .line 29
    .line 30
    const-string v4, "TYPE_PREVIEW"

    .line 31
    .line 32
    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    sget v2, Lpaulscode/android/mupen64plusae/R$string;->showRecentlyPlayed_title:I

    .line 36
    .line 37
    invoke-virtual {p0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    iget-object v3, v0, Landroidx/lifecycle/MethodCallsLogger;->calledMethods:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast v3, Landroid/content/ContentValues;

    .line 44
    .line 45
    const-string v4, "display_name"

    .line 46
    .line 47
    invoke-virtual {v3, v4, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    const/4 v2, 0x1

    .line 51
    invoke-virtual {v1, v2}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    iget-object v2, v0, Landroidx/lifecycle/MethodCallsLogger;->calledMethods:Ljava/lang/Object;

    .line 60
    .line 61
    check-cast v2, Landroid/content/ContentValues;

    .line 62
    .line 63
    if-nez v1, :cond_0

    .line 64
    .line 65
    const/4 v1, 0x0

    .line 66
    goto :goto_0

    .line 67
    :cond_0
    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    :goto_0
    const-string v3, "app_link_intent_uri"

    .line 72
    .line 73
    invoke-virtual {v2, v3, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    :try_start_0
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    sget-object v3, Landroidx/tvprovider/media/tv/TvContractCompat$Channels;->CONTENT_URI:Landroid/net/Uri;

    .line 85
    .line 86
    new-instance v4, Landroidx/tvprovider/media/tv/Channel;

    .line 87
    .line 88
    invoke-direct {v4, v0}, Landroidx/tvprovider/media/tv/Channel;-><init>(Landroidx/lifecycle/MethodCallsLogger;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v4}, Landroidx/tvprovider/media/tv/Channel;->toContentValues()Landroid/content/ContentValues;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {v2, v3, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    if-eqz v0, :cond_2

    .line 100
    .line 101
    invoke-static {v0}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    .line 102
    .line 103
    .line 104
    move-result-wide v2

    .line 105
    iget-object v0, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mAppData:Lpaulscode/android/mupen64plusae/persistent/AppData;

    .line 106
    .line 107
    invoke-virtual {v0, v2, v3}, Lpaulscode/android/mupen64plusae/persistent/AppData;->putChannelId(J)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    sget v4, Lpaulscode/android/mupen64plusae/R$drawable;->icon:I

    .line 115
    .line 116
    invoke-static {v0, v4}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-static {v2, v3}, Lcom/google/android/material/chip/Chip$$ExternalSyntheticApiModelOutline0;->m(J)Landroid/net/Uri;

    .line 121
    .line 122
    .line 123
    move-result-object v4
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_2

    .line 124
    :try_start_1
    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 125
    .line 126
    .line 127
    move-result-object v5

    .line 128
    invoke-virtual {v5, v4}, Landroid/content/ContentResolver;->openOutputStream(Landroid/net/Uri;)Ljava/io/OutputStream;

    .line 129
    .line 130
    .line 131
    move-result-object v4
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_2

    .line 132
    :try_start_2
    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    .line 133
    .line 134
    const/16 v6, 0x64

    .line 135
    .line 136
    invoke-virtual {v0, v5, v6, v4}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 137
    .line 138
    .line 139
    invoke-virtual {v4}, Ljava/io/OutputStream;->flush()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 140
    .line 141
    .line 142
    :try_start_3
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_2

    .line 143
    .line 144
    .line 145
    goto :goto_3

    .line 146
    :catch_0
    move-exception v0

    .line 147
    goto :goto_2

    .line 148
    :catch_1
    move-exception v0

    .line 149
    goto :goto_2

    .line 150
    :catchall_0
    move-exception v0

    .line 151
    :try_start_4
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 152
    :catchall_1
    move-exception v5

    .line 153
    if-eqz v4, :cond_1

    .line 154
    .line 155
    :try_start_5
    invoke-virtual {v4}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 156
    .line 157
    .line 158
    goto :goto_1

    .line 159
    :catchall_2
    move-exception v4

    .line 160
    :try_start_6
    invoke-virtual {v0, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 161
    .line 162
    .line 163
    :cond_1
    :goto_1
    throw v5
    :try_end_6
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_6 .. :try_end_6} :catch_2

    .line 164
    :goto_2
    :try_start_7
    const-string v4, "ChannelLogoUtils"

    .line 165
    .line 166
    const-string v5, "Failed to store the logo to the system content provider.\n"

    .line 167
    .line 168
    invoke-static {v4, v5, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 169
    .line 170
    .line 171
    :goto_3
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 172
    .line 173
    const/16 v4, 0x1a

    .line 174
    .line 175
    if-lt v0, v4, :cond_2

    .line 176
    .line 177
    invoke-static {v1, v2, v3}, Landroidx/tvprovider/media/tv/TvContractCompat$$ExternalSyntheticApiModelOutline0;->m(Landroid/content/Context;J)V
    :try_end_7
    .catch Ljava/lang/IllegalArgumentException; {:try_start_7 .. :try_end_7} :catch_2

    .line 178
    .line 179
    .line 180
    goto :goto_4

    .line 181
    :catch_2
    move-exception v0

    .line 182
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 183
    .line 184
    .line 185
    :cond_2
    :goto_4
    return-void
.end method

.method private extractAssets()V
    .locals 9

    new-instance v8, Lpaulscode/android/mupen64plusae/task/ExtractAssetsOrCleanupTask;

    invoke-virtual {p0}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    iget-object v3, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mAppData:Lpaulscode/android/mupen64plusae/persistent/AppData;

    iget-object v4, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mGlobalPrefs:Lpaulscode/android/mupen64plusae/persistent/GlobalPrefs;

    const-string v5, "mupen64plus_data"

    iget-object v6, v3, Lpaulscode/android/mupen64plusae/persistent/AppData;->coreSharedDataDir:Ljava/lang/String;

    move-object v0, v8

    move-object v1, p0

    move-object v7, p0

    invoke-direct/range {v0 .. v7}, Lpaulscode/android/mupen64plusae/task/ExtractAssetsOrCleanupTask;-><init>(Landroid/content/Context;Landroid/content/res/AssetManager;Lpaulscode/android/mupen64plusae/persistent/AppData;Lpaulscode/android/mupen64plusae/persistent/GlobalPrefs;Ljava/lang/String;Ljava/lang/String;Lpaulscode/android/mupen64plusae/task/ExtractAssetsOrCleanupTask$ExtractAssetsListener;)V

    invoke-virtual {v8}, Lpaulscode/android/mupen64plusae/task/ExtractAssetsOrCleanupTask;->doInBackground()V

    return-void
.end method


# virtual methods
.method public actuallyRequestPermissions()V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InlinedApi"
        }
    .end annotation

    const/4 v0, 0x1

    iput-boolean v0, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mRequestingPermissions:Z

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x21

    const/16 v2, 0xb1

    if-lt v0, v1, :cond_0

    const-string v0, "android.permission.POST_NOTIFICATIONS"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v2}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    return-void

    :cond_0
    const-string v0, "android.permission.READ_EXTERNAL_STORAGE"

    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v2}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    return-void
.end method

.method public attachBaseContext(Landroid/content/Context;)V
    .locals 1

    invoke-static {}, Lpaulscode/android/mupen64plusae/util/LocaleContextWrapper;->getLocalCode()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->attachBaseContext(Landroid/content/Context;)V

    goto :goto_1

    :cond_0
    invoke-static {}, Lpaulscode/android/mupen64plusae/util/LocaleContextWrapper;->getLocalCode()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lpaulscode/android/mupen64plusae/util/LocaleContextWrapper;->wrap(Landroid/content/Context;Ljava/lang/String;)Landroid/content/ContextWrapper;

    move-result-object p1

    goto :goto_0

    :goto_1
    return-void
.end method

.method public static getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    .locals 14

    const/4 v10, 0x0

    .line 447
    const-string v11, "storage"

    invoke-virtual {p0, v11}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/os/storage/StorageManager;

    .line 450
    .local v7, "storageManager":Landroid/os/storage/StorageManager;
    :try_start_0
    sget v11, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v12, 0x18

    if-lt v11, v12, :cond_2

    .line 451
    invoke-virtual {v7}, Landroid/os/storage/StorageManager;->getStorageVolumes()Ljava/util/List;

    move-result-object v4

    .line 452
    .local v4, "list":Ljava/util/List;, "Ljava/util/List<Landroid/os/storage/StorageVolume;>;"
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-nez v11, :cond_1

    .line 483
    .end local v4    # "list":Ljava/util/List;, "Ljava/util/List<Landroid/os/storage/StorageVolume;>;"
    :goto_0
    const/4 v10, 0x0

    :goto_1
    return-object v10

    .line 452
    .restart local v4    # "list":Ljava/util/List;, "Ljava/util/List<Landroid/os/storage/StorageVolume;>;"
    :cond_1
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/os/storage/StorageVolume;

    .line 453
    .local v8, "volume":Landroid/os/storage/StorageVolume;
    invoke-virtual {v8}, Landroid/os/storage/StorageVolume;->isRemovable()Z

    move-result v11

    if-eqz v11, :cond_0

    .line 456
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    const-string v11, "getPath"

    const/4 v12, 0x0

    new-array v12, v12, [Ljava/lang/Class;

    invoke-virtual {v10, v11, v12}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 458
    .local v5, "method":Ljava/lang/reflect/Method;
    const/4 v10, 0x0

    new-array v10, v10, [Ljava/lang/Object;

    invoke-virtual {v5, v8, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    goto :goto_1

    .line 464
    .end local v4    # "list":Ljava/util/List;, "Ljava/util/List<Landroid/os/storage/StorageVolume;>;"
    .end local v5    # "method":Ljava/lang/reflect/Method;
    .end local v8    # "volume":Landroid/os/storage/StorageVolume;
    :cond_2
    const-class v11, Landroid/os/storage/StorageManager;

    const-string v12, "getVolumePaths"

    const/4 v13, 0x0

    new-array v13, v13, [Ljava/lang/Class;

    invoke-virtual {v11, v12, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 465
    .local v2, "getVolumePathsMethod":Ljava/lang/reflect/Method;
    const/4 v11, 0x1

    invoke-virtual {v2, v11}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 466
    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Object;

    invoke-virtual {v2, v7, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 468
    .local v3, "invokes":Ljava/lang/Object;
    move-object v0, v3

    check-cast v0, [Ljava/lang/String;

    move-object v9, v0

    .line 470
    .local v9, "volumePaths":[Ljava/lang/String;
    array-length v11, v9

    :goto_2
    if-lt v10, v11, :cond_3

    .line 477
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v10

    invoke-virtual {v10}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v10

    goto :goto_1

    .line 470
    :cond_3
    aget-object v6, v9, v10

    .line 472
    .local v6, "path":Ljava/lang/String;
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v12

    invoke-virtual {v12}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v6, v12}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v12

    if-eqz v12, :cond_4

    .line 470
    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    :cond_4
    move-object v10, v6

    .line 475
    goto :goto_1

    .line 480
    .end local v2    # "getVolumePathsMethod":Ljava/lang/reflect/Method;
    .end local v3    # "invokes":Ljava/lang/Object;
    .end local v6    # "path":Ljava/lang/String;
    .end local v9    # "volumePaths":[Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 481
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private getRomString()Ljava/lang/String;
    .locals 3

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v0 # Intent

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;
    move-result-object v0 # Uri

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Lpaulscode/android/mupen64plusae/util/FileUtil;->getFileName(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;
    move-result-object v1 # Game Name

    invoke-static {p0}, Lpaulscode/android/mupen64plusae/SplashActivity;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0 # sdcard

    const-string v2, "/roms/n64/"
    invoke-virtual {v0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2 # sdcard/roms/n64/
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2 # sdcard/roms/n64/game.n64
    return-object v2
.end method

.method private getConfigString()Ljava/lang/String;
    .locals 2

    invoke-static {p0}, Lpaulscode/android/mupen64plusae/SplashActivity;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0 # sdcard
    const-string v1, "/RetroArch/config.cfg"
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0 # sdcard/RetroArch/config.cfg
    return-object v0
.end method

.method private getLibRetroSDString()Ljava/lang/String;
    .locals 2

    invoke-static {p0}, Lpaulscode/android/mupen64plusae/SplashActivity;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0 # sdcard
    const-string v1, "/RetroArch/cores/"
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0 # sdcard/RetroArch/cores/
    invoke-direct {p0}, Lpaulscode/android/mupen64plusae/SplashActivity;->getPreferredCoreName()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0 # sdcard/RetroArch/cores/coreName
    return-object v0
.end method

.method private getLibRetroString()Ljava/lang/String;
    .locals 2
    const-string v0, "/data/user/0/com.retroarch.ra32/cores/"
    invoke-direct {p0}, Lpaulscode/android/mupen64plusae/SplashActivity;->getPreferredCoreName()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0 # /data/user/0/com.retroarch.ra32/cores/coreName
    return-object v0
.end method

.method private getN64Path()Ljava/lang/String;
    .locals 2

    invoke-static {p0}, Lpaulscode/android/mupen64plusae/SplashActivity;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0 # sdcard
    const-string v1, "/RetroArch/n64core.cfg"
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0 # sdcard/RetroArch/n64core.cfg
    return-object v0
.end method

.method private getPreferredCoreName()Ljava/lang/String;
    .locals 4

    const-string v3, "mupen64plus_next_gles3_libretro_android.so"
    invoke-static {p0}, Lpaulscode/android/mupen64plusae/SplashActivity;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0
    const-string v1, "/RetroArch/n64core.cfg"
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0 # Full path

    new-instance v1, Ljava/io/File;
    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z
    move-result v1

    if-nez v1, :cond_read
    return-object v3

    :cond_read
    :try_start
    new-instance v1, Ljava/io/BufferedReader;
    new-instance v2, Ljava/io/FileReader;
    invoke-direct {v2, v0}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V
    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    move-result-object v0 # Core Name
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    if-nez v0, :cond_exists
    return-object v3

    :cond_exists
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z
    move-result v2

    if-eqz v2, :cond_not_empty
    return-object v3

    :cond_not_empty
    return-object v0

    :try_end
    .catch Ljava/lang/Throwable; {:try_start .. :try_end} :catch_all

    :catch_all
    return-object v3
.end method

.method private startRetroArch()V
    .locals 3

    new-instance v0, Landroid/content/Intent;
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "com.retroarch.ra32"
    const-string v2, "com.retroarch.browser.retroactivity.RetroActivityFuture"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "ROM"
    invoke-direct {p0}, Lpaulscode/android/mupen64plusae/SplashActivity;->getRomString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "LIBRETRO"
    invoke-direct {p0}, Lpaulscode/android/mupen64plusae/SplashActivity;->getLibRetroString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "LIBRETRO_SD"
    invoke-direct {p0}, Lpaulscode/android/mupen64plusae/SplashActivity;->getLibRetroSDString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "CONFIGFILE"
    invoke-direct {p0}, Lpaulscode/android/mupen64plusae/SplashActivity;->getConfigString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "SDCARD"
    const-string v2, "/sdcard"
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "EXTERNAL"
    invoke-static {p0}, Lpaulscode/android/mupen64plusae/SplashActivity;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v1, 0x10000000
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lpaulscode/android/mupen64plusae/SplashActivity;->startActivity(Landroid/content/Intent;)V
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 13

    .line 1
    const-string v0, "Resource NOT found"

    .line 2
    .line 3
    const-string v1, "Resource found: "

    .line 4
    .line 5
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-direct {p0}, Lpaulscode/android/mupen64plusae/SplashActivity;->getConfigString()Ljava/lang/String;
    move-result-object v2
    new-instance v3, Ljava/io/File;
    invoke-direct {v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z
    move-result v3
    if-eqz v3, :cond_continue

    invoke-direct {p0}, Lpaulscode/android/mupen64plusae/SplashActivity;->getN64Path()Ljava/lang/String;
    move-result-object v2
    new-instance v3, Ljava/io/File;
    invoke-direct {v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->exists()Z
    move-result v3
    if-eqz v3, :cond_continue
    invoke-direct {p0}, Lpaulscode/android/mupen64plusae/SplashActivity;->startRetroArch()V
    invoke-virtual {p0}, Lpaulscode/android/mupen64plusae/SplashActivity;->finish()V
    return-void

    :cond_continue

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lpaulscode/android/mupen64plusae/util/DeviceUtil;->clearLogCat()V

    .line 9
    .line 10
    .line 11
    new-instance v2, Lpaulscode/android/mupen64plusae/persistent/AppData;

    .line 12
    .line 13
    invoke-direct {v2, p0}, Lpaulscode/android/mupen64plusae/persistent/AppData;-><init>(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    iput-object v2, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mAppData:Lpaulscode/android/mupen64plusae/persistent/AppData;

    .line 17
    .line 18
    new-instance v3, Lpaulscode/android/mupen64plusae/persistent/GlobalPrefs;

    .line 19
    .line 20
    invoke-direct {v3, p0, v2}, Lpaulscode/android/mupen64plusae/persistent/GlobalPrefs;-><init>(Landroid/content/Context;Lpaulscode/android/mupen64plusae/persistent/AppData;)V

    .line 21
    .line 22
    .line 23
    iput-object v3, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mGlobalPrefs:Lpaulscode/android/mupen64plusae/persistent/GlobalPrefs;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    const-string v4, "SplashActivity"

    .line 34
    .line 35
    const/4 v5, 0x0

    .line 36
    if-eqz v3, :cond_4

    .line 37
    .line 38
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 39
    .line 40
    new-instance v6, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    const-string v7, "SplashActivity == "

    .line 43
    .line 44
    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 48
    .line 49
    .line 50
    move-result-object v7

    .line 51
    invoke-virtual {v7}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v7

    .line 55
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v6

    .line 62
    invoke-virtual {v3, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    new-instance v3, Ljava/io/File;

    .line 66
    .line 67
    invoke-virtual {v2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 68
    .line 69
    .line 70
    move-result-object v6

    .line 71
    invoke-virtual {v6}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    invoke-direct {v3, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    xor-int/lit8 v6, v6, 0x1

    .line 83
    .line 84
    if-eqz v6, :cond_0

    .line 85
    .line 86
    invoke-virtual {v2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    goto :goto_0

    .line 99
    :cond_0
    invoke-static {v3}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    .line 100
    .line 101
    .line 102
    move-result-object v2

    .line 103
    :goto_0
    new-instance v3, Lpaulscode/android/mupen64plusae/util/RomHeader;

    .line 104
    .line 105
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 106
    .line 107
    .line 108
    move-result-object v6

    .line 109
    invoke-direct {v3, v6, v2}, Lpaulscode/android/mupen64plusae/util/RomHeader;-><init>(Landroid/content/Context;Landroid/net/Uri;)V

    .line 110
    .line 111
    .line 112
    new-instance v6, Ljava/lang/StringBuilder;

    .line 113
    .line 114
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 115
    .line 116
    .line 117
    iget-boolean v7, v3, Lpaulscode/android/mupen64plusae/util/RomHeader;->isValid:Z

    .line 118
    .line 119
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    const-string v7, " == "

    .line 123
    .line 124
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    iget-boolean v7, v3, Lpaulscode/android/mupen64plusae/util/RomHeader;->isNdd:Z

    .line 128
    .line 129
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v6

    .line 136
    invoke-static {v4, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    .line 138
    .line 139
    iget-boolean v6, v3, Lpaulscode/android/mupen64plusae/util/RomHeader;->isValid:Z

    .line 140
    .line 141
    if-nez v6, :cond_1

    .line 142
    .line 143
    iget-boolean v3, v3, Lpaulscode/android/mupen64plusae/util/RomHeader;->isNdd:Z

    .line 144
    .line 145
    if-eqz v3, :cond_4

    .line 146
    .line 147
    :cond_1
    invoke-static {}, Lpaulscode/android/mupen64plusae/util/RomDatabase;->getInstance()Lpaulscode/android/mupen64plusae/util/RomDatabase;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    invoke-virtual {v3}, Lpaulscode/android/mupen64plusae/util/RomDatabase;->hasDatabaseFile()Z

    .line 152
    .line 153
    .line 154
    move-result v6

    .line 155
    if-nez v6, :cond_2

    .line 156
    .line 157
    iget-object v6, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mAppData:Lpaulscode/android/mupen64plusae/persistent/AppData;

    .line 158
    .line 159
    iget-object v6, v6, Lpaulscode/android/mupen64plusae/persistent/AppData;->mupen64plus_ini:Ljava/lang/String;

    .line 160
    .line 161
    invoke-virtual {v3, v6}, Lpaulscode/android/mupen64plusae/util/RomDatabase;->setDatabaseFile(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    :cond_2
    new-instance v6, Lpaulscode/android/mupen64plusae/persistent/ConfigFile;

    .line 165
    .line 166
    iget-object v7, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mGlobalPrefs:Lpaulscode/android/mupen64plusae/persistent/GlobalPrefs;

    .line 167
    .line 168
    iget-object v7, v7, Lpaulscode/android/mupen64plusae/persistent/GlobalPrefs;->romInfoCacheCfg:Ljava/lang/String;

    .line 169
    .line 170
    invoke-direct {v6, v7}, Lpaulscode/android/mupen64plusae/persistent/ConfigFile;-><init>(Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 174
    .line 175
    .line 176
    move-result-object v6

    .line 177
    invoke-static {v6, v2}, Lpaulscode/android/mupen64plusae/util/FileUtil;->getFileName(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v6

    .line 181
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 182
    .line 183
    .line 184
    move-result-object v7

    .line 185
    invoke-virtual {v7}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 186
    .line 187
    .line 188
    move-result-object v7

    .line 189
    const-string v8, "r"

    .line 190
    .line 191
    invoke-virtual {v7, v2, v8}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    .line 192
    .line 193
    .line 194
    move-result-object v7
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    .line 195
    if-eqz v7, :cond_3

    .line 196
    .line 197
    :try_start_1
    new-instance v8, Ljava/io/BufferedInputStream;

    .line 198
    .line 199
    new-instance v9, Ljava/io/FileInputStream;

    .line 200
    .line 201
    invoke-virtual {v7}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    .line 202
    .line 203
    .line 204
    move-result-object v10

    .line 205
    invoke-direct {v9, v10}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V

    .line 206
    .line 207
    .line 208
    invoke-direct {v8, v9}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 209
    .line 210
    .line 211
    invoke-static {v8}, Lpaulscode/android/mupen64plusae/util/FileUtil;->computeMd5(Ljava/io/InputStream;)Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v8

    .line 215
    new-instance v9, Lpaulscode/android/mupen64plusae/util/RomHeader;

    .line 216
    .line 217
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 218
    .line 219
    .line 220
    move-result-object v10

    .line 221
    invoke-direct {v9, v10, v2}, Lpaulscode/android/mupen64plusae/util/RomHeader;-><init>(Landroid/content/Context;Landroid/net/Uri;)V

    .line 222
    .line 223
    .line 224
    new-instance v10, Ljava/lang/StringBuilder;

    .line 225
    .line 226
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 227
    .line 228
    .line 229
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 230
    .line 231
    .line 232
    const-string v11, " fileName "

    .line 233
    .line 234
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v10

    .line 244
    invoke-static {v4, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 245
    .line 246
    .line 247
    if-eqz v6, :cond_3

    .line 248
    .line 249
    iget-object v10, v9, Lpaulscode/android/mupen64plusae/util/RomHeader;->crc:Ljava/lang/String;

    .line 250
    .line 251
    iget-object v11, v9, Lpaulscode/android/mupen64plusae/util/RomHeader;->countryCode:Lpaulscode/android/mupen64plusae/util/CountryCode;

    .line 252
    .line 253
    invoke-virtual {v3, v8, v6, v10, v11}, Lpaulscode/android/mupen64plusae/util/RomDatabase;->lookupByMd5WithFallback(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lpaulscode/android/mupen64plusae/util/CountryCode;)Lpaulscode/android/mupen64plusae/util/RomDatabase$RomDetail;

    .line 254
    .line 255
    .line 256
    move-result-object v3

    .line 257
    new-instance v6, Ljava/lang/StringBuilder;

    .line 258
    .line 259
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 260
    .line 261
    .line 262
    iget-object v10, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mGlobalPrefs:Lpaulscode/android/mupen64plusae/persistent/GlobalPrefs;

    .line 263
    .line 264
    iget-object v10, v10, Lpaulscode/android/mupen64plusae/persistent/GlobalPrefs;->coverArtDir:Ljava/lang/String;

    .line 265
    .line 266
    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 267
    .line 268
    .line 269
    const-string v10, "/"

    .line 270
    .line 271
    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 272
    .line 273
    .line 274
    iget-object v10, v3, Lpaulscode/android/mupen64plusae/util/RomDatabase$RomDetail;->artName:Ljava/lang/String;

    .line 275
    .line 276
    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object v6

    .line 283
    new-instance v10, Landroid/content/Intent;

    .line 284
    .line 285
    const-class v11, Lpaulscode/android/mupen64plusae/game/GameActivity;

    .line 286
    .line 287
    invoke-direct {v10, p0, v11}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 288
    .line 289
    .line 290
    new-instance v11, Landroid/os/Bundle;

    .line 291
    .line 292
    invoke-direct {v11}, Landroid/os/Bundle;-><init>()V

    .line 293
    .line 294
    .line 295
    sget-object v12, Lpaulscode/android/mupen64plusae/ActivityHelper$Keys;->ROM_PATH:Ljava/lang/String;

    .line 296
    .line 297
    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object v2

    .line 301
    invoke-virtual {v10, v12, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 302
    .line 303
    .line 304
    sget-object v2, Lpaulscode/android/mupen64plusae/ActivityHelper$Keys;->ZIP_PATH:Ljava/lang/String;

    .line 305
    .line 306
    const-string v12, ""

    .line 307
    .line 308
    invoke-virtual {v10, v2, v12}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 309
    .line 310
    .line 311
    sget-object v2, Lpaulscode/android/mupen64plusae/ActivityHelper$Keys;->ROM_MD5:Ljava/lang/String;

    .line 312
    .line 313
    invoke-virtual {v10, v2, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 314
    .line 315
    .line 316
    sget-object v2, Lpaulscode/android/mupen64plusae/ActivityHelper$Keys;->ROM_CRC:Ljava/lang/String;

    .line 317
    .line 318
    iget-object v8, v9, Lpaulscode/android/mupen64plusae/util/RomHeader;->crc:Ljava/lang/String;

    .line 319
    .line 320
    invoke-virtual {v10, v2, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 321
    .line 322
    .line 323
    sget-object v2, Lpaulscode/android/mupen64plusae/ActivityHelper$Keys;->ROM_HEADER_NAME:Ljava/lang/String;

    .line 324
    .line 325
    iget-object v8, v9, Lpaulscode/android/mupen64plusae/util/RomHeader;->name:Ljava/lang/String;

    .line 326
    .line 327
    invoke-virtual {v10, v2, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 328
    .line 329
    .line 330
    sget-object v2, Lpaulscode/android/mupen64plusae/ActivityHelper$Keys;->ROM_COUNTRY_CODE:Ljava/lang/String;

    .line 331
    .line 332
    iget-object v8, v9, Lpaulscode/android/mupen64plusae/util/RomHeader;->countryCode:Lpaulscode/android/mupen64plusae/util/CountryCode;

    .line 333
    .line 334
    invoke-virtual {v8}, Lpaulscode/android/mupen64plusae/util/CountryCode;->getValue()B

    .line 335
    .line 336
    .line 337
    move-result v8

    .line 338
    invoke-virtual {v10, v2, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;B)Landroid/content/Intent;

    .line 339
    .line 340
    .line 341
    sget-object v2, Lpaulscode/android/mupen64plusae/ActivityHelper$Keys;->ROM_ART_PATH:Ljava/lang/String;

    .line 342
    .line 343
    invoke-virtual {v10, v2, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 344
    .line 345
    .line 346
    sget-object v2, Lpaulscode/android/mupen64plusae/ActivityHelper$Keys;->ROM_GOOD_NAME:Ljava/lang/String;

    .line 347
    .line 348
    iget-object v6, v3, Lpaulscode/android/mupen64plusae/util/RomDatabase$RomDetail;->goodName:Ljava/lang/String;

    .line 349
    .line 350
    invoke-virtual {v10, v2, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 351
    .line 352
    .line 353
    sget-object v2, Lpaulscode/android/mupen64plusae/ActivityHelper$Keys;->ROM_DISPLAY_NAME:Ljava/lang/String;

    .line 354
    .line 355
    iget-object v3, v3, Lpaulscode/android/mupen64plusae/util/RomDatabase$RomDetail;->goodName:Ljava/lang/String;

    .line 356
    .line 357
    invoke-virtual {v10, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 358
    .line 359
    .line 360
    sget-object v2, Lpaulscode/android/mupen64plusae/ActivityHelper$Keys;->DO_RESTART:Ljava/lang/String;

    .line 361
    .line 362
    invoke-virtual {v10, v2, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 363
    .line 364
    .line 365
    sget-object v2, Lpaulscode/android/mupen64plusae/ActivityHelper$Keys;->NETPLAY_ENABLED:Ljava/lang/String;

    .line 366
    .line 367
    invoke-virtual {v10, v2, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 368
    .line 369
    .line 370
    sget-object v2, Lpaulscode/android/mupen64plusae/ActivityHelper$Keys;->NETPLAY_SERVER:Ljava/lang/String;

    .line 371
    .line 372
    invoke-virtual {v10, v2, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 373
    .line 374
    .line 375
    invoke-virtual {v10, v11}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 376
    .line 377
    .line 378
    invoke-virtual {p0, v10}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 379
    .line 380
    .line 381
    invoke-virtual {p0}, Landroid/app/Activity;->finishAffinity()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 382
    .line 383
    .line 384
    :try_start_2
    invoke-virtual {v7}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_2 .. :try_end_2} :catch_0

    .line 385
    .line 386
    .line 387
    return-void

    .line 388
    :catch_0
    move-exception v2

    .line 389
    goto :goto_2

    .line 390
    :catch_1
    move-exception v2

    .line 391
    goto :goto_2

    .line 392
    :catchall_0
    move-exception v2

    .line 393
    :try_start_3
    invoke-virtual {v7}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 394
    .line 395
    .line 396
    goto :goto_1

    .line 397
    :catchall_1
    move-exception v3

    .line 398
    :try_start_4
    invoke-virtual {v2, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 399
    .line 400
    .line 401
    :goto_1
    throw v2

    .line 402
    :cond_3
    if-eqz v7, :cond_4

    .line 403
    .line 404
    invoke-virtual {v7}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_4 .. :try_end_4} :catch_0

    .line 405
    .line 406
    .line 407
    goto :goto_3

    .line 408
    :goto_2
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 409
    .line 410
    .line 411
    :cond_4
    :goto_3
    sget v2, Lpaulscode/android/mupen64plusae/R$xml;->preferences_audio:I

    .line 412
    .line 413
    invoke-static {p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferencesName(Landroid/content/Context;)Ljava/lang/String;

    .line 414
    .line 415
    .line 416
    move-result-object v3

    .line 417
    invoke-static {p0, v3, v2}, Landroidx/preference/PreferenceManager;->setDefaultValues(Landroid/content/Context;Ljava/lang/String;I)V

    .line 418
    .line 419
    .line 420
    sget v2, Lpaulscode/android/mupen64plusae/R$xml;->preferences_data:I

    .line 421
    .line 422
    invoke-static {p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferencesName(Landroid/content/Context;)Ljava/lang/String;

    .line 423
    .line 424
    .line 425
    move-result-object v3

    .line 426
    invoke-static {p0, v3, v2}, Landroidx/preference/PreferenceManager;->setDefaultValues(Landroid/content/Context;Ljava/lang/String;I)V

    .line 427
    .line 428
    .line 429
    sget v2, Lpaulscode/android/mupen64plusae/R$xml;->preferences_display:I

    .line 430
    .line 431
    invoke-static {p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferencesName(Landroid/content/Context;)Ljava/lang/String;

    .line 432
    .line 433
    .line 434
    move-result-object v3

    .line 435
    invoke-static {p0, v3, v2}, Landroidx/preference/PreferenceManager;->setDefaultValues(Landroid/content/Context;Ljava/lang/String;I)V

    .line 436
    .line 437
    .line 438
    sget v2, Lpaulscode/android/mupen64plusae/R$xml;->preferences_input:I

    .line 439
    .line 440
    invoke-static {p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferencesName(Landroid/content/Context;)Ljava/lang/String;

    .line 441
    .line 442
    .line 443
    move-result-object v3

    .line 444
    invoke-static {p0, v3, v2}, Landroidx/preference/PreferenceManager;->setDefaultValues(Landroid/content/Context;Ljava/lang/String;I)V

    .line 445
    .line 446
    .line 447
    sget v2, Lpaulscode/android/mupen64plusae/R$xml;->preferences_library:I

    .line 448
    .line 449
    invoke-static {p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferencesName(Landroid/content/Context;)Ljava/lang/String;

    .line 450
    .line 451
    .line 452
    move-result-object v3

    .line 453
    invoke-static {p0, v3, v2}, Landroidx/preference/PreferenceManager;->setDefaultValues(Landroid/content/Context;Ljava/lang/String;I)V

    .line 454
    .line 455
    .line 456
    sget v2, Lpaulscode/android/mupen64plusae/R$xml;->preferences_touchscreen:I

    .line 457
    .line 458
    invoke-static {p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferencesName(Landroid/content/Context;)Ljava/lang/String;

    .line 459
    .line 460
    .line 461
    move-result-object v3

    .line 462
    invoke-static {p0, v3, v2}, Landroidx/preference/PreferenceManager;->setDefaultValues(Landroid/content/Context;Ljava/lang/String;I)V

    .line 463
    .line 464
    .line 465
    new-instance v2, Lpaulscode/android/mupen64plusae/persistent/GlobalPrefs;

    .line 466
    .line 467
    iget-object v3, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mAppData:Lpaulscode/android/mupen64plusae/persistent/AppData;

    .line 468
    .line 469
    invoke-direct {v2, p0, v3}, Lpaulscode/android/mupen64plusae/persistent/GlobalPrefs;-><init>(Landroid/content/Context;Lpaulscode/android/mupen64plusae/persistent/AppData;)V

    .line 470
    .line 471
    .line 472
    iput-object v2, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mGlobalPrefs:Lpaulscode/android/mupen64plusae/persistent/GlobalPrefs;

    .line 473
    .line 474
    iget-object v2, v2, Lpaulscode/android/mupen64plusae/persistent/GlobalPrefs;->touchscreenCustomSkinsDir:Ljava/lang/String;

    .line 475
    .line 476
    invoke-static {v2}, Lpaulscode/android/mupen64plusae/util/FileUtil;->makeDirs(Ljava/lang/String;)V

    .line 477
    .line 478
    .line 479
    invoke-static {p0}, Lpaulscode/android/mupen64plusae/util/Notifier;->initialize(Landroid/app/Activity;)V

    .line 480
    .line 481
    .line 482
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 483
    .line 484
    .line 485
    move-result-object v2

    .line 486
    const/16 v3, 0x80

    .line 487
    .line 488
    invoke-virtual {v2, v3, v3}, Landroid/view/Window;->setFlags(II)V

    .line 489
    .line 490
    .line 491
    :try_start_5
    sget v2, Lpaulscode/android/mupen64plusae/R$layout;->splash_activity:I

    .line 492
    .line 493
    invoke-virtual {p0, v2}, Landroidx/appcompat/app/AppCompatActivity;->setContentView(I)V
    :try_end_5
    .catch Landroid/view/InflateException; {:try_start_5 .. :try_end_5} :catch_3

    .line 494
    .line 495
    .line 496
    sget v2, Lpaulscode/android/mupen64plusae/R$id;->mainText:I

    .line 497
    .line 498
    invoke-virtual {p0, v2}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 499
    .line 500
    .line 501
    move-result-object v2

    .line 502
    check-cast v2, Landroid/widget/TextView;

    .line 503
    .line 504
    iput-object v2, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mTextView:Landroid/widget/TextView;

    .line 505
    .line 506
    :try_start_6
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 507
    .line 508
    .line 509
    move-result-object v2

    .line 510
    sget v3, Lpaulscode/android/mupen64plusae/R$drawable;->ic_arrow_u:I

    .line 511
    .line 512
    const/4 v6, 0x0

    .line 513
    invoke-static {v2, v3, v6}, Landroidx/core/content/res/ResourcesCompat;->getDrawable(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    .line 514
    .line 515
    .line 516
    move-result-object v2

    .line 517
    if-eqz v2, :cond_5

    .line 518
    .line 519
    new-instance v3, Ljava/lang/StringBuilder;

    .line 520
    .line 521
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 522
    .line 523
    .line 524
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 525
    .line 526
    .line 527
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 528
    .line 529
    .line 530
    move-result-object v1

    .line 531
    invoke-static {v4, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_6 .. :try_end_6} :catch_2

    .line 532
    .line 533
    .line 534
    :cond_5
    iget-object v0, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mGlobalPrefs:Lpaulscode/android/mupen64plusae/persistent/GlobalPrefs;

    .line 535
    .line 536
    iget-boolean v0, v0, Lpaulscode/android/mupen64plusae/persistent/GlobalPrefs;->isBigScreenMode:Z

    .line 537
    .line 538
    if-eqz v0, :cond_6

    .line 539
    .line 540
    sget v0, Lpaulscode/android/mupen64plusae/R$id;->mainImage:I

    .line 541
    .line 542
    invoke-virtual {p0, v0}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 543
    .line 544
    .line 545
    move-result-object v0

    .line 546
    check-cast v0, Landroid/widget/ImageView;

    .line 547
    .line 548
    sget v1, Lpaulscode/android/mupen64plusae/R$drawable;->publisherlogo:I

    .line 549
    .line 550
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 551
    .line 552
    .line 553
    :cond_6
    iget-object v0, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mAppData:Lpaulscode/android/mupen64plusae/persistent/AppData;

    .line 554
    .line 555
    iget-boolean v1, v0, Lpaulscode/android/mupen64plusae/persistent/AppData;->isAndroidTv:Z

    .line 556
    .line 557
    if-eqz v1, :cond_7

    .line 558
    .line 559
    sget-boolean v1, Lpaulscode/android/mupen64plusae/persistent/AppData;->IS_OREO:Z

    .line 560
    .line 561
    if-eqz v1, :cond_7

    .line 562
    .line 563
    invoke-virtual {v0}, Lpaulscode/android/mupen64plusae/persistent/AppData;->getChannelId()J

    .line 564
    .line 565
    .line 566
    move-result-wide v0

    .line 567
    const-wide/16 v2, -0x1

    .line 568
    .line 569
    cmp-long v4, v0, v2

    .line 570
    .line 571
    if-nez v4, :cond_7

    .line 572
    .line 573
    invoke-direct {p0}, Lpaulscode/android/mupen64plusae/SplashActivity;->createChannel()V

    .line 574
    .line 575
    .line 576
    :cond_7
    if-eqz p1, :cond_8

    .line 577
    .line 578
    const-string v0, "STATE_REQUESTING_PERMISSIONS"

    .line 579
    .line 580
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    .line 581
    .line 582
    .line 583
    move-result p1

    .line 584
    iput-boolean p1, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mRequestingPermissions:Z

    .line 585
    .line 586
    :cond_8
    return-void

    .line 587
    :catch_2
    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 588
    .line 589
    .line 590
    sget p1, Lpaulscode/android/mupen64plusae/R$string;->invalidInstall_message:I

    .line 591
    .line 592
    new-array v0, v5, [Ljava/lang/Object;

    .line 593
    .line 594
    invoke-static {p0, p1, v0}, Lpaulscode/android/mupen64plusae/util/Notifier;->showToast(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 595
    .line 596
    .line 597
    return-void

    .line 598
    :catch_3
    invoke-static {v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 599
    .line 600
    .line 601
    sget p1, Lpaulscode/android/mupen64plusae/R$string;->invalidInstall_message:I

    .line 602
    .line 603
    new-array v0, v5, [Ljava/lang/Object;

    .line 604
    .line 605
    invoke-static {p0, p1, v0}, Lpaulscode/android/mupen64plusae/util/Notifier;->showToast(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 606
    .line 607
    .line 608
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 1
    const-string v0, "SplashActivity"

    .line 2
    .line 3
    const-string v1, "onDestroy"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    invoke-super {p0}, Landroidx/appcompat/app/AppCompatActivity;->onDestroy()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mPermissionsNeeded:Landroidx/appcompat/app/AlertDialog;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog;->dismiss$androidx$appcompat$app$AppCompatDialog()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public onExtractAssetsFinished(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lpaulscode/android/mupen64plusae/task/ExtractAssetsOrCleanupTask$Failure;",
            ">;)V"
        }
    .end annotation

    new-instance v0, Lpaulscode/android/mupen64plusae/SplashActivity$8;

    invoke-direct {v0, p0, p1}, Lpaulscode/android/mupen64plusae/SplashActivity$8;-><init>(Lpaulscode/android/mupen64plusae/SplashActivity;Ljava/util/List;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onExtractAssetsProgress(Ljava/lang/String;II)V
    .locals 1

    new-instance v0, Lpaulscode/android/mupen64plusae/SplashActivity$7;

    invoke-direct {v0, p0, p2, p3, p1}, Lpaulscode/android/mupen64plusae/SplashActivity$7;-><init>(Lpaulscode/android/mupen64plusae/SplashActivity;IILjava/lang/String;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 0

    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onNewIntent(Landroid/content/Intent;)V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/FragmentActivity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xb1

    .line 5
    .line 6
    if-ne p1, v0, :cond_4

    .line 7
    .line 8
    array-length p1, p2

    .line 9
    sget p2, Lpaulscode/android/mupen64plusae/SplashActivity;->NUM_PERMISSIONS:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    if-ne p1, p2, :cond_0

    .line 13
    .line 14
    array-length p1, p3

    .line 15
    if-ne p1, p2, :cond_0

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p1, 0x0

    .line 20
    :goto_0
    const/4 p2, 0x0

    .line 21
    :goto_1
    array-length v1, p3

    .line 22
    if-ge p2, v1, :cond_2

    .line 23
    .line 24
    if-eqz p1, :cond_2

    .line 25
    .line 26
    aget v1, p3, p2

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    goto :goto_2

    .line 31
    :cond_1
    add-int/lit8 p2, p2, 0x1

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_2
    if-nez p1, :cond_3

    .line 35
    .line 36
    :goto_2
    new-instance p1, Landroidx/appcompat/app/AlertDialog$Builder;

    .line 37
    .line 38
    invoke-direct {p1, p0}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 39
    .line 40
    .line 41
    sget p2, Lpaulscode/android/mupen64plusae/R$string;->assetExtractor_error:I

    .line 42
    .line 43
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    iget-object p3, p1, Landroidx/appcompat/app/AlertDialog$Builder;->P:Landroidx/appcompat/app/AlertController$AlertParams;

    .line 48
    .line 49
    iput-object p2, p3, Landroidx/appcompat/app/AlertController$AlertParams;->mTitle:Ljava/lang/CharSequence;

    .line 50
    .line 51
    sget p2, Lpaulscode/android/mupen64plusae/R$string;->assetExtractor_failed_permissions:I

    .line 52
    .line 53
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    iput-object p2, p3, Landroidx/appcompat/app/AlertController$AlertParams;->mMessage:Ljava/lang/CharSequence;

    .line 58
    .line 59
    const p2, 0x104000a

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    new-instance v1, Lpaulscode/android/mupen64plusae/SplashActivity$5;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Lpaulscode/android/mupen64plusae/SplashActivity$5;-><init>(Lpaulscode/android/mupen64plusae/SplashActivity;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1, p2, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 72
    .line 73
    .line 74
    iput-boolean v0, p3, Landroidx/appcompat/app/AlertController$AlertParams;->mCancelable:Z

    .line 75
    .line 76
    invoke-virtual {p1}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    invoke-virtual {p1}, Landroid/app/Dialog;->show()V

    .line 81
    .line 82
    .line 83
    iput-object p1, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mPermissionsNeeded:Landroidx/appcompat/app/AlertDialog;

    .line 84
    .line 85
    goto :goto_3

    .line 86
    :cond_3
    invoke-direct {p0}, Lpaulscode/android/mupen64plusae/SplashActivity;->checkExtractAssetsOrCleanup()V

    .line 87
    .line 88
    .line 89
    :cond_4
    :goto_3
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    const-string v0, "SplashActivity"

    const-string v1, "onSaveInstanceState"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "STATE_REQUESTING_PERMISSIONS"

    iget-boolean v1, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mRequestingPermissions:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-super {p0, p1}, Landroidx/activity/ComponentActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    return-void
.end method

.method public requestPermissions()V
    .locals 6

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 2
    .line 3
    const/16 v1, 0x1e

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/high16 v3, 0x1040000

    .line 7
    .line 8
    const v4, 0x104000a

    .line 9
    .line 10
    .line 11
    if-lt v0, v1, :cond_2

    .line 12
    .line 13
    const-string v1, "android. permission. POST_NOTIFICATIONS"

    .line 14
    .line 15
    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v5

    .line 19
    if-eqz v5, :cond_1

    .line 20
    .line 21
    const/16 v5, 0x21

    .line 22
    .line 23
    if-lt v0, v5, :cond_1

    .line 24
    .line 25
    invoke-static {p0, v1}, Landroidx/core/app/ActivityCompat;->shouldShowRequestPermissionRationale(Landroid/app/Activity;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    new-instance v0, Landroidx/appcompat/app/AlertDialog$Builder;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 34
    .line 35
    .line 36
    sget v1, Lpaulscode/android/mupen64plusae/R$string;->assetExtractor_permissions_title:I

    .line 37
    .line 38
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iget-object v5, v0, Landroidx/appcompat/app/AlertDialog$Builder;->P:Landroidx/appcompat/app/AlertController$AlertParams;

    .line 43
    .line 44
    iput-object v1, v5, Landroidx/appcompat/app/AlertController$AlertParams;->mTitle:Ljava/lang/CharSequence;

    .line 45
    .line 46
    sget v1, Lpaulscode/android/mupen64plusae/R$string;->assetExtractor_permissions_rationale_notifications:I

    .line 47
    .line 48
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iput-object v1, v5, Landroidx/appcompat/app/AlertController$AlertParams;->mMessage:Ljava/lang/CharSequence;

    .line 53
    .line 54
    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    new-instance v4, Lpaulscode/android/mupen64plusae/SplashActivity$2;

    .line 59
    .line 60
    invoke-direct {v4, p0}, Lpaulscode/android/mupen64plusae/SplashActivity$2;-><init>(Lpaulscode/android/mupen64plusae/SplashActivity;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v1, v4}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    new-instance v3, Lpaulscode/android/mupen64plusae/SplashActivity$1;

    .line 71
    .line 72
    invoke-direct {v3, p0}, Lpaulscode/android/mupen64plusae/SplashActivity$1;-><init>(Lpaulscode/android/mupen64plusae/SplashActivity;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v1, v3}, Landroidx/appcompat/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 76
    .line 77
    .line 78
    iput-boolean v2, v5, Landroidx/appcompat/app/AlertController$AlertParams;->mCancelable:Z

    .line 79
    .line 80
    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 85
    .line 86
    .line 87
    iput-object v0, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mPermissionsNeeded:Landroidx/appcompat/app/AlertDialog;

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_0
    invoke-virtual {p0}, Lpaulscode/android/mupen64plusae/SplashActivity;->actuallyRequestPermissions()V

    .line 91
    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_1
    invoke-direct {p0}, Lpaulscode/android/mupen64plusae/SplashActivity;->checkExtractAssetsOrCleanup()V

    .line 95
    .line 96
    .line 97
    :goto_0
    return-void

    .line 98
    :cond_2
    const-string v0, "android.permission.READ_EXTERNAL_STORAGE"

    .line 99
    .line 100
    invoke-static {p0, v0}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    const-string v5, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 105
    .line 106
    if-nez v1, :cond_4

    .line 107
    .line 108
    invoke-static {p0, v5}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    if-eqz v1, :cond_3

    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_3
    invoke-direct {p0}, Lpaulscode/android/mupen64plusae/SplashActivity;->checkExtractAssetsOrCleanup()V

    .line 116
    .line 117
    .line 118
    goto :goto_3

    .line 119
    :cond_4
    :goto_1
    invoke-static {p0, v0}, Landroidx/core/app/ActivityCompat;->shouldShowRequestPermissionRationale(Landroid/app/Activity;Ljava/lang/String;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-nez v0, :cond_6

    .line 124
    .line 125
    invoke-static {p0, v5}, Landroidx/core/app/ActivityCompat;->shouldShowRequestPermissionRationale(Landroid/app/Activity;Ljava/lang/String;)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-eqz v0, :cond_5

    .line 130
    .line 131
    goto :goto_2

    .line 132
    :cond_5
    invoke-virtual {p0}, Lpaulscode/android/mupen64plusae/SplashActivity;->actuallyRequestPermissions()V

    .line 133
    .line 134
    .line 135
    goto :goto_3

    .line 136
    :cond_6
    :goto_2
    new-instance v0, Landroidx/appcompat/app/AlertDialog$Builder;

    .line 137
    .line 138
    invoke-direct {v0, p0}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 139
    .line 140
    .line 141
    sget v1, Lpaulscode/android/mupen64plusae/R$string;->assetExtractor_permissions_title:I

    .line 142
    .line 143
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    iget-object v5, v0, Landroidx/appcompat/app/AlertDialog$Builder;->P:Landroidx/appcompat/app/AlertController$AlertParams;

    .line 148
    .line 149
    iput-object v1, v5, Landroidx/appcompat/app/AlertController$AlertParams;->mTitle:Ljava/lang/CharSequence;

    .line 150
    .line 151
    sget v1, Lpaulscode/android/mupen64plusae/R$string;->assetExtractor_permissions_rationale:I

    .line 152
    .line 153
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    iput-object v1, v5, Landroidx/appcompat/app/AlertController$AlertParams;->mMessage:Ljava/lang/CharSequence;

    .line 158
    .line 159
    invoke-virtual {p0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    new-instance v4, Lpaulscode/android/mupen64plusae/SplashActivity$4;

    .line 164
    .line 165
    invoke-direct {v4, p0}, Lpaulscode/android/mupen64plusae/SplashActivity$4;-><init>(Lpaulscode/android/mupen64plusae/SplashActivity;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v0, v1, v4}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    new-instance v3, Lpaulscode/android/mupen64plusae/SplashActivity$3;

    .line 176
    .line 177
    invoke-direct {v3, p0}, Lpaulscode/android/mupen64plusae/SplashActivity$3;-><init>(Lpaulscode/android/mupen64plusae/SplashActivity;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v0, v1, v3}, Landroidx/appcompat/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 181
    .line 182
    .line 183
    iput-boolean v2, v5, Landroidx/appcompat/app/AlertController$AlertParams;->mCancelable:Z

    .line 184
    .line 185
    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 190
    .line 191
    .line 192
    iput-object v0, p0, Lpaulscode/android/mupen64plusae/SplashActivity;->mPermissionsNeeded:Landroidx/appcompat/app/AlertDialog;

    .line 193
    .line 194
    :goto_3
    return-void
.end method
