.class public Lcom/junction/fire/gametemplate/GameTemplate;
.super Landroid/app/Activity;
.source "GameTemplate.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/junction/fire/gametemplate/GameTemplate$PlayerCallback;,
        Lcom/junction/fire/gametemplate/GameTemplate$SDCardBroadcastReceiver;,
        Lcom/junction/fire/gametemplate/GameTemplate$ScreenBroadcastReceiver;
    }
.end annotation


# static fields
.field static final COLOR_FORMAT:Landroid/graphics/Bitmap$Config;

.field private static adsView:Landroid/view/View;

.field protected static mTfcardpath:Ljava/lang/String;

.field private static mclickplay:Z

.field private static mediaPlayer:Landroid/media/MediaPlayer;


# instance fields
.field final TouchLight:Landroid/view/View$OnTouchListener;

.field abxy:I

.field private acc_x:F

.field private acc_y:F

.field private acc_z:F

.field keystate:I

.field mClickComplet:Landroid/media/MediaPlayer$OnCompletionListener;

.field mClicklisten:Landroid/media/MediaPlayer$OnPreparedListener;

.field mEmptyLayout:Landroid/widget/FrameLayout;

.field mGameLayout:Landroid/widget/FrameLayout;

.field mGameView:Lcom/junction/fire/gametemplate/GameView;

.field mOrientation:I

.field mPath:Ljava/lang/String;

.field mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

.field mPlayerCB:Lcom/junction/fire/gametemplate/GameTemplate$PlayerCallback;

.field public mUI_Handler:Landroid/os/Handler;

.field private prepath:Ljava/lang/String;

.field screenreceiver:Lcom/junction/fire/gametemplate/GameTemplate$ScreenBroadcastReceiver;

.field sd_id:Landroid/view/View;

.field sdreceiver:Lcom/junction/fire/gametemplate/GameTemplate$SDCardBroadcastReceiver;

.field private sensor:Landroid/hardware/Sensor;

.field private final sensorListener:Landroid/hardware/SensorEventListener;

.field private sensorMgr:Landroid/hardware/SensorManager;

.field private update:Lcom/cx/update/UpdateTask;

.field private wm:Landroid/view/WindowManager;

.field private wmParams:Landroid/view/WindowManager$LayoutParams;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 86
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    sput-object v0, Lcom/junction/fire/gametemplate/GameTemplate;->COLOR_FORMAT:Landroid/graphics/Bitmap$Config;

    .line 142
    sput-object v1, Lcom/junction/fire/gametemplate/GameTemplate;->adsView:Landroid/view/View;

    .line 382
    sput-object v1, Lcom/junction/fire/gametemplate/GameTemplate;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 383
    const/4 v0, 0x0

    sput-boolean v0, Lcom/junction/fire/gametemplate/GameTemplate;->mclickplay:Z

    .line 445
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 85
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 87
    iput-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPath:Ljava/lang/String;

    .line 92
    iput-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mGameView:Lcom/junction/fire/gametemplate/GameView;

    .line 94
    iput-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    .line 95
    new-instance v0, Lcom/junction/fire/gametemplate/GameTemplate$PlayerCallback;

    invoke-direct {v0, p0, v1}, Lcom/junction/fire/gametemplate/GameTemplate$PlayerCallback;-><init>(Lcom/junction/fire/gametemplate/GameTemplate;Lcom/junction/fire/gametemplate/GameTemplate$PlayerCallback;)V

    iput-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayerCB:Lcom/junction/fire/gametemplate/GameTemplate$PlayerCallback;

    .line 99
    iput-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->sensorMgr:Landroid/hardware/SensorManager;

    .line 100
    iput-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->sensor:Landroid/hardware/Sensor;

    .line 101
    new-instance v0, Lcom/junction/fire/gametemplate/GameTemplate$1;

    invoke-direct {v0, p0}, Lcom/junction/fire/gametemplate/GameTemplate$1;-><init>(Lcom/junction/fire/gametemplate/GameTemplate;)V

    iput-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->sensorListener:Landroid/hardware/SensorEventListener;

    .line 243
    new-instance v0, Lcom/junction/fire/gametemplate/GameTemplate$2;

    invoke-direct {v0, p0}, Lcom/junction/fire/gametemplate/GameTemplate$2;-><init>(Lcom/junction/fire/gametemplate/GameTemplate;)V

    iput-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->TouchLight:Landroid/view/View$OnTouchListener;

    .line 384
    new-instance v0, Lcom/junction/fire/gametemplate/GameTemplate$3;

    invoke-direct {v0, p0}, Lcom/junction/fire/gametemplate/GameTemplate$3;-><init>(Lcom/junction/fire/gametemplate/GameTemplate;)V

    iput-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mClicklisten:Landroid/media/MediaPlayer$OnPreparedListener;

    .line 392
    new-instance v0, Lcom/junction/fire/gametemplate/GameTemplate$4;

    invoke-direct {v0, p0}, Lcom/junction/fire/gametemplate/GameTemplate$4;-><init>(Lcom/junction/fire/gametemplate/GameTemplate;)V

    iput-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mClickComplet:Landroid/media/MediaPlayer$OnCompletionListener;

    .line 403
    iput-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->sd_id:Landroid/view/View;

    .line 404
    new-instance v0, Lcom/junction/fire/gametemplate/GameTemplate$5;

    invoke-direct {v0, p0}, Lcom/junction/fire/gametemplate/GameTemplate$5;-><init>(Lcom/junction/fire/gametemplate/GameTemplate;)V

    iput-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mUI_Handler:Landroid/os/Handler;

    .line 649
    iput-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->sdreceiver:Lcom/junction/fire/gametemplate/GameTemplate$SDCardBroadcastReceiver;

    .line 722
    iput-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->screenreceiver:Lcom/junction/fire/gametemplate/GameTemplate$ScreenBroadcastReceiver;

    .line 781
    iput-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->update:Lcom/cx/update/UpdateTask;

    .line 1040
    const-string v0, ""

    iput-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->prepath:Ljava/lang/String;

    .line 1187
    iput v2, p0, Lcom/junction/fire/gametemplate/GameTemplate;->keystate:I

    .line 1238
    iput v2, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    .line 85
    return-void
.end method

