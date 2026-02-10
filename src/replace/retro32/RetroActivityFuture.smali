.class public final Lcom/retroarch/browser/retroactivity/RetroActivityFuture;
.super Lcom/retroarch/browser/retroactivity/RetroActivityCamera;
.source "RetroActivityFuture.java"


# static fields
.field private static final HANDLER_ARG_FALSE:I = 0x0

.field private static final HANDLER_ARG_TRUE:I = 0x1

.field private static final HANDLER_MESSAGE_DELAY_DEFAULT_MS:I = 0x12c

.field private static final HANDLER_WHAT_TOGGLE_IMMERSIVE:I = 0x1

.field private static final HANDLER_WHAT_TOGGLE_POINTER_CAPTURE:I = 0x2

.field private static final HANDLER_WHAT_TOGGLE_POINTER_ICON:I = 0x4

.field private static final HANDLER_WHAT_TOGGLE_POINTER_NVIDIA:I = 0x3

.field public static volatile isRunning:Z = false


# instance fields
.field private mDecorView:Landroid/view/View;

.field private final mHandler:Landroid/os/Handler;

.field private quitfocus:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 20
    invoke-direct {p0}, Lcom/retroarch/browser/retroactivity/RetroActivityCamera;-><init>()V

    const/4 v0, 0x0

    .line 26
    iput-boolean v0, p0, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->quitfocus:Z

    .line 41
    new-instance v0, Lcom/retroarch/browser/retroactivity/RetroActivityFuture$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/retroarch/browser/retroactivity/RetroActivityFuture$1;-><init>(Lcom/retroarch/browser/retroactivity/RetroActivityFuture;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/retroarch/browser/retroactivity/RetroActivityFuture;Z)V
    .locals 0

    .line 20
    invoke-direct {p0, p1}, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->attemptToggleImmersiveMode(Z)V

    return-void
.end method

.method static synthetic access$100(Lcom/retroarch/browser/retroactivity/RetroActivityFuture;Z)V
    .locals 0

    .line 20
    invoke-direct {p0, p1}, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->attemptTogglePointerCapture(Z)V

    return-void
.end method

.method static synthetic access$200(Lcom/retroarch/browser/retroactivity/RetroActivityFuture;Z)V
    .locals 0

    .line 20
    invoke-direct {p0, p1}, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->attemptToggleNvidiaCursorVisibility(Z)V

    return-void
.end method

.method static synthetic access$300(Lcom/retroarch/browser/retroactivity/RetroActivityFuture;Z)V
    .locals 0

    .line 20
    invoke-direct {p0, p1}, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->attemptTogglePointerIcon(Z)V

    return-void
.end method

