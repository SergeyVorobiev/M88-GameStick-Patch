.class public final Lcom/emu/browser/retroactivity/RetroActivityFuture;
.super Lcom/emu/browser/retroactivity/RetroActivityCamera;
.source "RetroActivityFuture.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/emu/browser/retroactivity/RetroActivityFuture$InputListener;,
        Lcom/emu/browser/retroactivity/RetroActivityFuture$UsbReceiver;
    }
.end annotation


# static fields
.field private static final HANDLER_ARG_FALSE:I = 0x0

.field private static final HANDLER_ARG_TRUE:I = 0x1

.field private static final HANDLER_MESSAGE_DELAY_DEFAULT_MS:I = 0x12c

.field private static final HANDLER_WHAT_TOGGLE_IMMERSIVE:I = 0x1

.field private static final HANDLER_WHAT_TOGGLE_POINTER_CAPTURE:I = 0x2

.field private static final HANDLER_WHAT_TOGGLE_POINTER_ICON:I = 0x4

.field private static final HANDLER_WHAT_TOGGLE_POINTER_NVIDIA:I = 0x3

.field private static final REQUEST_EXTERNAL_STORAGE:I = 0x1


# instance fields
.field inputlisten:Lcom/emu/browser/retroactivity/RetroActivityFuture$InputListener;

.field private mDecorView:Landroid/view/View;

.field private final mHandler:Landroid/os/Handler;

.field manager:Landroid/hardware/input/InputManager;

.field private quitfocus:Z