.method private GetPackageVersion(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 226
    :try_start_0
    invoke-virtual {p0}, Lcom/junction/fire/gametemplate/GameTemplate;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 230
    :goto_0
    return-object v1

    .line 228
    :catch_0
    move-exception v0

    .line 230
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static HideAds()V
    .locals 2

    .prologue
    .line 207
    sget-object v0, Lcom/junction/fire/gametemplate/GameTemplate;->adsView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 208
    sget-object v0, Lcom/junction/fire/gametemplate/GameTemplate;->adsView:Landroid/view/View;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 210
    :cond_0
    return-void
.end method

.method private OnlineConfig_Move()V
    .locals 0

    .prologue
    .line 363
    return-void
.end method

.method private OnlineConfig_New()V
    .locals 0

    .prologue
    .line 309
    return-void
.end method

.method private ParseURLPackageName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "URL"    # Ljava/lang/String;

    .prologue
    .line 235
    const/16 v2, 0x3d

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 236
    .local v1, "start":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 237
    add-int/lit8 v2, v1, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 240
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static ShowAds()V
    .locals 2

    .prologue
    .line 202
    sget-object v0, Lcom/junction/fire/gametemplate/GameTemplate;->adsView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 203
    sget-object v0, Lcom/junction/fire/gametemplate/GameTemplate;->adsView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 205
    :cond_0
    return-void
.end method

.method static synthetic access$0(Lcom/junction/fire/gametemplate/GameTemplate;F)V
    .locals 0

    .prologue
    .line 98
    iput p1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->acc_x:F

    return-void
.end method

.method static synthetic access$1(Lcom/junction/fire/gametemplate/GameTemplate;F)V
    .locals 0

    .prologue
    .line 98
    iput p1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->acc_y:F

    return-void
.end method

.method static synthetic access$10(Lcom/junction/fire/gametemplate/GameTemplate;I)V
    .locals 0

    .prologue
    .line 666
    invoke-direct {p0, p1}, Lcom/junction/fire/gametemplate/GameTemplate;->writeled(I)V

    return-void
.end method

.method static synthetic access$11(Lcom/junction/fire/gametemplate/GameTemplate;)I
    .locals 1

    .prologue
    .line 650
    invoke-direct {p0}, Lcom/junction/fire/gametemplate/GameTemplate;->readled()I

    move-result v0

    return v0
.end method

.method static synthetic access$2(Lcom/junction/fire/gametemplate/GameTemplate;F)V
    .locals 0

    .prologue
    .line 98
    iput p1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->acc_z:F

    return-void
.end method

.method static synthetic access$3(Lcom/junction/fire/gametemplate/GameTemplate;)F
    .locals 1

    .prologue
    .line 98
    iget v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->acc_x:F

    return v0
.end method

.method static synthetic access$4(Lcom/junction/fire/gametemplate/GameTemplate;)F
    .locals 1

    .prologue
    .line 98
    iget v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->acc_y:F

    return v0
.end method

.method static synthetic access$5(Lcom/junction/fire/gametemplate/GameTemplate;)F
    .locals 1

    .prologue
    .line 98
    iget v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->acc_z:F

    return v0
.end method

.method static synthetic access$6()Z
    .locals 1

    .prologue
    .line 383
    sget-boolean v0, Lcom/junction/fire/gametemplate/GameTemplate;->mclickplay:Z

    return v0
.end method

.method static synthetic access$7(Z)V
    .locals 0

    .prologue
    .line 383
    sput-boolean p0, Lcom/junction/fire/gametemplate/GameTemplate;->mclickplay:Z

    return-void
.end method

.method static synthetic access$8()Landroid/media/MediaPlayer;
    .locals 1

    .prologue
    .line 382
    sget-object v0, Lcom/junction/fire/gametemplate/GameTemplate;->mediaPlayer:Landroid/media/MediaPlayer;

    return-object v0
.end method

.method static synthetic access$9(Lcom/junction/fire/gametemplate/GameTemplate;)V
    .locals 0

    .prologue
    .line 1041
    invoke-direct {p0}, Lcom/junction/fire/gametemplate/GameTemplate;->rungame()V

    return-void
.end method

.method private checkPermission()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 489
    :try_start_0
    const-string v2, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-virtual {p0, v2}, Lcom/junction/fire/gametemplate/GameTemplate;->checkSelfPermission(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NoSuchMethodError; {:try_start_0 .. :try_end_0} :catch_0

    move-result v2

    if-nez v2, :cond_0

    .line 495
    :goto_0
    return v1

    .line 489
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 493
    :catch_0
    move-exception v0

    .line 495
    .local v0, "e":Ljava/lang/NoSuchMethodError;
    goto :goto_0
.end method

.method private copybios()V
    .locals 6

    .prologue
    .line 530
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v3

    const-string v4, "su"

    invoke-virtual {v3, v4}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v2

    .line 531
    .local v2, "p":Ljava/lang/Process;
    new-instance v1, Ljava/io/DataOutputStream;

    invoke-virtual {v2}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 532
    .local v1, "os":Ljava/io/DataOutputStream;
    const-string v3, "echo 0 > /sys/devices/platform/mt_usb/musb-hdrc/cmode\n"

    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 533
    const-string v3, "exit\n"

    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 534
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->flush()V

    .line 535
    invoke-virtual {v2}, Ljava/lang/Process;->waitFor()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 541
    .end local v1    # "os":Ljava/io/DataOutputStream;
    .end local v2    # "p":Ljava/lang/Process;
    :goto_0
    const-wide/16 v4, 0x64

    :try_start_1
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    .line 547
    :goto_1
    :try_start_2
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v3

    const-string v4, "su"

    invoke-virtual {v3, v4}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v2

    .line 548
    .restart local v2    # "p":Ljava/lang/Process;
    new-instance v1, Ljava/io/DataOutputStream;

    invoke-virtual {v2}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 549
    .restart local v1    # "os":Ljava/io/DataOutputStream;
    const-string v3, "echo 1 > /sys/devices/platform/mt_usb/musb-hdrc/cmode\n"

    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 550
    const-string v3, "exit\n"

    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 551
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->flush()V

    .line 552
    invoke-virtual {v2}, Ljava/lang/Process;->waitFor()I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 557
    .end local v1    # "os":Ljava/io/DataOutputStream;
    .end local v2    # "p":Ljava/lang/Process;
    :goto_2
    return-void

    .line 536
    :catch_0
    move-exception v0

    .line 538
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 542
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v0

    .line 544
    .local v0, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1

    .line 553
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catch_2
    move-exception v0

    .line 555
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2
.end method

.method private copydir(Ljava/lang/String;Ljava/lang/String;)V
    .locals 16
    .param p1, "src"    # Ljava/lang/String;
    .param p2, "dist"    # Ljava/lang/String;

    .prologue
    .line 560
    new-instance v12, Ljava/io/File;

    move-object/from16 v0, p1

    invoke-direct {v12, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v6

    .line 561
    .local v6, "fs":[Ljava/io/File;
    if-nez v6, :cond_1

    .line 601
    :cond_0
    :goto_0
    return-void

    .line 563
    :cond_1
    array-length v13, v6

    const/4 v12, 0x0

    :goto_1
    if-ge v12, v13, :cond_0

    aget-object v1, v6, v12

    .line 565
    .local v1, "T":Ljava/io/File;
    new-instance v11, Ljava/io/File;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v15, "/"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-direct {v11, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 567
    .local v11, "sdf":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v14

    if-eqz v14, :cond_2

    .line 569
    invoke-virtual {v11}, Ljava/io/File;->mkdir()Z

    .line 570
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-static/range {p1 .. p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v13, "/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v14, "/"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-direct {v0, v12, v13}, Lcom/junction/fire/gametemplate/GameTemplate;->copydir(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 574
    :cond_2
    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    move-result v14

    if-nez v14, :cond_3

    .line 576
    const/4 v7, 0x0

    .line 577
    .local v7, "input":Ljava/io/InputStream;
    const/4 v9, 0x0

    .line 579
    .local v9, "output":Ljava/io/OutputStream;
    :try_start_0
    new-instance v8, Ljava/io/FileInputStream;

    invoke-direct {v8, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 580
    .end local v7    # "input":Ljava/io/InputStream;
    .local v8, "input":Ljava/io/InputStream;
    :try_start_1
    new-instance v10, Ljava/io/FileOutputStream;

    invoke-direct {v10, v11}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_5
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 581
    .end local v9    # "output":Ljava/io/OutputStream;
    .local v10, "output":Ljava/io/OutputStream;
    const/16 v14, 0x2000

    :try_start_2
    new-array v2, v14, [B

    .line 583
    .local v2, "buf":[B
    :goto_2
    invoke-virtual {v8, v2}, Ljava/io/InputStream;->read([B)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    move-result v3

    .local v3, "bytesRead":I
    if-gtz v3, :cond_4

    .line 591
    :try_start_3
    invoke-virtual {v8}, Ljava/io/InputStream;->close()V

    .line 592
    invoke-virtual {v10}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 563
    .end local v2    # "buf":[B
    .end local v3    # "bytesRead":I
    .end local v8    # "input":Ljava/io/InputStream;
    .end local v10    # "output":Ljava/io/OutputStream;
    :cond_3
    :goto_3
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_1

    .line 584
    .restart local v2    # "buf":[B
    .restart local v3    # "bytesRead":I
    .restart local v8    # "input":Ljava/io/InputStream;
    .restart local v10    # "output":Ljava/io/OutputStream;
    :cond_4
    const/4 v14, 0x0

    :try_start_4
    invoke-virtual {v10, v2, v14, v3}, Ljava/io/OutputStream;->write([BII)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_2

    .line 586
    .end local v2    # "buf":[B
    .end local v3    # "bytesRead":I
    :catch_0
    move-exception v5

    move-object v9, v10

    .end local v10    # "output":Ljava/io/OutputStream;
    .restart local v9    # "output":Ljava/io/OutputStream;
    move-object v7, v8

    .line 588
    .end local v8    # "input":Ljava/io/InputStream;
    .local v5, "ex":Ljava/lang/Exception;
    .restart local v7    # "input":Ljava/io/InputStream;
    :goto_4
    :try_start_5
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 591
    :try_start_6
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    .line 592
    invoke-virtual {v9}, Ljava/io/OutputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_3

    .line 593
    :catch_1
    move-exception v4

    .line 595
    .local v4, "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3

    .line 589
    .end local v4    # "e":Ljava/lang/Exception;
    .end local v5    # "ex":Ljava/lang/Exception;
    :catchall_0
    move-exception v12

    .line 591
    :goto_5
    :try_start_7
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    .line 592
    invoke-virtual {v9}, Ljava/io/OutputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    .line 598
    :goto_6
    throw v12

    .line 593
    :catch_2
    move-exception v4

    .line 595
    .restart local v4    # "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_6

    .line 593
    .end local v4    # "e":Ljava/lang/Exception;
    .end local v7    # "input":Ljava/io/InputStream;
    .end local v9    # "output":Ljava/io/OutputStream;
    .restart local v2    # "buf":[B
    .restart local v3    # "bytesRead":I
    .restart local v8    # "input":Ljava/io/InputStream;
    .restart local v10    # "output":Ljava/io/OutputStream;
    :catch_3
    move-exception v4

    .line 595
    .restart local v4    # "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3

    .line 589
    .end local v2    # "buf":[B
    .end local v3    # "bytesRead":I
    .end local v4    # "e":Ljava/lang/Exception;
    .end local v10    # "output":Ljava/io/OutputStream;
    .restart local v9    # "output":Ljava/io/OutputStream;
    :catchall_1
    move-exception v12

    move-object v7, v8

    .end local v8    # "input":Ljava/io/InputStream;
    .restart local v7    # "input":Ljava/io/InputStream;
    goto :goto_5

    .end local v7    # "input":Ljava/io/InputStream;
    .end local v9    # "output":Ljava/io/OutputStream;
    .restart local v8    # "input":Ljava/io/InputStream;
    .restart local v10    # "output":Ljava/io/OutputStream;
    :catchall_2
    move-exception v12

    move-object v9, v10

    .end local v10    # "output":Ljava/io/OutputStream;
    .restart local v9    # "output":Ljava/io/OutputStream;
    move-object v7, v8

    .end local v8    # "input":Ljava/io/InputStream;
    .restart local v7    # "input":Ljava/io/InputStream;
    goto :goto_5

    .line 586
    :catch_4
    move-exception v5

    goto :goto_4

    .end local v7    # "input":Ljava/io/InputStream;
    .restart local v8    # "input":Ljava/io/InputStream;
    :catch_5
    move-exception v5

    move-object v7, v8

    .end local v8    # "input":Ljava/io/InputStream;
    .restart local v7    # "input":Ljava/io/InputStream;
    goto :goto_4
.end method

.method private copyres(Ljava/lang/String;)V
    .locals 2
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 606
    new-instance v0, Ljava/io/File;

    const-string v1, "/sdcard/DraStic"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 607
    .local v0, "dr":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 615
    :goto_0
    return-void

    .line 609
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->mkdir()Z

    .line 614
    const-string v1, "/sdcard/DraStic"

    invoke-direct {p0, p1, v1}, Lcom/junction/fire/gametemplate/GameTemplate;->copydir(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    .locals 14
    .param p0, "context"    # Landroid/content/Context;

    .prologue
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

.method private killproc(Ljava/lang/String;)V
    .locals 5
    .param p1, "pn"    # Ljava/lang/String;

    .prologue
    .line 514
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v3

    const-string v4, "su"

    invoke-virtual {v3, v4}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v2

    .line 515
    .local v2, "p":Ljava/lang/Process;
    new-instance v1, Ljava/io/DataOutputStream;

    invoke-virtual {v2}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 516
    .local v1, "os":Ljava/io/DataOutputStream;
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "killall -9 "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 517
    const-string v3, "exit\n"

    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 518
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->flush()V

    .line 519
    invoke-virtual {v2}, Ljava/lang/Process;->waitFor()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 524
    .end local v1    # "os":Ljava/io/DataOutputStream;
    .end local v2    # "p":Ljava/lang/Process;
    :goto_0
    return-void

    .line 520
    :catch_0
    move-exception v0

    .line 522
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private readled()I
    .locals 5

    .prologue
    .line 652
    new-instance v1, Ljava/io/File;

    const-string v4, "/sys/class/gpio/gpio169/value"

    invoke-direct {v1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 654
    .local v1, "f":Ljava/io/File;
    :try_start_0
    new-instance v2, Ljava/io/FileReader;

    invoke-direct {v2, v1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    .line 655
    .local v2, "r":Ljava/io/FileReader;
    invoke-virtual {v2}, Ljava/io/FileReader;->read()I

    move-result v3

    .line 657
    .local v3, "ret":I
    invoke-virtual {v2}, Ljava/io/FileReader;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 663
    .end local v2    # "r":Ljava/io/FileReader;
    .end local v3    # "ret":I
    :goto_0
    return v3

    .line 659
    :catch_0
    move-exception v0

    .line 661
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 663
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private readmode()Ljava/lang/String;
    .locals 7

    .prologue
    .line 759
    const-string v4, ""

    .line 760
    .local v4, "ret":Ljava/lang/String;
    const/4 v2, 0x0

    .line 763
    .local v2, "input":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/FileReader;

    const-string v6, "system/etc/model"

    invoke-direct {v5, v6}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 764
    .end local v2    # "input":Ljava/io/BufferedReader;
    .local v3, "input":Ljava/io/BufferedReader;
    :try_start_1
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v4

    .line 771
    :try_start_2
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    move-object v2, v3

    .line 778
    .end local v3    # "input":Ljava/io/BufferedReader;
    .restart local v2    # "input":Ljava/io/BufferedReader;
    :goto_0
    return-object v4

    .line 767
    :catch_0
    move-exception v1

    .line 768
    .local v1, "ex":Ljava/lang/Exception;
    :goto_1
    :try_start_3
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 771
    :try_start_4
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_0

    .line 772
    :catch_1
    move-exception v0

    .line 774
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 769
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "ex":Ljava/lang/Exception;
    :catchall_0
    move-exception v5

    .line 771
    :goto_2
    :try_start_5
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .line 777
    :goto_3
    throw v5

    .line 772
    :catch_2
    move-exception v0

    .line 774
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3

    .line 772
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "input":Ljava/io/BufferedReader;
    .restart local v3    # "input":Ljava/io/BufferedReader;
    :catch_3
    move-exception v0

    .line 774
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    move-object v2, v3

    .end local v3    # "input":Ljava/io/BufferedReader;
    .restart local v2    # "input":Ljava/io/BufferedReader;
    goto :goto_0

    .line 769
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "input":Ljava/io/BufferedReader;
    .restart local v3    # "input":Ljava/io/BufferedReader;
    :catchall_1
    move-exception v5

    move-object v2, v3

    .end local v3    # "input":Ljava/io/BufferedReader;
    .restart local v2    # "input":Ljava/io/BufferedReader;
    goto :goto_2

    .line 767
    .end local v2    # "input":Ljava/io/BufferedReader;
    .restart local v3    # "input":Ljava/io/BufferedReader;
    :catch_4
    move-exception v1

    move-object v2, v3

    .end local v3    # "input":Ljava/io/BufferedReader;
    .restart local v2    # "input":Ljava/io/BufferedReader;
    goto :goto_1
.end method

.method private requestPermission()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 502
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_0

    .line 503
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "android.permission.EXECUTE_SHELL_COMMANDS"

    aput-object v1, v0, v3

    const-string v1, "android.permission.READ_EXTERNAL_STORAGE"

    aput-object v1, v0, v2

    .line 504
    const-string v1, "android.permission.MANAGE_EXTERNAL_STORAGE"

    aput-object v1, v0, v4

    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    aput-object v1, v0, v5

    .line 503
    invoke-virtual {p0, v0, v2}, Lcom/junction/fire/gametemplate/GameTemplate;->requestPermissions([Ljava/lang/String;I)V

    .line 509
    :goto_0
    return-void

    .line 506
    :cond_0
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    aput-object v1, v0, v3

    const-string v1, "android.permission.READ_EXTERNAL_STORAGE"

    aput-object v1, v0, v2

    .line 507
    const-string v1, "android.permission.MANAGE_EXTERNAL_STORAGE"

    aput-object v1, v0, v4

    .line 506
    invoke-virtual {p0, v0, v2}, Lcom/junction/fire/gametemplate/GameTemplate;->requestPermissions([Ljava/lang/String;I)V

    goto :goto_0
.end method

.method private rungame()V
    .locals 3

    .prologue
    .line 1043
    invoke-static {p0}, Lcom/junction/fire/gametemplate/GameTemplate;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/junction/fire/gametemplate/GameTemplate;->mTfcardpath:Ljava/lang/String;

    .line 1044
    new-instance v0, Ljava/lang/StringBuilder;

    sget-object v1, Lcom/junction/fire/gametemplate/GameTemplate;->mTfcardpath:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "/data.pud"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPath:Ljava/lang/String;

    .line 1045
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    sget-object v2, Lcom/junction/fire/gametemplate/GameTemplate;->mTfcardpath:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "/iroms"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1047
    new-instance v0, Ljava/io/File;

    const-string v1, "/system/sdcard/data.pud"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1048
    const-string v0, "/system/sdcard/data.pud"

    iput-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPath:Ljava/lang/String;

    .line 1051
    :cond_0
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "=====mPath====="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1052
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    if-nez v0, :cond_1

    .line 1054
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPath:Ljava/lang/String;

    iput-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->prepath:Ljava/lang/String;

    .line 1055
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPath:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/junction/fire/gametemplate/GameTemplate;->CreatePlayer(Ljava/lang/String;)V

    .line 1056
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    invoke-virtual {v0}, Lcom/junction/fire/engine/FireEnginePlayer;->ResumePlayer()V

    .line 1068
    :goto_0
    return-void

    .line 1060
    :cond_1
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->prepath:Ljava/lang/String;

    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 1062
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "==reloadPlayer=="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPath:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1063
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/junction/fire/engine/FireEnginePlayer;->reloadPlayer(Ljava/lang/String;)V

    .line 1066
    :cond_2
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPath:Ljava/lang/String;

    iput-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->prepath:Ljava/lang/String;

    goto :goto_0
.end method

.method private startTestmode()V
    .locals 3

    .prologue
    .line 136
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 137
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "com.rk.testmode"

    const-string v2, "com.rk.testmode.MainActivity"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 138
    invoke-virtual {p0, v0}, Lcom/junction/fire/gametemplate/GameTemplate;->startActivity(Landroid/content/Intent;)V

    .line 140
    return-void
.end method

.method private writeled(I)V
    .locals 4
    .param p1, "stat"    # I

    .prologue
    .line 668
    new-instance v1, Ljava/io/File;

    const-string v3, "/sys/class/gpio/gpio169/value"

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 670
    .local v1, "f":Ljava/io/File;
    :try_start_0
    new-instance v2, Ljava/io/FileWriter;

    invoke-direct {v2, v1}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    .line 671
    .local v2, "r":Ljava/io/FileWriter;
    invoke-virtual {v2, p1}, Ljava/io/FileWriter;->write(I)V

    .line 672
    invoke-virtual {v2}, Ljava/io/FileWriter;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 678
    .end local v2    # "r":Ljava/io/FileWriter;
    :goto_0
    return-void

    .line 674
    :catch_0
    move-exception v0

    .line 676
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public CreatAdsView()V
    .locals 3

    .prologue
    const/4 v2, -0x2

    .line 146
    sget-object v0, Lcom/junction/fire/gametemplate/GameTemplate;->adsView:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 199
    :goto_0
    return-void

    .line 182
    :cond_0
    invoke-virtual {p0}, Lcom/junction/fire/gametemplate/GameTemplate;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "window"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    iput-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->wm:Landroid/view/WindowManager;

    .line 183
    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v0}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    iput-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->wmParams:Landroid/view/WindowManager$LayoutParams;

    .line 185
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->wmParams:Landroid/view/WindowManager$LayoutParams;

    const/16 v1, 0x7d2

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 186
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->wmParams:Landroid/view/WindowManager$LayoutParams;

    const/4 v1, 0x1

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->format:I

    .line 188
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->wmParams:Landroid/view/WindowManager$LayoutParams;

    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 189
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->wmParams:Landroid/view/WindowManager$LayoutParams;

    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 191
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->wmParams:Landroid/view/WindowManager$LayoutParams;

    const/16 v1, 0x28

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 194
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->wmParams:Landroid/view/WindowManager$LayoutParams;

    const v1, 0x3f4ccccd    # 0.8f

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->alpha:F

    .line 195
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->wmParams:Landroid/view/WindowManager$LayoutParams;

    const/16 v1, 0x31

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    .line 197
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->wm:Landroid/view/WindowManager;

    sget-object v1, Lcom/junction/fire/gametemplate/GameTemplate;->adsView:Landroid/view/View;

    iget-object v2, p0, Lcom/junction/fire/gametemplate/GameTemplate;->wmParams:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v0, v1, v2}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0
.end method

.method CreatePlayer(Ljava/lang/String;)V
    .locals 3
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 1088
    invoke-static {}, Lcom/junction/fire/gametemplate/GameView;->GetSurfaceBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 1090
    .local v0, "mBmp":Landroid/graphics/Bitmap;
    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    if-eqz v1, :cond_0

    .line 1091
    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    invoke-virtual {v1, v0}, Lcom/junction/fire/engine/FireEnginePlayer;->ChangeFrameBmp(Landroid/graphics/Bitmap;)V

    .line 1097
    :goto_0
    return-void

    .line 1093
    :cond_0
    new-instance v1, Lcom/junction/fire/engine/FireEnginePlayer;

    iget-object v2, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayerCB:Lcom/junction/fire/gametemplate/GameTemplate$PlayerCallback;

    invoke-direct {v1, p0, p1, v0, v2}, Lcom/junction/fire/engine/FireEnginePlayer;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/graphics/Bitmap;Lcom/junction/fire/engine/FireEnginePlayer$FirePlayerCallback;)V

    iput-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    .line 1094
    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    invoke-virtual {v1}, Lcom/junction/fire/engine/FireEnginePlayer;->StartPlayer()V

    .line 1095
    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    invoke-virtual {v1}, Lcom/junction/fire/engine/FireEnginePlayer;->PausePlayer()V

    goto :goto_0
.end method

.method public InitSensor()V
    .locals 2

    .prologue
    .line 114
    const-string v0, "sensor"

    invoke-virtual {p0, v0}, Lcom/junction/fire/gametemplate/GameTemplate;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    iput-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->sensorMgr:Landroid/hardware/SensorManager;

    .line 115
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->sensorMgr:Landroid/hardware/SensorManager;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    iput-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->sensor:Landroid/hardware/Sensor;

    .line 116
    return-void
.end method

.method public RegisterSensor()V
    .locals 4

    .prologue
    .line 119
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->sensorMgr:Landroid/hardware/SensorManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->sensor:Landroid/hardware/Sensor;

    if-nez v0, :cond_1

    .line 123
    :cond_0
    :goto_0
    return-void

    .line 122
    :cond_1
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->sensorMgr:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->sensorListener:Landroid/hardware/SensorEventListener;

    iget-object v2, p0, Lcom/junction/fire/gametemplate/GameTemplate;->sensor:Landroid/hardware/Sensor;

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    goto :goto_0
.end method

.method RemoveAds()V
    .locals 3

    .prologue
    .line 212
    sget-object v1, Lcom/junction/fire/gametemplate/GameTemplate;->adsView:Landroid/view/View;

    if-eqz v1, :cond_0

    .line 213
    invoke-virtual {p0}, Lcom/junction/fire/gametemplate/GameTemplate;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "window"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    .line 214
    .local v0, "wm":Landroid/view/WindowManager;
    sget-object v1, Lcom/junction/fire/gametemplate/GameTemplate;->adsView:Landroid/view/View;

    invoke-interface {v0, v1}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V

    .line 215
    const/4 v1, 0x0

    sput-object v1, Lcom/junction/fire/gametemplate/GameTemplate;->adsView:Landroid/view/View;

    .line 218
    .end local v0    # "wm":Landroid/view/WindowManager;
    :cond_0
    return-void
.end method

.method public UnregisterSensor()V
    .locals 2

    .prologue
    .line 126
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->sensorMgr:Landroid/hardware/SensorManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->sensor:Landroid/hardware/Sensor;

    if-nez v0, :cond_1

    .line 130
    :cond_0
    :goto_0
    return-void

    .line 129
    :cond_1
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->sensorMgr:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->sensorListener:Landroid/hardware/SensorEventListener;

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    goto :goto_0
.end method

.method public dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 8
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    const/16 v7, 0x63

    const/16 v6, 0x61

    const/16 v5, 0x60

    const/16 v4, 0x10

    const/16 v3, 0x11

    .line 1241
    const/high16 v1, 0x42c80000    # 100.0f

    const/16 v2, 0xb

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result v2

    mul-float/2addr v1, v2

    float-to-int v0, v1

    .line 1242
    .local v0, "v":I
    if-lez v0, :cond_8

    .line 1244
    iget v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    and-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_1

    .line 1247
    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    invoke-virtual {v1, v7, v3}, Lcom/junction/fire/engine/FireEnginePlayer;->PushKeyEvent(II)V

    .line 1248
    :cond_0
    iget v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    and-int/lit8 v1, v1, -0x3

    iput v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    .line 1250
    :cond_1
    iget v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    and-int/lit8 v1, v1, 0x1

    if-nez v1, :cond_3

    .line 1253
    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    invoke-virtual {v1, v6, v4}, Lcom/junction/fire/engine/FireEnginePlayer;->PushKeyEvent(II)V

    .line 1254
    :cond_2
    iget v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    or-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    .line 1288
    :cond_3
    :goto_0
    const/high16 v1, 0x42c80000    # 100.0f

    const/16 v2, 0xe

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getAxisValue(I)F

    move-result v2

    mul-float/2addr v1, v2

    float-to-int v0, v1

    .line 1289
    if-lez v0, :cond_f

    .line 1291
    iget v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    and-int/lit8 v1, v1, 0x8

    if-eqz v1, :cond_5

    .line 1294
    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    const/16 v2, 0x64

    invoke-virtual {v1, v2, v3}, Lcom/junction/fire/engine/FireEnginePlayer;->PushKeyEvent(II)V

    .line 1295
    :cond_4
    iget v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    and-int/lit8 v1, v1, -0x9

    iput v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    .line 1297
    :cond_5
    iget v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    and-int/lit8 v1, v1, 0x4

    if-nez v1, :cond_7

    .line 1300
    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    if-eqz v1, :cond_6

    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    invoke-virtual {v1, v5, v4}, Lcom/junction/fire/engine/FireEnginePlayer;->PushKeyEvent(II)V

    .line 1301
    :cond_6
    iget v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    or-int/lit8 v1, v1, 0x4

    iput v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    .line 1336
    :cond_7
    :goto_1
    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    return v1

    .line 1257
    :cond_8
    if-gez v0, :cond_c

    .line 1259
    iget v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    and-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_a

    .line 1262
    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    if-eqz v1, :cond_9

    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    invoke-virtual {v1, v6, v3}, Lcom/junction/fire/engine/FireEnginePlayer;->PushKeyEvent(II)V

    .line 1263
    :cond_9
    iget v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    and-int/lit8 v1, v1, -0x2

    iput v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    .line 1265
    :cond_a
    iget v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    and-int/lit8 v1, v1, 0x2

    if-nez v1, :cond_3

    .line 1268
    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    if-eqz v1, :cond_b

    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    invoke-virtual {v1, v7, v4}, Lcom/junction/fire/engine/FireEnginePlayer;->PushKeyEvent(II)V

    .line 1269
    :cond_b
    iget v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    or-int/lit8 v1, v1, 0x2

    iput v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    goto :goto_0

    .line 1274
    :cond_c
    iget v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    and-int/lit8 v1, v1, 0x1

    if-eqz v1, :cond_d

    .line 1277
    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    if-eqz v1, :cond_d

    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    invoke-virtual {v1, v6, v3}, Lcom/junction/fire/engine/FireEnginePlayer;->PushKeyEvent(II)V

    .line 1279
    :cond_d
    iget v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    and-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_e

    .line 1282
    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    if-eqz v1, :cond_e

    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    invoke-virtual {v1, v7, v3}, Lcom/junction/fire/engine/FireEnginePlayer;->PushKeyEvent(II)V

    .line 1284
    :cond_e
    iget v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    and-int/lit8 v1, v1, -0x2

    iput v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    .line 1285
    iget v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    and-int/lit8 v1, v1, -0x3

    iput v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    goto/16 :goto_0

    .line 1304
    :cond_f
    if-gez v0, :cond_13

    .line 1306
    iget v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    and-int/lit8 v1, v1, 0x4

    if-eqz v1, :cond_11

    .line 1309
    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    if-eqz v1, :cond_10

    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    invoke-virtual {v1, v5, v3}, Lcom/junction/fire/engine/FireEnginePlayer;->PushKeyEvent(II)V

    .line 1310
    :cond_10
    iget v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    and-int/lit8 v1, v1, -0x5

    iput v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    .line 1313
    :cond_11
    iget v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    and-int/lit8 v1, v1, 0x8

    if-nez v1, :cond_7

    .line 1316
    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    if-eqz v1, :cond_12

    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    const/16 v2, 0x64

    invoke-virtual {v1, v2, v4}, Lcom/junction/fire/engine/FireEnginePlayer;->PushKeyEvent(II)V

    .line 1317
    :cond_12
    iget v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    or-int/lit8 v1, v1, 0x8

    iput v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    goto/16 :goto_1

    .line 1323
    :cond_13
    iget v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    and-int/lit8 v1, v1, 0x4

    if-eqz v1, :cond_14

    .line 1326
    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    if-eqz v1, :cond_14

    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    invoke-virtual {v1, v5, v3}, Lcom/junction/fire/engine/FireEnginePlayer;->PushKeyEvent(II)V

    .line 1328
    :cond_14
    iget v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    and-int/lit8 v1, v1, 0x8

    if-eqz v1, :cond_15

    .line 1331
    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    if-eqz v1, :cond_15

    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    const/16 v2, 0x64

    invoke-virtual {v1, v2, v3}, Lcom/junction/fire/engine/FireEnginePlayer;->PushKeyEvent(II)V

    .line 1333
    :cond_15
    iget v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    and-int/lit8 v1, v1, -0x5

    iput v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    .line 1334
    iget v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    and-int/lit8 v1, v1, -0x9

    iput v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->abxy:I

    goto/16 :goto_1
.end method

.method public onBackPressed()V
    .locals 0

    .prologue
    .line 1395
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 1071
    invoke-super {p0, p1}, Landroid/app/Activity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 1073
    iget v0, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    iget v0, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 1074
    :cond_0
    iget v0, p1, Landroid/content/res/Configuration;->orientation:I

    iget v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mOrientation:I

    if-ne v0, v1, :cond_2

    .line 1075
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mGameLayout:Landroid/widget/FrameLayout;

    invoke-virtual {p0, v0}, Lcom/junction/fire/gametemplate/GameTemplate;->setContentView(Landroid/view/View;)V

    .line 1076
    const-string v0, "onConfigurationChanged"

    const-string v1, "setContentView - mGameLayout"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1083
    :cond_1
    :goto_0
    return-void

    .line 1078
    :cond_2
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mEmptyLayout:Landroid/widget/FrameLayout;

    invoke-virtual {p0, v0}, Lcom/junction/fire/gametemplate/GameTemplate;->setContentView(Landroid/view/View;)V

    .line 1079
    const-string v0, "onConfigurationChanged"

    const-string v1, "setContentView - mEmptyLayout"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private getModifiedRetroArchConfig()Ljava/lang/String;
    .locals 5

    .prologue

    :try_start_0

    invoke-static {p0}, Lcom/junction/fire/gametemplate/GameTemplate;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0

    if-nez v0, :cond_path_ok
    const/4 v0, 0x0
    return-object v0

    :cond_path_ok
    const-string v1, "/RetroArch/retroarch.cfg"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1

    new-instance v2, Ljava/io/File;
    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z
    move-result v3
    if-nez v3, :cond_exists

    const/4 v0, 0x0
    return-object v0

    # File exists, replace externalSdcard on real one
    :cond_exists
    new-instance v3, Ljava/util/Scanner;
    invoke-direct {v3, v2}, Ljava/util/Scanner;-><init>(Ljava/io/File;)V

    const-string v4, "\\A"
    invoke-virtual {v3, v4}, Ljava/util/Scanner;->useDelimiter(Ljava/lang/String;)Ljava/util/Scanner;

    invoke-virtual {v3}, Ljava/util/Scanner;->next()Ljava/lang/String;
    move-result-object v4

    invoke-virtual {v3}, Ljava/util/Scanner;->close()V

    const-string v3, "externalSdCard"

    invoke-virtual {v4, v3, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    move-result-object v0

    return-object v0

    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_all
    :catch_all
    const/4 v0, 0x0
    return-object v0
.end method

.method private getTempConfig()Ljava/lang/String;
    .locals 4

    .prologue

    :try_start_0

    # Check card path
    invoke-static {p0}, Lcom/junction/fire/gametemplate/GameTemplate;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0

    if-nez v0, :cond_path_ok
    const/4 v0, 0x0
    return-object v0

    :cond_path_ok
    const-string v1, "/RetroArch/config.cfg"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1

    # Check config exists
    new-instance v2, Ljava/io/File;
    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->exists()Z
    move-result v3
    if-nez v3, :cond_exists

    const/4 v0, 0x0
    return-object v0

    :cond_exists

    # Read into a string
    new-instance v3, Ljava/util/Scanner;
    invoke-direct {v3, v2}, Ljava/util/Scanner;-><init>(Ljava/io/File;)V

    const-string v4, "\\A"
    invoke-virtual {v3, v4}, Ljava/util/Scanner;->useDelimiter(Ljava/lang/String;)Ljava/util/Scanner;

    invoke-virtual {v3}, Ljava/util/Scanner;->next()Ljava/lang/String;
    move-result-object v4

    invoke-virtual {v3}, Ljava/util/Scanner;->close()V
    return-object v4

    :try_end_0

    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_all

    :catch_all
    const/4 v0, 0x0
    return-object v0
.end method

.method private updateRetroArchConfig()V
    .locals 5

    .prologue
    invoke-direct {p0}, Lcom/junction/fire/gametemplate/GameTemplate;->getModifiedRetroArchConfig()Ljava/lang/String;
    move-result-object v0

    invoke-direct {p0}, Lcom/junction/fire/gametemplate/GameTemplate;->getTempConfig()Ljava/lang/String;
    move-result-object v1

    if-nez v0, :cond_original_not_null

    if-nez v1, :cond_temp_not_null_when_original_null
    return-void

    :cond_temp_not_null_when_original_null
    invoke-static {p0}, Lcom/junction/fire/gametemplate/GameTemplate;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v2

    if-nez v2, :cond_path_ready_delete
    return-void

    :cond_path_ready_delete
    const-string v3, "/RetroArch/config.cfg"
    invoke-virtual {v2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2

    new-instance v3, Ljava/io/File;
    invoke-direct {v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    :try_start_delete
    invoke-virtual {v3}, Ljava/io/File;->delete()Z
    :try_end_delete
    .catch Ljava/lang/Exception; {:try_start_delete .. :try_end_delete} :catch_delete

    :catch_delete
    return-void

    :cond_original_not_null
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v2

    if-eqz v2, :cond_equal
    return-void

    :cond_equal

    invoke-static {p0}, Lcom/junction/fire/gametemplate/GameTemplate;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v2

    if-nez v2, :cond_path_ready_write
    return-void

    :cond_path_ready_write

    const-string v3, "/RetroArch/config.cfg"
    invoke-virtual {v2, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2

    :try_start_write
    new-instance v3, Ljava/io/FileWriter;
    new-instance v4, Ljava/io/File;
    invoke-direct {v4, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-direct {v3, v4}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V
    invoke-virtual {v3, v0}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V
    invoke-virtual {v3}, Ljava/io/FileWriter;->close()V
    :try_end_write
    .catch Ljava/lang/Exception; {:try_start_write .. :try_end_write} :catch_write
    :catch_write

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 24
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 784
    invoke-super/range {p0 .. p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 792
    const/16 v19, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/junction/fire/gametemplate/GameTemplate;->requestWindowFeature(I)Z

    .line 793
    invoke-virtual/range {p0 .. p0}, Lcom/junction/fire/gametemplate/GameTemplate;->getWindow()Landroid/view/Window;

    move-result-object v19

    const/16 v20, 0x400

    const/16 v21, 0x400

    invoke-virtual/range {v19 .. v21}, Landroid/view/Window;->setFlags(II)V

    .line 796
    const/16 v19, 0x3

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/junction/fire/gametemplate/GameTemplate;->setVolumeControlStream(I)V

    .line 799
    invoke-direct/range {p0 .. p0}, Lcom/junction/fire/gametemplate/GameTemplate;->checkPermission()Z

    move-result v19

    if-nez v19, :cond_0

    .line 801
    invoke-direct/range {p0 .. p0}, Lcom/junction/fire/gametemplate/GameTemplate;->requestPermission()V

    .line 808
    :cond_0
    new-instance v19, Ljava/io/File;

    const-string v20, "/data/hdmistate"

    invoke-direct/range {v19 .. v20}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->deleteOnExit()V

    .line 810
    invoke-virtual/range {p0 .. p0}, Lcom/junction/fire/gametemplate/GameTemplate;->getResources()Landroid/content/res/Resources;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v19

    move-object/from16 v0, v19

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    move/from16 v19, v0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput v0, v1, Lcom/junction/fire/gametemplate/GameTemplate;->mOrientation:I

    .line 812
    new-instance v19, Landroid/widget/FrameLayout;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/junction/fire/gametemplate/GameTemplate;->mGameLayout:Landroid/widget/FrameLayout;

    .line 813
    new-instance v19, Landroid/widget/FrameLayout;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/junction/fire/gametemplate/GameTemplate;->mEmptyLayout:Landroid/widget/FrameLayout;

    .line 814
    invoke-static/range {p0 .. p0}, Lcom/junction/fire/gametemplate/GameTemplate;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v19

    sput-object v19, Lcom/junction/fire/gametemplate/GameTemplate;->mTfcardpath:Ljava/lang/String;

    .line 816
    sget-object v19, Lcom/junction/fire/gametemplate/GameTemplate;->mTfcardpath:Ljava/lang/String;

    if-nez v19, :cond_2

    .line 817
    const-string v19, "/sdcard"

    sput-object v19, Lcom/junction/fire/gametemplate/GameTemplate;->mTfcardpath:Ljava/lang/String;

    .line 822
    :cond_1
    :goto_0
    invoke-direct/range {p0 .. p0}, Lcom/junction/fire/gametemplate/GameTemplate;->readmode()Ljava/lang/String;

    move-result-object v15

    .line 823
    .local v15, "mode":Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/junction/fire/gametemplate/GameTemplate;->getIntent()Landroid/content/Intent;

    move-result-object v13

    .line 824
    .local v13, "intent":Landroid/content/Intent;
    invoke-virtual {v13}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v6

    .line 825
    .local v6, "action":Ljava/lang/String;
    const-string v19, "android.intent.action.VIEW"

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_3

    .line 826
    invoke-virtual {v13}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v7

    .line 827
    .local v7, "dat":Ljava/lang/String;
    invoke-static {v7}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v17

    .line 828
    .local v17, "uri":Landroid/net/Uri;
    invoke-virtual/range {v17 .. v17}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/junction/fire/gametemplate/GameTemplate;->mPath:Ljava/lang/String;

    .line 834
    .end local v7    # "dat":Ljava/lang/String;
    .end local v17    # "uri":Landroid/net/Uri;
    :goto_1
    new-instance v19, Ljava/lang/StringBuilder;

    sget-object v20, Lcom/junction/fire/gametemplate/GameTemplate;->mTfcardpath:Ljava/lang/String;

    invoke-static/range {v20 .. v20}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v20, "/data.pud"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/junction/fire/gametemplate/GameTemplate;->mPath:Ljava/lang/String;

    .line 835
    new-instance v19, Ljava/io/File;

    new-instance v20, Ljava/lang/StringBuilder;

    sget-object v21, Lcom/junction/fire/gametemplate/GameTemplate;->mTfcardpath:Ljava/lang/String;

    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v21, "/test"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->exists()Z

    move-result v19

    if-eqz v19, :cond_4

    .line 837
    invoke-direct/range {p0 .. p0}, Lcom/junction/fire/gametemplate/GameTemplate;->startTestmode()V

    .line 838
    invoke-virtual/range {p0 .. p0}, Lcom/junction/fire/gametemplate/GameTemplate;->finish()V

    .line 1039
    :goto_2

    invoke-direct/range {p0 .. p0}, Lcom/junction/fire/gametemplate/GameTemplate;->updateRetroArchConfig()V
    return-void

    .line 819
    .end local v6    # "action":Ljava/lang/String;
    .end local v13    # "intent":Landroid/content/Intent;
    .end local v15    # "mode":Ljava/lang/String;
    :cond_2
    new-instance v19, Ljava/io/File;

    sget-object v20, Lcom/junction/fire/gametemplate/GameTemplate;->mTfcardpath:Ljava/lang/String;

    invoke-direct/range {v19 .. v20}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->getTotalSpace()J

    move-result-wide v20

    const-wide/16 v22, 0x400

    cmp-long v19, v20, v22

    if-gez v19, :cond_1

    .line 820
    const-string v19, "/sdcard"

    sput-object v19, Lcom/junction/fire/gametemplate/GameTemplate;->mTfcardpath:Ljava/lang/String;

    goto :goto_0

    .line 831
    .restart local v6    # "action":Ljava/lang/String;
    .restart local v13    # "intent":Landroid/content/Intent;
    .restart local v15    # "mode":Ljava/lang/String;
    :cond_3
    const-string v19, "/sdcard/loadapp.swf"

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/junction/fire/gametemplate/GameTemplate;->mPath:Ljava/lang/String;

    goto :goto_1

    .line 842
    :cond_4
    invoke-virtual/range {p0 .. p0}, Lcom/junction/fire/gametemplate/GameTemplate;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v19

    invoke-interface/range {v19 .. v19}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v8

    .line 843
    .local v8, "defDisp":Landroid/view/Display;
    new-instance v14, Landroid/util/DisplayMetrics;

    invoke-direct {v14}, Landroid/util/DisplayMetrics;-><init>()V

    .line 844
    .local v14, "metrics":Landroid/util/DisplayMetrics;
    invoke-virtual {v8, v14}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 845
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/junction/fire/gametemplate/GameTemplate;->mGameView:Lcom/junction/fire/gametemplate/GameView;

    move-object/from16 v19, v0

    if-nez v19, :cond_5

    .line 846
    new-instance v19, Lcom/junction/fire/gametemplate/GameView;

    iget v0, v14, Landroid/util/DisplayMetrics;->widthPixels:I

    move/from16 v20, v0

    iget v0, v14, Landroid/util/DisplayMetrics;->heightPixels:I

    move/from16 v21, v0

    sget-object v22, Lcom/junction/fire/gametemplate/GameTemplate;->COLOR_FORMAT:Landroid/graphics/Bitmap$Config;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    move/from16 v2, v20

    move/from16 v3, v21

    move-object/from16 v4, v22

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/junction/fire/gametemplate/GameView;-><init>(Landroid/content/Context;IILandroid/graphics/Bitmap$Config;)V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/junction/fire/gametemplate/GameTemplate;->mGameView:Lcom/junction/fire/gametemplate/GameView;

    .line 847
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/junction/fire/gametemplate/GameTemplate;->mGameLayout:Landroid/widget/FrameLayout;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/junction/fire/gametemplate/GameTemplate;->mGameView:Lcom/junction/fire/gametemplate/GameView;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 859
    :cond_5
    const-string v19, "D300"

    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_a

    .line 862
    const/16 v16, 0x0

    .line 864
    .local v16, "retry":I
    :goto_3
    add-int/lit8 v16, v16, 0x1

    .line 866
    new-instance v19, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/junction/fire/gametemplate/GameTemplate;->mPath:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-direct/range {v19 .. v20}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->exists()Z

    move-result v19

    if-nez v19, :cond_6

    new-instance v19, Ljava/io/File;

    new-instance v20, Ljava/lang/StringBuilder;

    sget-object v21, Lcom/junction/fire/gametemplate/GameTemplate;->mTfcardpath:Ljava/lang/String;

    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v21, "/iroms"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->exists()Z

    move-result v19

    if-nez v19, :cond_6

    .line 870
    const/16 v19, 0x4

    move/from16 v0, v16

    move/from16 v1, v19

    if-le v0, v1, :cond_7

    .line 872
    new-instance v19, Ljava/io/File;

    const-string v20, "/system/sdcard/data.pud"

    invoke-direct/range {v19 .. v20}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->exists()Z

    move-result v19

    if-eqz v19, :cond_7

    .line 873
    const-string v19, "/system/sdcard/data.pud"

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/junction/fire/gametemplate/GameTemplate;->mPath:Ljava/lang/String;

    .line 874
    new-instance v11, Landroid/content/IntentFilter;

    invoke-direct {v11}, Landroid/content/IntentFilter;-><init>()V

    .line 875
    .local v11, "filter":Landroid/content/IntentFilter;
    const-string v19, "android.intent.action.MEDIA_MOUNTED"

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 876
    const-string v19, "android.intent.action.MEDIA_REMOVED"

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 877
    const-string v19, "android.intent.action.MEDIA_UNMOUNTED"

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 878
    const-string v19, "file"

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 879
    new-instance v19, Lcom/junction/fire/gametemplate/GameTemplate$SDCardBroadcastReceiver;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/junction/fire/gametemplate/GameTemplate$SDCardBroadcastReceiver;-><init>(Lcom/junction/fire/gametemplate/GameTemplate;)V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/junction/fire/gametemplate/GameTemplate;->sdreceiver:Lcom/junction/fire/gametemplate/GameTemplate$SDCardBroadcastReceiver;

    .line 880
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/junction/fire/gametemplate/GameTemplate;->sdreceiver:Lcom/junction/fire/gametemplate/GameTemplate$SDCardBroadcastReceiver;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v11}, Lcom/junction/fire/gametemplate/GameTemplate;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 963
    .end local v11    # "filter":Landroid/content/IntentFilter;
    .end local v16    # "retry":I
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/junction/fire/gametemplate/GameTemplate;->mPath:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/junction/fire/gametemplate/GameTemplate;->CreatePlayer(Ljava/lang/String;)V

    .line 964
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Lcom/junction/fire/engine/FireEnginePlayer;->setAllowVolume(Ljava/lang/String;)V

    .line 968
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/junction/fire/gametemplate/GameTemplate;->mGameLayout:Landroid/widget/FrameLayout;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/junction/fire/gametemplate/GameTemplate;->setContentView(Landroid/view/View;)V

    .line 970
    const/high16 v19, 0x7f060000

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-static {v0, v1}, Landroid/media/MediaPlayer;->create(Landroid/content/Context;I)Landroid/media/MediaPlayer;

    move-result-object v19

    sput-object v19, Lcom/junction/fire/gametemplate/GameTemplate;->mediaPlayer:Landroid/media/MediaPlayer;

    .line 971
    sget-object v19, Lcom/junction/fire/gametemplate/GameTemplate;->mediaPlayer:Landroid/media/MediaPlayer;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/junction/fire/gametemplate/GameTemplate;->mClicklisten:Landroid/media/MediaPlayer$OnPreparedListener;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 972
    sget-object v19, Lcom/junction/fire/gametemplate/GameTemplate;->mediaPlayer:Landroid/media/MediaPlayer;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/junction/fire/gametemplate/GameTemplate;->mClickComplet:Landroid/media/MediaPlayer$OnCompletionListener;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 993
    new-instance v12, Ljava/io/File;

    const-string v19, "/sys/devices/platform/mt_usb/musb-hdrc/cmode"

    move-object/from16 v0, v19

    invoke-direct {v12, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 995
    .local v12, "fp":Ljava/io/File;
    :try_start_0
    new-instance v18, Ljava/io/FileWriter;

    move-object/from16 v0, v18

    invoke-direct {v0, v12}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    .line 996
    .local v18, "wr":Ljava/io/FileWriter;
    const-string v19, "0"

    invoke-virtual/range {v18 .. v19}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    .line 997
    invoke-virtual/range {v18 .. v18}, Ljava/io/FileWriter;->flush()V

    .line 999
    const-wide/16 v20, 0x3e8

    invoke-static/range {v20 .. v21}, Ljava/lang/Thread;->sleep(J)V

    .line 1000
    const-string v19, "1"

    invoke-virtual/range {v18 .. v19}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    .line 1001
    invoke-virtual/range {v18 .. v18}, Ljava/io/FileWriter;->flush()V

    .line 1003
    invoke-virtual/range {v18 .. v18}, Ljava/io/FileWriter;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_2

    .line 1004
    .end local v18    # "wr":Ljava/io/FileWriter;
    :catch_0
    move-exception v10

    .line 1006
    .local v10, "e1":Ljava/lang/Exception;
    invoke-virtual {v10}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_2

    .line 886
    .end local v10    # "e1":Ljava/lang/Exception;
    .end local v12    # "fp":Ljava/io/File;
    .restart local v16    # "retry":I
    :cond_7
    const-wide/16 v20, 0x7d0

    :try_start_1
    invoke-static/range {v20 .. v21}, Ljava/lang/Thread;->sleep(J)V

    .line 887
    invoke-static/range {p0 .. p0}, Lcom/junction/fire/gametemplate/GameTemplate;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v19

    sput-object v19, Lcom/junction/fire/gametemplate/GameTemplate;->mTfcardpath:Ljava/lang/String;

    .line 889
    sget-object v19, Lcom/junction/fire/gametemplate/GameTemplate;->mTfcardpath:Ljava/lang/String;

    if-nez v19, :cond_9

    .line 890
    const-string v19, "/sdcard"

    sput-object v19, Lcom/junction/fire/gametemplate/GameTemplate;->mTfcardpath:Ljava/lang/String;

    .line 895
    :cond_8
    :goto_4
    new-instance v19, Ljava/lang/StringBuilder;

    sget-object v20, Lcom/junction/fire/gametemplate/GameTemplate;->mTfcardpath:Ljava/lang/String;

    invoke-static/range {v20 .. v20}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v20, "/data.pud"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/junction/fire/gametemplate/GameTemplate;->mPath:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    goto/16 :goto_3

    .line 897
    :catch_1
    move-exception v9

    .line 899
    .local v9, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v9}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto/16 :goto_3

    .line 892
    .end local v9    # "e":Ljava/lang/InterruptedException;
    :cond_9
    :try_start_2
    new-instance v19, Ljava/io/File;

    sget-object v20, Lcom/junction/fire/gametemplate/GameTemplate;->mTfcardpath:Ljava/lang/String;

    invoke-direct/range {v19 .. v20}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->getTotalSpace()J

    move-result-wide v20

    const-wide/16 v22, 0x400

    cmp-long v19, v20, v22

    if-gez v19, :cond_8

    .line 893
    const-string v19, "/sdcard"

    sput-object v19, Lcom/junction/fire/gametemplate/GameTemplate;->mTfcardpath:Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_4

    .line 919
    .end local v16    # "retry":I
    :cond_a
    new-instance v19, Ljava/io/File;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/junction/fire/gametemplate/GameTemplate;->mPath:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-direct/range {v19 .. v20}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->exists()Z

    move-result v19

    if-nez v19, :cond_6

    new-instance v19, Ljava/io/File;

    new-instance v20, Ljava/lang/StringBuilder;

    sget-object v21, Lcom/junction/fire/gametemplate/GameTemplate;->mTfcardpath:Ljava/lang/String;

    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v21, "/iroms"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->exists()Z

    move-result v19

    if-nez v19, :cond_6

    .line 921
    const v19, 0x7f040001

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/junction/fire/gametemplate/GameTemplate;->setContentView(I)V

    .line 922
    const/high16 v19, 0x7f0c0000

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/junction/fire/gametemplate/GameTemplate;->findViewById(I)Landroid/view/View;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/junction/fire/gametemplate/GameTemplate;->sd_id:Landroid/view/View;

    .line 923
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/junction/fire/gametemplate/GameTemplate;->sd_id:Landroid/view/View;

    move-object/from16 v19, v0

    const/16 v20, 0x4

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->setVisibility(I)V

    .line 924
    new-instance v19, Lcom/junction/fire/gametemplate/GameTemplate$6;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/junction/fire/gametemplate/GameTemplate$6;-><init>(Lcom/junction/fire/gametemplate/GameTemplate;)V

    .line 932
    const/16 v20, 0x0

    const-wide/16 v22, 0x2710

    move-object/from16 v0, v19

    move/from16 v1, v20

    move-wide/from16 v2, v22

    invoke-virtual {v0, v1, v2, v3}, Lcom/junction/fire/gametemplate/GameTemplate$6;->sendEmptyMessageDelayed(IJ)Z

    .line 934
    new-instance v11, Landroid/content/IntentFilter;

    invoke-direct {v11}, Landroid/content/IntentFilter;-><init>()V

    .line 935
    .restart local v11    # "filter":Landroid/content/IntentFilter;
    const-string v19, "android.intent.action.MEDIA_MOUNTED"

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 936
    const-string v19, "android.intent.action.MEDIA_REMOVED"

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 937
    const-string v19, "android.intent.action.MEDIA_UNMOUNTED"

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 938
    const-string v19, "file"

    move-object/from16 v0, v19

    invoke-virtual {v11, v0}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 939
    new-instance v19, Lcom/junction/fire/gametemplate/GameTemplate$SDCardBroadcastReceiver;

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/junction/fire/gametemplate/GameTemplate$SDCardBroadcastReceiver;-><init>(Lcom/junction/fire/gametemplate/GameTemplate;)V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/junction/fire/gametemplate/GameTemplate;->sdreceiver:Lcom/junction/fire/gametemplate/GameTemplate$SDCardBroadcastReceiver;

    .line 940
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/junction/fire/gametemplate/GameTemplate;->sdreceiver:Lcom/junction/fire/gametemplate/GameTemplate$SDCardBroadcastReceiver;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1, v11}, Lcom/junction/fire/gametemplate/GameTemplate;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    goto/16 :goto_2
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 1139
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 1140
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->sdreceiver:Lcom/junction/fire/gametemplate/GameTemplate$SDCardBroadcastReceiver;

    if-eqz v0, :cond_0

    .line 1141
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->sdreceiver:Lcom/junction/fire/gametemplate/GameTemplate$SDCardBroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/junction/fire/gametemplate/GameTemplate;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1142
    :cond_0
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->screenreceiver:Lcom/junction/fire/gametemplate/GameTemplate$ScreenBroadcastReceiver;

    if-eqz v0, :cond_1

    .line 1143
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->screenreceiver:Lcom/junction/fire/gametemplate/GameTemplate$ScreenBroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/junction/fire/gametemplate/GameTemplate;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 1144
    :cond_1
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->update:Lcom/cx/update/UpdateTask;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->update:Lcom/cx/update/UpdateTask;

    invoke-virtual {v0}, Lcom/cx/update/UpdateTask;->stop()V

    .line 1145
    :cond_2
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v0, 0x1

    .line 1194
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v1

    rem-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_1

    .line 1216
    :cond_0
    :goto_0
    return v0

    .line 1196
    :cond_1
    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mUI_Handler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 1198
    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    const/16 v2, 0x10

    invoke-virtual {v1, p1, v2}, Lcom/junction/fire/engine/FireEnginePlayer;->PushKeyEvent(II)V

    .line 1199
    :cond_2
    const/16 v1, 0x6d

    if-ne p1, v1, :cond_6

    .line 1201
    iget v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->keystate:I

    or-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->keystate:I

    .line 1211
    :cond_3
    :goto_1
    iget v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->keystate:I

    const/4 v2, 0x7

    if-ne v1, v2, :cond_4

    .line 1212
    invoke-direct {p0}, Lcom/junction/fire/gametemplate/GameTemplate;->startTestmode()V

    .line 1213
    :cond_4
    const/16 v1, 0x19

    if-eq p1, v1, :cond_5

    const/16 v1, 0x18

    if-ne p1, v1, :cond_0

    .line 1214
    :cond_5
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0

    .line 1203
    :cond_6
    const/16 v1, 0x63

    if-ne p1, v1, :cond_7

    .line 1205
    iget v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->keystate:I

    or-int/lit8 v1, v1, 0x2

    iput v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->keystate:I

    goto :goto_1

    .line 1207
    :cond_7
    const/16 v1, 0x64

    if-ne p1, v1, :cond_3

    .line 1209
    iget v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->keystate:I

    or-int/lit8 v1, v1, 0x4

    iput v1, p0, Lcom/junction/fire/gametemplate/GameTemplate;->keystate:I

    goto :goto_1
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "keyCode"    # I
    .param p2, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 1221
    const/16 v0, 0x6d

    if-ne p1, v0, :cond_3

    .line 1223
    iget v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->keystate:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->keystate:I

    .line 1233
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    const/16 v1, 0x11

    invoke-virtual {v0, p1, v1}, Lcom/junction/fire/engine/FireEnginePlayer;->PushKeyEvent(II)V

    .line 1234
    :cond_1
    const/16 v0, 0x19

    if-eq p1, v0, :cond_2

    const/16 v0, 0x18

    if-ne p1, v0, :cond_5

    .line 1235
    :cond_2
    invoke-super {p0, p1, p2}, Landroid/app/Activity;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result v0

    .line 1236
    :goto_1
    return v0

    .line 1225
    :cond_3
    const/16 v0, 0x63

    if-ne p1, v0, :cond_4

    .line 1227
    iget v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->keystate:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->keystate:I

    goto :goto_0

    .line 1229
    :cond_4
    const/16 v0, 0x64

    if-ne p1, v0, :cond_0

    .line 1231
    iget v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->keystate:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->keystate:I

    goto :goto_0

    .line 1236
    :cond_5
    const/4 v0, 0x1

    goto :goto_1
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 1107
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 1110
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    invoke-virtual {v0}, Lcom/junction/fire/engine/FireEnginePlayer;->PausePlayer()V

    .line 1111
    invoke-virtual {p0}, Lcom/junction/fire/gametemplate/GameTemplate;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1112
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    invoke-virtual {v0}, Lcom/junction/fire/engine/FireEnginePlayer;->DestroyPlayer()V

    .line 1116
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 1120
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 1123
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    invoke-virtual {v0}, Lcom/junction/fire/engine/FireEnginePlayer;->ResumePlayer()V

    .line 1129
    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 0

    .prologue
    .line 1101
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 1103
    return-void
.end method

.method public onStop()V
    .locals 1

    .prologue
    .line 1133
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 1134
    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    invoke-virtual {v0}, Lcom/junction/fire/engine/FireEnginePlayer;->PausePlayer()V

    .line 1135
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6
    .param p1, "event"    # Landroid/view/MotionEvent;

    .prologue
    const/4 v3, 0x1

    .line 1150
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 1151
    .local v0, "action":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    float-to-int v1, v4

    .line 1152
    .local v1, "x":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    float-to-int v2, v4

    .line 1153
    .local v2, "y":I
    iget-object v4, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    if-eqz v4, :cond_2

    .line 1154
    const/4 v4, 0x2

    if-ne v0, v4, :cond_0

    .line 1155
    iget-object v4, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    const/16 v5, 0x22

    invoke-virtual {v4, v1, v2, v5}, Lcom/junction/fire/engine/FireEnginePlayer;->PushMouseEvent(III)V

    .line 1165
    :goto_0
    return v3

    .line 1157
    :cond_0
    if-nez v0, :cond_1

    .line 1158
    iget-object v4, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    const/16 v5, 0x20

    invoke-virtual {v4, v1, v2, v5}, Lcom/junction/fire/engine/FireEnginePlayer;->PushMouseEvent(III)V

    goto :goto_0

    .line 1160
    :cond_1
    if-ne v0, v3, :cond_2

    .line 1161
    iget-object v4, p0, Lcom/junction/fire/gametemplate/GameTemplate;->mPlayer:Lcom/junction/fire/engine/FireEnginePlayer;

    const/16 v5, 0x21

    invoke-virtual {v4, v1, v2, v5}, Lcom/junction/fire/engine/FireEnginePlayer;->PushMouseEvent(III)V

    goto :goto_0

    .line 1165
    :cond_2
    invoke-super {p0, p1}, Landroid/app/Activity;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v3

    goto :goto_0
.end method

.method public onWindowFocusChanged(Z)V
    .locals 0
    .param p1, "hasFocus"    # Z

    .prologue
    .line 1390
    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    .line 1391
    return-void
.end method