.method private attemptToggleImmersiveMode(Z)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "state"
        }
    .end annotation

    .line 172
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_1

    if-eqz p1, :cond_0

    .line 175
    :try_start_0
    iget-object p1, p0, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->mDecorView:Landroid/view/View;

    const/16 v0, 0xf07

    invoke-virtual {p1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V

    goto :goto_0

    .line 183
    :cond_0
    iget-object p1, p0, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->mDecorView:Landroid/view/View;

    const/16 v0, 0x700

    invoke-virtual {p1, v0}, Landroid/view/View;->setSystemUiVisibility(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 188
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    const-string v0, "[attemptToggleImmersiveMode] exception thrown:"

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    :goto_0
    return-void
.end method

.method private attemptToggleNvidiaCursorVisibility(Z)V
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "state"
        }
    .end annotation

    .line 211
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_1

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 214
    :goto_0
    :try_start_0
    const-class v2, Landroid/hardware/input/InputManager;

    const-string v3, "setCursorVisibility"

    new-array v4, v0, [Ljava/lang/Class;

    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v5, v4, v1

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const-string v3, "input"

    .line 215
    invoke-virtual {p0, v3}, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/hardware/input/InputManager;

    new-array v0, v0, [Ljava/lang/Object;

    .line 216
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    aput-object p1, v0, v1

    invoke-virtual {v2, v3, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 220
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    const-string v0, "[attemptToggleNvidiaCursorVisibility] exception thrown:"

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :catch_1
    :cond_1
    :goto_1
    return-void
.end method

.method private attemptTogglePointerCapture(Z)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "state"
        }
    .end annotation

    .line 195
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_1

    if-eqz p1, :cond_0

    .line 198
    :try_start_0
    iget-object p1, p0, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->mDecorView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->requestPointerCapture()V

    goto :goto_0

    .line 200
    :cond_0
    iget-object p1, p0, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->mDecorView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->releasePointerCapture()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 203
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    const-string v0, "[attemptTogglePointerCapture] exception thrown:"

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    :goto_0
    return-void
.end method

.method private attemptTogglePointerIcon(Z)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "state"
        }
    .end annotation

    .line 228
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_1

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-ge v0, v1, :cond_1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    .line 231
    :try_start_0
    invoke-static {p0, p1}, Landroid/view/PointerIcon;->getSystemIcon(Landroid/content/Context;I)Landroid/view/PointerIcon;

    move-result-object p1

    .line 232
    iget-object v0, p0, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->mDecorView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setPointerIcon(Landroid/view/PointerIcon;)V

    goto :goto_0

    .line 235
    :cond_0
    iget-object p1, p0, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->mDecorView:Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setPointerIcon(Landroid/view/PointerIcon;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 238
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    const-string v0, "[attemptTogglePointerIcon] exception thrown:"

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    :goto_0
    return-void
.end method

.method private mHandlerSendUiMessage(IZ)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "what",
            "state"
        }
    .end annotation

    const/4 v0, -0x1

    .line 160
    iget-object v1, p0, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, p1, p2, v0}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object p1

    .line 161
    iget-object p2, p0, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->mHandler:Landroid/os/Handler;

    const-wide/16 v0, 0x12c

    invoke-virtual {p2, p1, v0, v1}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    return-void
.end method


# virtual methods
.method public inputGrabMouse(Z)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "state"
        }
    .end annotation

    const/4 v0, 0x2

    .line 165
    invoke-direct {p0, v0, p1}, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->mHandlerSendUiMessage(IZ)V

    const/4 v0, 0x3

    .line 166
    invoke-direct {p0, v0, p1}, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->mHandlerSendUiMessage(IZ)V

    const/4 v0, 0x4

    .line 167
    invoke-direct {p0, v0, p1}, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->mHandlerSendUiMessage(IZ)V

    return-void
.end method