.field usbReceiver:Lcom/emu/browser/retroactivity/RetroActivityFuture$UsbReceiver;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 59
    invoke-direct {p0}, Lcom/emu/browser/retroactivity/RetroActivityCamera;-><init>()V

    .line 62
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/emu/browser/retroactivity/RetroActivityFuture;->quitfocus:Z

    .line 77
    new-instance v0, Lcom/emu/browser/retroactivity/RetroActivityFuture$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/emu/browser/retroactivity/RetroActivityFuture$1;-><init>(Lcom/emu/browser/retroactivity/RetroActivityFuture;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/emu/browser/retroactivity/RetroActivityFuture;->mHandler:Landroid/os/Handler;

    .line 233
    new-instance v0, Lcom/emu/browser/retroactivity/RetroActivityFuture$UsbReceiver;

    invoke-direct {v0, p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture$UsbReceiver;-><init>(Lcom/emu/browser/retroactivity/RetroActivityFuture;)V

    iput-object v0, p0, Lcom/emu/browser/retroactivity/RetroActivityFuture;->usbReceiver:Lcom/emu/browser/retroactivity/RetroActivityFuture$UsbReceiver;

    .line 59
    return-void
.end method

.method static synthetic access$0(Lcom/emu/browser/retroactivity/RetroActivityFuture;)V
    .locals 0

    .prologue
    .line 236
    invoke-direct {p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->chomd()V

    return-void
.end method

.method private attemptToggleImmersiveMode(Z)V
    .locals 3
    .param p1, "state"    # Z

    .prologue
    .line 543
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x13

    if-lt v1, v2, :cond_0

    .line 545
    if-eqz p1, :cond_1

    .line 546
    :try_start_0
    iget-object v1, p0, Lcom/emu/browser/retroactivity/RetroActivityFuture;->mDecorView:Landroid/view/View;

    const/16 v2, 0xf07

    invoke-virtual {v1, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 563
    :cond_0
    :goto_0
    return-void

    .line 554
    :cond_1
    iget-object v1, p0, Lcom/emu/browser/retroactivity/RetroActivityFuture;->mDecorView:Landroid/view/View;

    const/16 v2, 0x700

    invoke-virtual {v1, v2}, Landroid/view/View;->setSystemUiVisibility(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 558
    :catch_0
    move-exception v0

    .line 559
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "[attemptToggleImmersiveMode] exception thrown:"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private attemptToggleNvidiaCursorVisibility(Z)V
    .locals 9
    .param p1, "state"    # Z

    .prologue
    const/4 v4, 0x1

    const/4 v0, 0x0

    .line 583
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x10

    if-lt v5, v6, :cond_0

    .line 585
    if-eqz p1, :cond_1

    .line 586
    .local v0, "cursorVisibility":Z
    :goto_0
    :try_start_0
    const-class v4, Landroid/hardware/input/InputManager;

    const-string v5, "setCursorVisibility"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Class;

    const/4 v7, 0x0

    sget-object v8, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v8, v6, v7

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 587
    .local v3, "mInputManager_setCursorVisibility":Ljava/lang/reflect/Method;
    const-string v4, "input"

    invoke-virtual {p0, v4}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/hardware/input/InputManager;

    .line 588
    .local v2, "inputManager":Landroid/hardware/input/InputManager;
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v3, v2, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 595
    .end local v0    # "cursorVisibility":Z
    .end local v2    # "inputManager":Landroid/hardware/input/InputManager;
    .end local v3    # "mInputManager_setCursorVisibility":Ljava/lang/reflect/Method;
    :cond_0
    :goto_1
    return-void

    :cond_1
    move v0, v4

    .line 585
    goto :goto_0

    .line 591
    .restart local v0    # "cursorVisibility":Z
    :catch_0
    move-exception v1

    .line 592
    .local v1, "e":Ljava/lang/Exception;
    const-string v4, "[attemptToggleNvidiaCursorVisibility] exception thrown:"

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 589
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v4

    goto :goto_1
.end method

.method private attemptTogglePointerCapture(Z)V
    .locals 3
    .param p1, "state"    # Z

    .prologue
    .line 567
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-lt v1, v2, :cond_0

    .line 569
    if-eqz p1, :cond_1

    .line 570
    :try_start_0
    iget-object v1, p0, Lcom/emu/browser/retroactivity/RetroActivityFuture;->mDecorView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->requestPointerCapture()V

    .line 578
    :cond_0
    :goto_0
    return-void

    .line 572
    :cond_1
    iget-object v1, p0, Lcom/emu/browser/retroactivity/RetroActivityFuture;->mDecorView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->releasePointerCapture()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 574
    :catch_0
    move-exception v0

    .line 575
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "[attemptTogglePointerCapture] exception thrown:"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private attemptTogglePointerIcon(Z)V
    .locals 4
    .param p1, "state"    # Z

    .prologue
    .line 600
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x18

    if-lt v2, v3, :cond_0

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1a

    if-ge v2, v3, :cond_0

    .line 602
    if-eqz p1, :cond_1

    .line 603
    const/4 v2, 0x0

    :try_start_0
    invoke-static {p0, v2}, Landroid/view/PointerIcon;->getSystemIcon(Landroid/content/Context;I)Landroid/view/PointerIcon;

    move-result-object v1

    .line 604
    .local v1, "nullPointerIcon":Landroid/view/PointerIcon;
    iget-object v2, p0, Lcom/emu/browser/retroactivity/RetroActivityFuture;->mDecorView:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setPointerIcon(Landroid/view/PointerIcon;)V

    .line 613
    .end local v1    # "nullPointerIcon":Landroid/view/PointerIcon;
    :cond_0
    :goto_0
    return-void

    .line 607
    :cond_1
    iget-object v2, p0, Lcom/emu/browser/retroactivity/RetroActivityFuture;->mDecorView:Landroid/view/View;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/view/View;->setPointerIcon(Landroid/view/PointerIcon;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 609
    :catch_0
    move-exception v0

    .line 610
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "[attemptTogglePointerIcon] exception thrown:"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private checkPermission()Z
    .locals 1

    .prologue
    .line 222
    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-virtual {p0, v0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->checkSelfPermission(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private checkbufmd5(Ljava/io/File;Ljava/io/File;)Z
    .locals 16
    .param p1, "f1"    # Ljava/io/File;
    .param p2, "f2"    # Ljava/io/File;

    .prologue
    .line 270
    const/4 v10, 0x0

    .line 275
    .local v10, "ret":Z
    const/4 v9, 0x0

    .line 276
    .local v9, "messagedigest":Ljava/security/MessageDigest;
    :try_start_0
    const-string v11, "MD5"

    invoke-static {v11}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v9

    .line 277
    const/16 v11, 0x400

    new-array v2, v11, [B

    .line 278
    .local v2, "a1":[B
    const/16 v11, 0x400

    new-array v4, v11, [B

    .line 279
    .local v4, "a2":[B
    new-instance v8, Ljava/io/FileInputStream;

    move-object/from16 v0, p2

    invoke-direct {v8, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 280
    .local v8, "fb":Ljava/io/FileInputStream;
    new-instance v7, Ljava/io/FileInputStream;

    move-object/from16 v0, p1

    invoke-direct {v7, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 281
    .local v7, "fa":Ljava/io/FileInputStream;
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->length()J

    move-result-wide v12

    const-wide/16 v14, 0x400

    sub-long/2addr v12, v14

    invoke-virtual {v7, v12, v13}, Ljava/io/FileInputStream;->skip(J)J

    .line 282
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->length()J

    move-result-wide v12

    const-wide/16 v14, 0x400

    sub-long/2addr v12, v14

    invoke-virtual {v8, v12, v13}, Ljava/io/FileInputStream;->skip(J)J

    .line 283
    invoke-virtual {v8, v4}, Ljava/io/FileInputStream;->read([B)I

    move-result v5

    .line 284
    .local v5, "a2len":I
    invoke-virtual {v7, v2}, Ljava/io/FileInputStream;->read([B)I

    move-result v3

    .line 285
    .local v3, "a1len":I
    invoke-virtual {v7}, Ljava/io/FileInputStream;->close()V

    .line 286
    invoke-virtual {v8}, Ljava/io/FileInputStream;->close()V

    .line 287
    const/4 v11, 0x0

    invoke-virtual {v9, v2, v11, v3}, Ljava/security/MessageDigest;->update([BII)V

    .line 288
    invoke-virtual {v9}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v2

    .line 289
    const/4 v11, 0x0

    invoke-virtual {v9, v4, v11, v5}, Ljava/security/MessageDigest;->update([BII)V

    .line 290
    invoke-virtual {v9}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v4

    .line 291
    invoke-static {v2, v4}, Ljava/util/Arrays;->equals([B[B)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v10

    .line 297
    .end local v2    # "a1":[B
    .end local v3    # "a1len":I
    .end local v4    # "a2":[B
    .end local v5    # "a2len":I
    .end local v7    # "fa":Ljava/io/FileInputStream;
    .end local v8    # "fb":Ljava/io/FileInputStream;
    :goto_0
    return v10

    .line 292
    :catch_0
    move-exception v6

    .line 294
    .local v6, "e":Ljava/lang/Exception;
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private chomd()V
    .locals 5

    .prologue
    .line 240
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v3

    const-string v4, "su"

    invoke-virtual {v3, v4}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v2

    .line 241
    .local v2, "p":Ljava/lang/Process;
    new-instance v1, Ljava/io/DataOutputStream;

    invoke-virtual {v2}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 242
    .local v1, "os":Ljava/io/DataOutputStream;
    const-string v3, "chmod 777 /dev/input/*\n"

    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 243
    const-string v3, "exit\n"

    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 244
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->flush()V

    .line 245
    invoke-virtual {v2}, Ljava/lang/Process;->waitFor()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 251
    .end local v1    # "os":Ljava/io/DataOutputStream;
    .end local v2    # "p":Ljava/lang/Process;
    :goto_0
    return-void

    .line 246
    :catch_0
    move-exception v0

    .line 248
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private copyres(Ljava/lang/String;)V
    .locals 20
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 174
    new-instance v7, Ljava/io/File;

    move-object/from16 v0, p1

    invoke-direct {v7, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 175
    .local v7, "fl":Ljava/io/File;
    invoke-virtual {v7}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v8

    .line 176
    .local v8, "fs":[Ljava/io/File;
    new-instance v14, Ljava/io/File;

    const-string v15, "/sdcard/.res"

    invoke-direct {v14, v15}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v14}, Ljava/io/File;->mkdir()Z

    .line 178
    if-nez v8, :cond_0

    .line 214
    :goto_0
    return-void

    .line 181
    :cond_0
    array-length v15, v8

    const/4 v14, 0x0

    :goto_1
    if-lt v14, v15, :cond_1

    .line 213
    invoke-direct/range {p0 .. p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->syncfile()V

    goto :goto_0

    .line 181
    :cond_1
    aget-object v2, v8, v14

    .line 183
    .local v2, "T":Ljava/io/File;
    new-instance v13, Ljava/io/File;

    new-instance v16, Ljava/lang/StringBuilder;

    const-string v17, "/sdcard/.res/"

    invoke-direct/range {v16 .. v17}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v13, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 185
    .local v13, "sdf":Ljava/io/File;
    invoke-virtual {v13}, Ljava/io/File;->exists()Z

    move-result v16

    if-eqz v16, :cond_2

    invoke-virtual {v13}, Ljava/io/File;->length()J

    move-result-wide v16

    const-wide/16 v18, 0x1

    cmp-long v16, v16, v18

    if-gez v16, :cond_3

    .line 187
    :cond_2
    const/4 v9, 0x0

    .line 188
    .local v9, "input":Ljava/io/InputStream;
    const/4 v11, 0x0

    .line 190
    .local v11, "output":Ljava/io/OutputStream;
    :try_start_0
    new-instance v10, Ljava/io/FileInputStream;

    invoke-direct {v10, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 191
    .end local v9    # "input":Ljava/io/InputStream;
    .local v10, "input":Ljava/io/InputStream;
    :try_start_1
    new-instance v12, Ljava/io/FileOutputStream;

    invoke-direct {v12, v13}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_5
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 192
    .end local v11    # "output":Ljava/io/OutputStream;
    .local v12, "output":Ljava/io/OutputStream;
    const/16 v16, 0x2000

    :try_start_2
    move/from16 v0, v16

    new-array v3, v0, [B

    .line 194
    .local v3, "buf":[B
    :goto_2
    invoke-virtual {v10, v3}, Ljava/io/InputStream;->read([B)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    move-result v4

    .local v4, "bytesRead":I
    if-gtz v4, :cond_4

    .line 202
    :try_start_3
    invoke-virtual {v10}, Ljava/io/InputStream;->close()V

    .line 203
    invoke-virtual {v12}, Ljava/io/OutputStream;->flush()V

    .line 204
    invoke-virtual {v12}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 181
    .end local v3    # "buf":[B
    .end local v4    # "bytesRead":I
    .end local v10    # "input":Ljava/io/InputStream;
    .end local v12    # "output":Ljava/io/OutputStream;
    :cond_3
    :goto_3
    add-int/lit8 v14, v14, 0x1

    goto :goto_1

    .line 195
    .restart local v3    # "buf":[B
    .restart local v4    # "bytesRead":I
    .restart local v10    # "input":Ljava/io/InputStream;
    .restart local v12    # "output":Ljava/io/OutputStream;
    :cond_4
    const/16 v16, 0x0

    :try_start_4
    move/from16 v0, v16

    invoke-virtual {v12, v3, v0, v4}, Ljava/io/OutputStream;->write([BII)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_2

    .line 197
    .end local v3    # "buf":[B
    .end local v4    # "bytesRead":I
    :catch_0
    move-exception v6

    move-object v11, v12

    .end local v12    # "output":Ljava/io/OutputStream;
    .restart local v11    # "output":Ljava/io/OutputStream;
    move-object v9, v10

    .line 199
    .end local v10    # "input":Ljava/io/InputStream;
    .local v6, "ex":Ljava/lang/Exception;
    .restart local v9    # "input":Ljava/io/InputStream;
    :goto_4
    :try_start_5
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 202
    :try_start_6
    invoke-virtual {v9}, Ljava/io/InputStream;->close()V

    .line 203
    invoke-virtual {v11}, Ljava/io/OutputStream;->flush()V

    .line 204
    invoke-virtual {v11}, Ljava/io/OutputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_3

    .line 205
    :catch_1
    move-exception v5

    .line 207
    .local v5, "e":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3

    .line 200
    .end local v5    # "e":Ljava/lang/Exception;
    .end local v6    # "ex":Ljava/lang/Exception;
    :catchall_0
    move-exception v14

    .line 202
    :goto_5
    :try_start_7
    invoke-virtual {v9}, Ljava/io/InputStream;->close()V

    .line 203
    invoke-virtual {v11}, Ljava/io/OutputStream;->flush()V

    .line 204
    invoke-virtual {v11}, Ljava/io/OutputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2

    .line 210
    :goto_6
    throw v14

    .line 205
    :catch_2
    move-exception v5

    .line 207
    .restart local v5    # "e":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_6

    .line 205
    .end local v5    # "e":Ljava/lang/Exception;
    .end local v9    # "input":Ljava/io/InputStream;
    .end local v11    # "output":Ljava/io/OutputStream;
    .restart local v3    # "buf":[B
    .restart local v4    # "bytesRead":I
    .restart local v10    # "input":Ljava/io/InputStream;
    .restart local v12    # "output":Ljava/io/OutputStream;
    :catch_3
    move-exception v5

    .line 207
    .restart local v5    # "e":Ljava/lang/Exception;
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3

    .line 200
    .end local v3    # "buf":[B
    .end local v4    # "bytesRead":I
    .end local v5    # "e":Ljava/lang/Exception;
    .end local v12    # "output":Ljava/io/OutputStream;
    .restart local v11    # "output":Ljava/io/OutputStream;
    :catchall_1
    move-exception v14

    move-object v9, v10

    .end local v10    # "input":Ljava/io/InputStream;
    .restart local v9    # "input":Ljava/io/InputStream;
    goto :goto_5

    .end local v9    # "input":Ljava/io/InputStream;
    .end local v11    # "output":Ljava/io/OutputStream;
    .restart local v10    # "input":Ljava/io/InputStream;
    .restart local v12    # "output":Ljava/io/OutputStream;
    :catchall_2
    move-exception v14

    move-object v11, v12

    .end local v12    # "output":Ljava/io/OutputStream;
    .restart local v11    # "output":Ljava/io/OutputStream;
    move-object v9, v10

    .end local v10    # "input":Ljava/io/InputStream;
    .restart local v9    # "input":Ljava/io/InputStream;
    goto :goto_5

    .line 197
    :catch_4
    move-exception v6

    goto :goto_4

    .end local v9    # "input":Ljava/io/InputStream;
    .restart local v10    # "input":Ljava/io/InputStream;
    :catch_5
    move-exception v6

    move-object v9, v10

    .end local v10    # "input":Ljava/io/InputStream;
    .restart local v9    # "input":Ljava/io/InputStream;
    goto :goto_4
.end method

.method public static getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    .locals 14
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v10, 0x0

    .line 94
    const-string v11, "storage"

    invoke-virtual {p0, v11}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/os/storage/StorageManager;

    .line 96
    .local v7, "storageManager":Landroid/os/storage/StorageManager;
    :try_start_0
    sget v11, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v12, 0x18

    if-lt v11, v12, :cond_2

    .line 97
    invoke-virtual {v7}, Landroid/os/storage/StorageManager;->getStorageVolumes()Ljava/util/List;

    move-result-object v4

    .line 98
    .local v4, "list":Ljava/util/List;, "Ljava/util/List<Landroid/os/storage/StorageVolume;>;"
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-nez v11, :cond_1

    .line 127
    .end local v4    # "list":Ljava/util/List;, "Ljava/util/List<Landroid/os/storage/StorageVolume;>;"
    :goto_0
    const/4 v10, 0x0

    :goto_1
    return-object v10

    .line 98
    .restart local v4    # "list":Ljava/util/List;, "Ljava/util/List<Landroid/os/storage/StorageVolume;>;"
    :cond_1
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/os/storage/StorageVolume;

    .line 99
    .local v8, "volume":Landroid/os/storage/StorageVolume;
    invoke-virtual {v8}, Landroid/os/storage/StorageVolume;->isRemovable()Z

    move-result v11

    if-eqz v11, :cond_0

    .line 102
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    const-string v11, "getPath"

    const/4 v12, 0x0

    new-array v12, v12, [Ljava/lang/Class;

    invoke-virtual {v10, v11, v12}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 103
    .local v5, "method":Ljava/lang/reflect/Method;
    const/4 v10, 0x0

    new-array v10, v10, [Ljava/lang/Object;

    invoke-virtual {v5, v8, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    goto :goto_1

    .line 109
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

    .line 110
    .local v2, "getVolumePathsMethod":Ljava/lang/reflect/Method;
    const/4 v11, 0x1

    invoke-virtual {v2, v11}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 111
    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Object;

    invoke-virtual {v2, v7, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 113
    .local v3, "invokes":Ljava/lang/Object;
    move-object v0, v3

    check-cast v0, [Ljava/lang/String;

    move-object v9, v0

    .line 115
    .local v9, "volumePaths":[Ljava/lang/String;
    array-length v11, v9

    :goto_2
    if-lt v10, v11, :cond_3

    .line 122
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v10

    invoke-virtual {v10}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v10

    goto :goto_1

    .line 115
    :cond_3
    aget-object v6, v9, v10

    .line 117
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

    .line 115
    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    :cond_4
    move-object v10, v6

    .line 120
    goto :goto_1

    .line 124
    .end local v2    # "getVolumePathsMethod":Ljava/lang/reflect/Method;
    .end local v3    # "invokes":Ljava/lang/Object;
    .end local v6    # "path":Ljava/lang/String;
    .end local v9    # "volumePaths":[Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 125
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private mHandlerSendUiMessage(IZ)V
    .locals 6
    .param p1, "what"    # I
    .param p2, "state"    # Z

    .prologue
    .line 528
    if-eqz p2, :cond_0

    const/4 v0, 0x1

    .line 529
    .local v0, "arg1":I
    :goto_0
    const/4 v1, -0x1

    .line 531
    .local v1, "arg2":I
    iget-object v3, p0, Lcom/emu/browser/retroactivity/RetroActivityFuture;->mHandler:Landroid/os/Handler;

    invoke-virtual {v3, p1, v0, v1}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v2

    .line 532
    .local v2, "message":Landroid/os/Message;
    iget-object v3, p0, Lcom/emu/browser/retroactivity/RetroActivityFuture;->mHandler:Landroid/os/Handler;

    const-wide/16 v4, 0x12c

    invoke-virtual {v3, v2, v4, v5}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 533
    return-void

    .line 528
    .end local v0    # "arg1":I
    .end local v1    # "arg2":I
    .end local v2    # "message":Landroid/os/Message;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private readmode()Ljava/lang/String;
    .locals 7

    .prologue
    .line 315
    const-string v4, ""

    .line 316
    .local v4, "ret":Ljava/lang/String;
    const/4 v2, 0x0

    .line 319
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

    .line 320
    .end local v2    # "input":Ljava/io/BufferedReader;
    .local v3, "input":Ljava/io/BufferedReader;
    :try_start_1
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result-object v4

    .line 327
    :try_start_2
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3

    move-object v2, v3

    .line 334
    .end local v3    # "input":Ljava/io/BufferedReader;
    .restart local v2    # "input":Ljava/io/BufferedReader;
    :goto_0
    return-object v4

    .line 323
    :catch_0
    move-exception v1

    .line 324
    .local v1, "ex":Ljava/lang/Exception;
    :goto_1
    :try_start_3
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 327
    :try_start_4
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_0

    .line 328
    :catch_1
    move-exception v0

    .line 330
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 325
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "ex":Ljava/lang/Exception;
    :catchall_0
    move-exception v5

    .line 327
    :goto_2
    :try_start_5
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .line 333
    :goto_3
    throw v5

    .line 328
    :catch_2
    move-exception v0

    .line 330
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3

    .line 328
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "input":Ljava/io/BufferedReader;
    .restart local v3    # "input":Ljava/io/BufferedReader;
    :catch_3
    move-exception v0

    .line 330
    .restart local v0    # "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    move-object v2, v3

    .end local v3    # "input":Ljava/io/BufferedReader;
    .restart local v2    # "input":Ljava/io/BufferedReader;
    goto :goto_0

    .line 325
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "input":Ljava/io/BufferedReader;
    .restart local v3    # "input":Ljava/io/BufferedReader;
    :catchall_1
    move-exception v5

    move-object v2, v3

    .end local v3    # "input":Ljava/io/BufferedReader;
    .restart local v2    # "input":Ljava/io/BufferedReader;
    goto :goto_2

    .line 323
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
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 229
    new-array v0, v3, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "android.permission.WRITE_EXTERNAL_STORAGE"

    aput-object v2, v0, v1

    invoke-virtual {p0, v0, v3}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->requestPermissions([Ljava/lang/String;I)V

    .line 232
    return-void
.end method

.method private syncfile()V
    .locals 5

    .prologue
    .line 256
    :try_start_0
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v3

    const-string v4, "su"

    invoke-virtual {v3, v4}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v2

    .line 257
    .local v2, "p":Ljava/lang/Process;
    new-instance v1, Ljava/io/DataOutputStream;

    invoke-virtual {v2}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 258
    .local v1, "os":Ljava/io/DataOutputStream;
    const-string v3, "sync\n"

    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 259
    const-string v3, "exit\n"

    invoke-virtual {v1, v3}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 260
    invoke-virtual {v1}, Ljava/io/DataOutputStream;->flush()V

    .line 261
    invoke-virtual {v2}, Ljava/lang/Process;->waitFor()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 267
    .end local v1    # "os":Ljava/io/DataOutputStream;
    .end local v2    # "p":Ljava/lang/Process;
    :goto_0
    return-void

    .line 262
    :catch_0
    move-exception v0

    .line 264
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method


# virtual methods
.method public inputGrabMouse(Z)V
    .locals 1
    .param p1, "state"    # Z

    .prologue
    .line 536
    const/4 v0, 0x2

    invoke-direct {p0, v0, p1}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->mHandlerSendUiMessage(IZ)V

    .line 537
    const/4 v0, 0x3

    invoke-direct {p0, v0, p1}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->mHandlerSendUiMessage(IZ)V

    .line 538
    const/4 v0, 0x4

    invoke-direct {p0, v0, p1}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->mHandlerSendUiMessage(IZ)V

    .line 539
    return-void
.end method

.method private launchExternalRetroArch()V
    .locals 4

    .prologue

    :try_start
    invoke-virtual {p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->getIntent()Landroid/content/Intent;
    move-result-object v0

    new-instance v1, Landroid/content/Intent;
    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const-string v2, "com.retroarch.ra32"
    const-string v3, "com.retroarch.browser.retroactivity.RetroActivityFuture"

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-direct {p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->setAbsoluteLibretroPath()V

    invoke-virtual {v1, v0}, Landroid/content/Intent;->putExtras(Landroid/content/Intent;)Landroid/content/Intent;

    const/high16 v2, 0x10000000
    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, v1}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->startActivity(Landroid/content/Intent;)V
    return-void
    :try_end
    .catch Ljava/lang/Throwable; {:try_start .. :try_end} :catch_all

    :catch_all
    #move-exception v0
    #invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
    #move-result-object v0
    #invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;
    #move-result-object v0
    #invoke-direct {p0, v0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->logQuick(Ljava/lang/String;)V
    return-void
.end method

.method private remapCore(Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .prologue

    invoke-static {p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0
    const-string v1, "/RetroArch/coremap.cfg"
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0 # Path

    new-instance v1, Ljava/io/File;
    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z
    move-result v1

    if-nez v1, :cond_exists

    return-object p1

    :cond_exists
    :try_start
    new-instance v1, Ljava/io/BufferedReader;
    new-instance v2, Ljava/io/FileReader;
    invoke-direct {v2, v0}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V
    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    :loop_read_line
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    move-result-object v2

    if-eqz v2, :cond_no_match

    const-string v3, "->"
    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    move-result v3

    if-eqz v3, :loop_read_line

    const-string v3, "->"
    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;
    move-result-object v3

    array-length v4, v3

    const/4 v5, 0x2
    if-ne v4, v5, :loop_read_line

    const/4 v4, 0x0
    aget-object v4, v3, v4
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    move-result v4

    if-eqz v4, :loop_read_line

    const/4 v4, 0x1
    aget-object v4, v3, v4
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;
    move-result-object v4

    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    return-object v4

    :cond_no_match
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    return-object p1
    :try_end
    .catch Ljava/lang/Throwable; {:try_start .. :try_end} :catch_all

    :catch_all
    return-object p1
.end method

.method private overrideConfigFromExternalIfExists()Z
    .locals 3

    .prologue

    invoke-static {p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0
    const-string v1, "/RetroArch/config.cfg"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0   # full path to config

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :exists
    const/4 v0, 0x0
    return v0

    :exists
    invoke-virtual {p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v2, "CONFIGFILE"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/4 v0, 0x1
    return v0
.end method

.method private logQuick(Ljava/lang/String;)V
    .locals 4

    .prologue

    invoke-static {p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0
    const-string v1, "/RetroArch/logs"
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0 # sdcard/RetroArch/logs

    const-string v1, "/debug"
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2 # sdcard/RetroArch/logs/debug

    new-instance v1, Ljava/io/File;
    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :exists
    return-void
    :exists
    const-string v1, "[/\\:*?\"<>| ]"
    const-string v2, "_"
    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    const-string v0, "/L_"
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    #const/16 v3, 0xfa   # 250 в hex
    #invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->setLength(I)V
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0

    new-instance v1, Ljava/io/File;
    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z

    return-void
.end method

.method private setAbsoluteLibretroPath()V
    .locals 6

    .prologue

    invoke-virtual {p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->getIntent()Landroid/content/Intent;
    move-result-object v0 # intent

    const-string v1, "LIBRETRO"
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2 # core name

    #------------------------LOG BLOCK--------------------------#
    const-string v3, "ROM"
    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3 # rom name

    const-string v4, "_"
    invoke-virtual {v3, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3
    invoke-virtual {v3, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3 # romName_coreName
    invoke-direct {p0, v3}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->logQuick(Ljava/lang/String;)V
    #------------------------------------------------------------#

    invoke-direct {p0, v2}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->remapCore(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2 # updated core name

    const-string v3, "/data/user/0/com.retroarch.ra32/cores/"
    invoke-virtual {v3, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3   # full path to retroarch core

    invoke-static {p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v4 # sd_card

    const-string v5, "/RetroArch/cores/"
    invoke-virtual {v4, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4   # external_sd/RetroArch/cores/
    invoke-virtual {v4, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2 # external_sd/RetroArch/cores/core_name

    const-string v4, "LIBRETRO_SD"
    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    invoke-virtual {v0, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue

    invoke-direct {p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->overrideConfigFromExternalIfExists()Z
    move-result v0

    if-eqz v0, :cond_default
    invoke-direct {p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->launchExternalRetroArch()V
    invoke-virtual {p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->finish()V
    return-void

    :cond_default
    const-wide/16 v8, 0x400

    .line 339
    invoke-super {p0, p1}, Lcom/emu/browser/retroactivity/RetroActivityCamera;->onCreate(Landroid/os/Bundle;)V

    .line 341
    invoke-virtual {p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->getWindow()Landroid/view/Window;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v5

    iput-object v5, p0, Lcom/emu/browser/retroactivity/RetroActivityFuture;->mDecorView:Landroid/view/View;

    .line 342
    invoke-virtual {p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string v6, "LIBRETRO"

    invoke-virtual {v5, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 348
    .local v0, "core":Ljava/lang/String;
    invoke-direct {p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->chomd()V

    .line 350
    const-string v5, "RetroActivityFuture"

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "== ====onCreate===== "

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 362
    const-string v5, "input"

    invoke-virtual {p0, v5}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/hardware/input/InputManager;

    iput-object v5, p0, Lcom/emu/browser/retroactivity/RetroActivityFuture;->manager:Landroid/hardware/input/InputManager;

    .line 363
    new-instance v5, Lcom/emu/browser/retroactivity/RetroActivityFuture$InputListener;

    invoke-direct {v5, p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture$InputListener;-><init>(Lcom/emu/browser/retroactivity/RetroActivityFuture;)V

    iput-object v5, p0, Lcom/emu/browser/retroactivity/RetroActivityFuture;->inputlisten:Lcom/emu/browser/retroactivity/RetroActivityFuture$InputListener;

    .line 364
    iget-object v5, p0, Lcom/emu/browser/retroactivity/RetroActivityFuture;->manager:Landroid/hardware/input/InputManager;

    iget-object v6, p0, Lcom/emu/browser/retroactivity/RetroActivityFuture;->inputlisten:Lcom/emu/browser/retroactivity/RetroActivityFuture$InputListener;

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/hardware/input/InputManager;->registerInputDeviceListener(Landroid/hardware/input/InputManager$InputDeviceListener;Landroid/os/Handler;)V

    .line 365
    new-instance v3, Landroid/content/IntentFilter;

    invoke-direct {v3}, Landroid/content/IntentFilter;-><init>()V

    .line 366
    .local v3, "filter":Landroid/content/IntentFilter;
    const-string v5, "android.hardware.usb.action.USB_DEVICE_ATTACHED"

    invoke-virtual {v3, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 367
    const-string v5, "android.hardware.usb.action.USB_DEVICE_DETACHED"

    invoke-virtual {v3, v5}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 368
    iget-object v5, p0, Lcom/emu/browser/retroactivity/RetroActivityFuture;->usbReceiver:Lcom/emu/browser/retroactivity/RetroActivityFuture$UsbReceiver;

    invoke-virtual {p0, v5, v3}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 370
    invoke-virtual {p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string v6, "QUITFOCUS"

    invoke-virtual {v5, v6}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v5

    iput-boolean v5, p0, Lcom/emu/browser/retroactivity/RetroActivityFuture;->quitfocus:Z

    .line 372
    new-instance v5, Ljava/io/File;

    const-string v6, "/data/user/0/com.emu/cores/"

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->mkdirs()Z

    .line 373
    invoke-static {p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 375
    .local v1, "coredir":Ljava/lang/String;
    new-instance v2, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "/data/user/0/com.emu/cores/"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 377
    .local v2, "f":Ljava/io/File;
    if-eqz v1, :cond_3

    .line 379
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->getTotalSpace()J

    move-result-wide v6

    cmp-long v5, v6, v8

    if-gez v5, :cond_0

    .line 381
    new-instance v5, Ljava/io/File;

    const-string v6, "/mnt/usb_storage"

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->getTotalSpace()J

    move-result-wide v6

    cmp-long v5, v6, v8

    if-lez v5, :cond_1

    .line 383
    const-string v1, "/mnt/usb_storage"

    .line 389
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->readmode()Ljava/lang/String;

    move-result-object v4

    .line 391
    .local v4, "mode":Ljava/lang/String;
    new-instance v5, Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "/configs_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 392
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "/configs_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/.res"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->copyres(Ljava/lang/String;)V

    .line 450
    .end local v4    # "mode":Ljava/lang/String;
    :goto_1
    return-void

    .line 387
    :cond_1
    const-string v1, "/sdcard"

    goto :goto_0

    .line 394
    .restart local v4    # "mode":Ljava/lang/String;
    :cond_2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "/configs/.res"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->copyres(Ljava/lang/String;)V

    goto :goto_1

    .line 398
    .end local v4    # "mode":Ljava/lang/String;
    :cond_3
    const-string v1, "/sdcard"

    .line 399
    const-string v5, "/system/sdcard/configs/.res"

    invoke-direct {p0, v5}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->copyres(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 496
    const-string v0, "RetroActivityFuture"

    const-string v1, "======onDestroy====="

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 498
    iget-object v0, p0, Lcom/emu/browser/retroactivity/RetroActivityFuture;->usbReceiver:Lcom/emu/browser/retroactivity/RetroActivityFuture$UsbReceiver;

    invoke-virtual {p0, v0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 499
    iget-object v0, p0, Lcom/emu/browser/retroactivity/RetroActivityFuture;->manager:Landroid/hardware/input/InputManager;

    iget-object v1, p0, Lcom/emu/browser/retroactivity/RetroActivityFuture;->inputlisten:Lcom/emu/browser/retroactivity/RetroActivityFuture$InputListener;

    invoke-virtual {v0, v1}, Landroid/hardware/input/InputManager;->unregisterInputDeviceListener(Landroid/hardware/input/InputManager$InputDeviceListener;)V

    .line 500
    invoke-super {p0}, Lcom/emu/browser/retroactivity/RetroActivityCamera;->onDestroy()V

    .line 501
    return-void
.end method

.method public onResume()V
    .locals 6

    .prologue
    .line 454
    invoke-super {p0}, Lcom/emu/browser/retroactivity/RetroActivityCamera;->onResume()V

    .line 456
    iget-boolean v4, p0, Lcom/emu/browser/retroactivity/RetroActivityFuture;->sustainedPerformanceMode:Z

    invoke-virtual {p0, v4}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->setSustainedPerformanceMode(Z)V

    .line 459
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x15

    if-lt v4, v5, :cond_0

    .line 460
    invoke-virtual {p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string v5, "REFRESH"

    invoke-virtual {v4, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 463
    .local v3, "refresh":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 464
    invoke-virtual {p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v2

    .line 465
    .local v2, "params":Landroid/view/WindowManager$LayoutParams;
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    int-to-float v4, v4

    iput v4, v2, Landroid/view/WindowManager$LayoutParams;->preferredRefreshRate:F

    .line 466
    invoke-virtual {p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 471
    .end local v2    # "params":Landroid/view/WindowManager$LayoutParams;
    .end local v3    # "refresh":Ljava/lang/String;
    :cond_0
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1c

    if-lt v4, v5, :cond_1

    .line 472
    new-instance v0, Lcom/retroarch/browser/preferences/util/ConfigFile;

    invoke-static {p0}, Lcom/retroarch/browser/preferences/util/UserPreferences;->getDefaultConfigPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Lcom/retroarch/browser/preferences/util/ConfigFile;-><init>(Ljava/lang/String;)V

    .line 474
    .local v0, "configFile":Lcom/retroarch/browser/preferences/util/ConfigFile;
    :try_start_0
    const-string v4, "video_notch_write_over_enable"

    invoke-virtual {v0, v4}, Lcom/retroarch/browser/preferences/util/ConfigFile;->getBoolean(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 475
    invoke-virtual {p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v4

    const/4 v5, 0x1

    iput v5, v4, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 481
    .end local v0    # "configFile":Lcom/retroarch/browser/preferences/util/ConfigFile;
    :cond_1
    :goto_0
    return-void

    .line 477
    .restart local v0    # "configFile":Lcom/retroarch/browser/preferences/util/ConfigFile;
    :catch_0
    move-exception v1

    .line 478
    .local v1, "e":Ljava/lang/Exception;
    const-string v4, "Key doesn\'t exist yet."

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method protected onStart()V
    .locals 2

    .prologue
    .line 523
    const-string v0, "RetroActivityFuture"

    const-string v1, "== onStart= "

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 524
    invoke-super {p0}, Lcom/emu/browser/retroactivity/RetroActivityCamera;->onStart()V

    .line 525
    return-void
.end method

.method public onStop()V
    .locals 2

    .prologue
    .line 485
    invoke-super {p0}, Lcom/emu/browser/retroactivity/RetroActivityCamera;->onStop()V

    .line 486
    const-string v0, "RetroActivityFuture"

    const-string v1, "======onstop====="

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 491
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    .line 492
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 4
    .param p1, "hasFocus"    # Z

    .prologue
    .line 505
    invoke-super {p0, p1}, Lcom/emu/browser/retroactivity/RetroActivityCamera;->onWindowFocusChanged(Z)V

    .line 507
    const/4 v2, 0x1

    invoke-direct {p0, v2, p1}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->mHandlerSendUiMessage(IZ)V

    .line 510
    :try_start_0
    new-instance v0, Lcom/retroarch/browser/preferences/util/ConfigFile;

    invoke-static {p0}, Lcom/retroarch/browser/preferences/util/UserPreferences;->getDefaultConfigPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/retroarch/browser/preferences/util/ConfigFile;-><init>(Ljava/lang/String;)V

    .line 511
    .local v0, "configFile":Lcom/retroarch/browser/preferences/util/ConfigFile;
    const-string v2, "input_auto_mouse_grab"

    invoke-virtual {v0, v2}, Lcom/retroarch/browser/preferences/util/ConfigFile;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 512
    invoke-virtual {p0, p1}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->inputGrabMouse(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 518
    .end local v0    # "configFile":Lcom/retroarch/browser/preferences/util/ConfigFile;
    :cond_0
    :goto_0
    const-string v2, "RetroActivityFuture"

    const-string v3, "== onWindowFocusChanged= "

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 519
    return-void

    .line 514
    :catch_0
    move-exception v1

    .line 515
    .local v1, "e":Ljava/lang/Exception;
    const-string v2, "[onWindowFocusChanged] exception thrown:"

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method showLoading()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 302
    const-string v3, ""

    const v4, 0xea60

    invoke-static {p0, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    .line 303
    .local v2, "toast":Landroid/widget/Toast;
    const/16 v3, 0x11

    invoke-virtual {v2, v3, v5, v5}, Landroid/widget/Toast;->setGravity(III)V

    .line 304
    invoke-virtual {p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    .line 305
    .local v0, "inflater":Landroid/view/LayoutInflater;
    sget v3, Lcom/emu/R$layout;->loading_view:I

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 308
    .local v1, "layout":Landroid/view/View;
    invoke-virtual {v2, v1}, Landroid/widget/Toast;->setView(Landroid/view/View;)V

    .line 309
    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 311
    return-void
.end method