.method private copyCore()V
    .locals 5

    .prologue

    # Create a dir (if not exists)
    const-string v0, "/data/user/0/com.retroarch.ra32/cores"
    new-instance v1, Ljava/io/File;
    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    # Get the core path
    invoke-virtual {p0}, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->getIntent()Landroid/content/Intent;
    move-result-object v0 # intent
    const-string v3, "LIBRETRO"
    invoke-virtual {v0, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v3 # libretro_path

    # if path exists
    new-instance v4, Ljava/io/File;
    invoke-direct {v4, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V
    invoke-virtual {v4}, Ljava/io/File;->exists()Z
    move-result v4
    if-eqz v4, :cond_copy_needed
    return-void

    :cond_copy_needed

    const-string v4, "LIBRETRO_SD"
    invoke-virtual {v0, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v4 # libretro_sd_path

    new-instance v1, Ljava/io/FileOutputStream;
    invoke-direct {v1, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/io/FileInputStream;
    invoke-direct {v2, v4}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    const/16 v0, 0x2000
    new-array v0, v0, [B

    :loop
    invoke-virtual {v2, v0}, Ljava/io/FileInputStream;->read([B)I
    move-result v3

    if-gtz v3, :cond_write
    goto :close

    :cond_write
    const/4 v4, 0x0
    invoke-virtual {v1, v0, v4, v3}, Ljava/io/FileOutputStream;->write([BII)V
    goto :loop

    :close
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "savedInstanceState"
        }
    .end annotation

    .line 60
    invoke-direct {p0}, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->copyCore()V

    invoke-super {p0, p1}, Lcom/retroarch/browser/retroactivity/RetroActivityCamera;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 62
    sput-boolean p1, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->isRunning:Z

    .line 63
    invoke-virtual {p0}, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->mDecorView:Landroid/view/View;

    .line 66
    invoke-virtual {p0}, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "QUITFOCUS"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->quitfocus:Z

    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 136
    invoke-super {p0}, Lcom/retroarch/browser/retroactivity/RetroActivityCamera;->onDestroy()V

    const/4 v0, 0x0

    .line 137
    sput-boolean v0, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->isRunning:Z

    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "intent"
        }
    .end annotation

    .line 71
    invoke-super {p0, p1}, Lcom/retroarch/browser/retroactivity/RetroActivityCamera;->onNewIntent(Landroid/content/Intent;)V

    const-string v0, "ROM"

    .line 74
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "LIBRETRO"

    .line 75
    invoke-virtual {p1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 78
    invoke-virtual {p0}, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const/4 v5, 0x0

    if-eqz v4, :cond_0

    .line 79
    invoke-virtual {v4, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    move-object v0, v5

    :goto_0
    if-eqz v4, :cond_1

    .line 80
    invoke-virtual {v4, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :cond_1
    if-eqz v1, :cond_2

    .line 84
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_2
    if-eqz v3, :cond_4

    .line 85
    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 87
    :cond_3
    invoke-virtual {p0}, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->finish()V

    const/4 p1, 0x0

    .line 88
    invoke-static {p1}, Ljava/lang/System;->exit(I)V

    goto :goto_1

    .line 91
    :cond_4
    invoke-virtual {p0, p1}, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->setIntent(Landroid/content/Intent;)V

    :goto_1
    return-void
.end method

.method public onResume()V
    .locals 2

    .line 97
    invoke-super {p0}, Lcom/retroarch/browser/retroactivity/RetroActivityCamera;->onResume()V

    .line 99
    iget-boolean v0, p0, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->sustainedPerformanceMode:Z

    invoke-virtual {p0, v0}, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->setSustainedPerformanceMode(Z)V

    .line 102
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 103
    invoke-virtual {p0}, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "REFRESH"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 107
    invoke-virtual {p0}, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v1

    .line 108
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    int-to-float v0, v0

    iput v0, v1, Landroid/view/WindowManager$LayoutParams;->preferredRefreshRate:F

    .line 109
    invoke-virtual {p0}, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 114
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_1

    .line 115
    new-instance v0, Lcom/retroarch/browser/preferences/util/ConfigFile;

    invoke-static {p0}, Lcom/retroarch/browser/preferences/util/UserPreferences;->getDefaultConfigPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/retroarch/browser/preferences/util/ConfigFile;-><init>(Ljava/lang/String;)V

    :try_start_0
    const-string v1, "video_notch_write_over_enable"

    .line 117
    invoke-virtual {v0, v1}, Lcom/retroarch/browser/preferences/util/ConfigFile;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 118
    invoke-virtual {p0}, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    const/4 v1, 0x1

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 121
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Key doesn\'t exist yet."

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    :goto_0
    return-void
.end method

.method public onStop()V
    .locals 1

    .line 128
    invoke-super {p0}, Lcom/retroarch/browser/retroactivity/RetroActivityCamera;->onStop()V

    .line 131
    iget-boolean v0, p0, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->quitfocus:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/System;->exit(I)V

    :cond_0
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "hasFocus"
        }
    .end annotation

    .line 142
    invoke-super {p0, p1}, Lcom/retroarch/browser/retroactivity/RetroActivityCamera;->onWindowFocusChanged(Z)V

    const/4 v0, 0x1

    .line 144
    invoke-direct {p0, v0, p1}, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->mHandlerSendUiMessage(IZ)V

    .line 147
    :try_start_0
    new-instance v0, Lcom/retroarch/browser/preferences/util/ConfigFile;

    invoke-static {p0}, Lcom/retroarch/browser/preferences/util/UserPreferences;->getDefaultConfigPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/retroarch/browser/preferences/util/ConfigFile;-><init>(Ljava/lang/String;)V

    const-string v1, "input_auto_mouse_grab"

    .line 148
    invoke-virtual {v0, v1}, Lcom/retroarch/browser/preferences/util/ConfigFile;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 149
    invoke-virtual {p0, p1}, Lcom/retroarch/browser/retroactivity/RetroActivityFuture;->inputGrabMouse(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 152
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    const-string v0, "[onWindowFocusChanged] exception thrown:"

    invoke-static {v0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :goto_0
    return-void
.end method
