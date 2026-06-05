.class public final Lorg/uoyabause/android/Yabause;
.super Landroidx/appcompat/app/d;
.source "SourceFile"

# interfaces
.implements Lorg/uoyabause/android/D$c;
.implements Lcom/google/android/material/navigation/NavigationView$d;
.implements Lorg/uoyabause/android/H0$b;
.implements Lorg/uoyabause/android/C0$b;
.implements Lorg/uoyabause/android/o0;
.implements Landroid/hardware/input/InputManager$InputDeviceListener;
.implements Lorg/uoyabause/android/x0$b;
.implements Lf8/b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/uoyabause/android/Yabause$b;,
        Lorg/uoyabause/android/Yabause$a;
    }
.end annotation


# static fields
.field public static final Companion:Lorg/uoyabause/android/Yabause$a;

.field public static final REPORT_STATE_FAIL_AUTH:I = -0x3

.field public static final REPORT_STATE_FAIL_CONNECTION:I = -0x2

.field public static final REPORT_STATE_FAIL_DUPE:I = -0x1

.field public static final REPORT_STATE_INIT:I = 0x0

.field public static final REPORT_STATE_SUCCESS:I = 0x1

.field private static final TAG:Ljava/lang/String; = "Yabause"


# instance fields
.field private final MENU_ID_LEADERBOARD:I

.field private final OPEN_FILE:I

.field public _report_status:I

.field private final apiscope:Lc7/J;

.field private audio:Lorg/uoyabause/android/F1;

.field private biosPath:Ljava/lang/String;

.field private cartridgeType:I

.field private cheat_codes:[Ljava/lang/String;

.field private currentDocumentUri:Landroid/net/Uri;

.field private currentGame:Lf8/a;

.field private drawerLayout:Landroidx/drawerlayout/widget/DrawerLayout;

.field private firebaseAnalytics:Lcom/google/firebase/analytics/FirebaseAnalytics;

.field private gamePath:Ljava/lang/String;

.field private googleSignInClient:Lcom/google/android/gms/auth/api/signin/b;

.field private inputManager:Landroid/hardware/input/InputManager;

.field private loginEmitter:Le6/p;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Le6/p;"
        }
    .end annotation
.end field

.field private mParcelFileDescriptor:Landroid/os/ParcelFileDescriptor;

.field private menu_showing:Z

.field private padManager:Lorg/uoyabause/android/x0;

.field private progressBar:Landroid/view/View;

.field private progressMessage:Landroid/widget/TextView;

.field private final returnCodeSignIn:I

.field private final scope:Lc7/J;

.field private startTime:J

.field private subFileDescripters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/os/ParcelFileDescriptor;",
            ">;"
        }
    .end annotation
.end field

.field private testCase:Ljava/lang/String;

.field private tracker:Lx2/k;

.field private trayState:Lorg/uoyabause/android/Z0;

.field private videoInterface:I

.field private waitingResult:Z

.field private yabauseThread:Lorg/uoyabause/android/YabauseRunnable;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lorg/uoyabause/android/Yabause$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/uoyabause/android/Yabause$a;-><init>(LS6/g;)V

    sput-object v0, Lorg/uoyabause/android/Yabause;->Companion:Lorg/uoyabause/android/Yabause$a;

    const-string v0, "yabause_native"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroidx/appcompat/app/d;-><init>()V

    sget-object v0, Lorg/uoyabause/android/Z0;->b:Lorg/uoyabause/android/Z0;

    iput-object v0, p0, Lorg/uoyabause/android/Yabause;->trayState:Lorg/uoyabause/android/Z0;

    const v0, 0x8010

    iput v0, p0, Lorg/uoyabause/android/Yabause;->returnCodeSignIn:I

    const v0, 0x8123

    iput v0, p0, Lorg/uoyabause/android/Yabause;->MENU_ID_LEADERBOARD:I

    const/16 v0, 0x1234

    iput v0, p0, Lorg/uoyabause/android/Yabause;->OPEN_FILE:I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/uoyabause/android/Yabause;->subFileDescripters:Ljava/util/List;

    invoke-static {}, Lc7/Y;->b()Lc7/G;

    move-result-object v0

    invoke-static {v0}, Lc7/K;->a(LJ6/g;)Lc7/J;

    move-result-object v0

    iput-object v0, p0, Lorg/uoyabause/android/Yabause;->apiscope:Lc7/J;

    invoke-static {}, Lc7/Y;->a()Lc7/G;

    move-result-object v0

    invoke-static {v0}, Lc7/K;->a(LJ6/g;)Lc7/J;

    move-result-object v0

    iput-object v0, p0, Lorg/uoyabause/android/Yabause;->scope:Lc7/J;

    return-void
.end method

.method public static synthetic Q(Lorg/uoyabause/android/Yabause;Le6/p;)V
    .locals 0

    invoke-static {p0, p1}, Lorg/uoyabause/android/Yabause;->checkAuth$lambda$12(Lorg/uoyabause/android/Yabause;Le6/p;)V

    return-void
.end method

.method public static synthetic R(Ljava/io/File;Ljava/lang/String;)Z
    .locals 0

    invoke-static {p0, p1}, Lorg/uoyabause/android/Yabause;->showAutoStateLoadDialog$lambda$0(Ljava/io/File;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static synthetic S(Ljava/io/File;Le6/p;Lcom/google/firebase/storage/e$a;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lorg/uoyabause/android/Yabause;->setLoadStateObserver$lambda$20$lambda$18(Ljava/io/File;Le6/p;Lcom/google/firebase/storage/e$a;)V

    return-void
.end method

.method public static synthetic T(Lorg/uoyabause/android/Yabause;Landroid/content/DialogInterface;)V
    .locals 0

    invoke-static {p0, p1}, Lorg/uoyabause/android/Yabause;->showInitFailedDialog$lambda$6(Lorg/uoyabause/android/Yabause;Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic U(Lorg/uoyabause/android/Yabause;Lf8/c;Landroid/view/MenuItem;)Z
    .locals 0

    invoke-static {p0, p1, p2}, Lorg/uoyabause/android/Yabause;->onCreate$lambda$10$lambda$9(Lorg/uoyabause/android/Yabause;Lf8/c;Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method

.method public static synthetic V(Lorg/uoyabause/android/Yabause;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lorg/uoyabause/android/Yabause;->onNewRecord$lambda$38$lambda$37(Lorg/uoyabause/android/Yabause;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic W(Lorg/uoyabause/android/Yabause;Ljava/lang/String;)V
    .locals 0

    invoke-static {p0, p1}, Lorg/uoyabause/android/Yabause;->onNewRecord$lambda$38(Lorg/uoyabause/android/Yabause;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic X(Ljava/io/File;Landroidx/appcompat/app/c;Landroid/view/View;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lorg/uoyabause/android/Yabause;->showAutoStateLoadDialog$lambda$3(Ljava/io/File;Landroidx/appcompat/app/c;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Y(LR6/l;Ljava/lang/Object;)V
    .locals 0

    invoke-static {p0, p1}, Lorg/uoyabause/android/Yabause;->setSaveStateObserver$lambda$17$lambda$16(LR6/l;Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic Z(Landroid/widget/Button;Landroid/view/View;Landroid/widget/Button;Landroidx/appcompat/app/c;Landroid/content/DialogInterface;)V
    .locals 0

    invoke-static {p0, p1, p2, p3, p4}, Lorg/uoyabause/android/Yabause;->showAutoStateLoadDialog$lambda$4(Landroid/widget/Button;Landroid/view/View;Landroid/widget/Button;Landroidx/appcompat/app/c;Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic a0(Ljava/lang/String;Le6/p;Ljava/lang/Exception;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lorg/uoyabause/android/Yabause;->setSaveStateObserver$lambda$17$lambda$15(Ljava/lang/String;Le6/p;Ljava/lang/Exception;)V

    return-void
.end method

.method public static final synthetic access$getAudio$p(Lorg/uoyabause/android/Yabause;)Lorg/uoyabause/android/F1;
    .locals 0

    iget-object p0, p0, Lorg/uoyabause/android/Yabause;->audio:Lorg/uoyabause/android/F1;

    return-object p0
.end method

.method public static final synthetic access$getMenu_showing$p(Lorg/uoyabause/android/Yabause;)Z
    .locals 0

    iget-boolean p0, p0, Lorg/uoyabause/android/Yabause;->menu_showing:Z

    return p0
.end method

.method public static final synthetic access$getWaitingResult$p(Lorg/uoyabause/android/Yabause;)Z
    .locals 0

    iget-boolean p0, p0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    return p0
.end method

.method public static final synthetic access$setMenu_showing$p(Lorg/uoyabause/android/Yabause;Z)V
    .locals 0

    iput-boolean p1, p0, Lorg/uoyabause/android/Yabause;->menu_showing:Z

    return-void
.end method

.method public static final synthetic access$setWaitingResult$p(Lorg/uoyabause/android/Yabause;Z)V
    .locals 0

    iput-boolean p1, p0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    return-void
.end method

.method public static synthetic b0(Le6/p;)V
    .locals 0

    invoke-static {p0}, Lorg/uoyabause/android/Yabause;->setLoadStateObserver$lambda$20(Le6/p;)V

    return-void
.end method

.method public static synthetic c0(Ljava/io/File;Landroidx/appcompat/app/c;Landroid/view/View;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lorg/uoyabause/android/Yabause;->showAutoStateLoadDialog$lambda$2(Ljava/io/File;Landroidx/appcompat/app/c;Landroid/view/View;)V

    return-void
.end method

.method private final checkAuth(Le6/s;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Le6/s;",
            ")I"
        }
    .end annotation

    new-instance v0, Lorg/uoyabause/android/y1;

    invoke-direct {v0, p0}, Lorg/uoyabause/android/y1;-><init>(Lorg/uoyabause/android/Yabause;)V

    invoke-static {v0}, Le6/o;->h(Le6/q;)Le6/o;

    move-result-object v0

    invoke-static {}, Lg6/a;->a()Le6/t;

    move-result-object v1

    invoke-virtual {v0, v1}, Le6/o;->t(Le6/t;)Le6/o;

    move-result-object v0

    invoke-static {}, Lg6/a;->a()Le6/t;

    move-result-object v1

    invoke-virtual {v0, v1}, Le6/o;->o(Le6/t;)Le6/o;

    move-result-object v0

    invoke-virtual {v0, p1}, Le6/o;->d(Le6/s;)V

    const/4 p1, 0x0

    return p1
.end method

.method private static final checkAuth$lambda$12(Lorg/uoyabause/android/Yabause;Le6/p;)V
    .locals 2

    const-string v0, "this$0"

    invoke-static {p0, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "emitter"

    invoke-static {p1, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/uoyabause/android/Yabause;->loginEmitter:Le6/p;

    invoke-static {}, Lcom/google/firebase/auth/FirebaseAuth;->getInstance()Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object v0

    const-string v1, "getInstance()"

    invoke-static {v0, v1}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/google/firebase/auth/FirebaseAuth;->g()Lcom/google/firebase/auth/o;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {p1, v0}, Le6/e;->c(Ljava/lang/Object;)V

    invoke-interface {p1}, Le6/e;->a()V

    return-void

    :cond_0
    iput-object p1, p0, Lorg/uoyabause/android/Yabause;->loginEmitter:Le6/p;

    invoke-static {}, Lw1/c;->j()Lw1/c;

    move-result-object p1

    invoke-virtual {p1}, Lw1/c;->c()Lw1/c$e;

    move-result-object p1

    new-instance v0, Lw1/c$d$e;

    invoke-direct {v0}, Lw1/c$d$e;-><init>()V

    invoke-virtual {v0}, Lw1/c$d$e;->b()Lw1/c$d;

    move-result-object v0

    filled-new-array {v0}, [Lw1/c$d;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p1, v0}, Lw1/c$e;->c(Ljava/util/List;)Lw1/c$c;

    move-result-object p1

    check-cast p1, Lw1/c$e;

    invoke-virtual {p1}, Lw1/c$e;->a()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "getInstance()\n          \u2026                 .build()"

    invoke-static {p1, v0}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    iget v0, p0, Lorg/uoyabause/android/Yabause;->returnCodeSignIn:I

    invoke-virtual {p0, p1, v0}, Landroidx/activity/j;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private final createZip(Ljava/util/zip/ZipOutputStream;[Ljava/io/File;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x400

    new-array v0, v0, [B

    array-length v1, p2

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, p2, v3

    new-instance v5, Ljava/util/zip/ZipEntry;

    invoke-static {v4}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v5}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    :try_start_0
    new-instance v4, Ljava/io/BufferedInputStream;

    invoke-direct {v4, v5}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :goto_1
    :try_start_1
    invoke-virtual {v4, v0}, Ljava/io/InputStream;->read([B)I

    move-result v6

    const/4 v7, -0x1

    if-eq v6, v7, :cond_0

    invoke-virtual {p1, v0, v2, v6}, Ljava/util/zip/ZipOutputStream;->write([BII)V

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_2

    :cond_0
    sget-object v6, LF6/r;->a:LF6/r;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v6, 0x0

    :try_start_2
    invoke-static {v4, v6}, LP6/b;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    invoke-static {v5, v6}, LP6/b;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :catchall_1
    move-exception p1

    goto :goto_3

    :goto_2
    :try_start_3
    throw p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :catchall_2
    move-exception p2

    :try_start_4
    invoke-static {v4, p1}, LP6/b;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw p2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :goto_3
    :try_start_5
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    :catchall_3
    move-exception p2

    invoke-static {v5, p1}, LP6/b;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw p2

    :cond_1
    return-void
.end method

.method public static synthetic d0(Lorg/uoyabause/android/Yabause;Landroid/content/Intent;)V
    .locals 0

    invoke-static {p0, p1}, Lorg/uoyabause/android/Yabause;->onCreate$lambda$10$lambda$9$lambda$8(Lorg/uoyabause/android/Yabause;Landroid/content/Intent;)V

    return-void
.end method

.method public static synthetic e0(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-static {p0, p1}, Lorg/uoyabause/android/Yabause;->onCreateDialog$lambda$27(Landroid/content/DialogInterface;I)V

    return-void
.end method

.method private static final errorMsg$lambda$35(Lorg/uoyabause/android/Yabause;Ljava/lang/String;)V
    .locals 2

    const-string v0, "this$0"

    invoke-static {p0, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "$errmsg"

    invoke-static {p1, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Landroidx/appcompat/app/c$a;

    invoke-direct {v0, p0}, Landroidx/appcompat/app/c$a;-><init>(Landroid/content/Context;)V

    const-string v1, "Error!"

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/c$a;->u(Ljava/lang/CharSequence;)Landroidx/appcompat/app/c$a;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroidx/appcompat/app/c$a;->h(Ljava/lang/CharSequence;)Landroidx/appcompat/app/c$a;

    move-result-object p1

    new-instance v0, Lorg/uoyabause/android/r1;

    invoke-direct {v0, p0}, Lorg/uoyabause/android/r1;-><init>(Lorg/uoyabause/android/Yabause;)V

    const p0, 0x7f1300b1

    invoke-virtual {p1, p0, v0}, Landroidx/appcompat/app/c$a;->p(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/c$a;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/appcompat/app/c$a;->w()Landroidx/appcompat/app/c;

    return-void
.end method

.method private static final errorMsg$lambda$35$lambda$34(Lorg/uoyabause/android/Yabause;Landroid/content/DialogInterface;I)V
    .locals 0

    const-string p1, "this$0"

    invoke-static {p0, p1}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public static synthetic f0(Ljava/io/File;Le6/p;Ljava/lang/Exception;)V
    .locals 0

    invoke-static {p0, p1, p2}, Lorg/uoyabause/android/Yabause;->setLoadStateObserver$lambda$20$lambda$19(Ljava/io/File;Le6/p;Ljava/lang/Exception;)V

    return-void
.end method

.method public static synthetic g0(Lorg/uoyabause/android/Yabause;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lorg/uoyabause/android/Yabause;->showInitFailedDialog$lambda$5(Lorg/uoyabause/android/Yabause;Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public static synthetic h0(Lorg/uoyabause/android/Yabause;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lorg/uoyabause/android/Yabause;->errorMsg$lambda$35$lambda$34(Lorg/uoyabause/android/Yabause;Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public static synthetic i0(Le6/p;)V
    .locals 0

    invoke-static {p0}, Lorg/uoyabause/android/Yabause;->setSaveStateObserver$lambda$17(Le6/p;)V

    return-void
.end method

.method private final isSignedIn()Z
    .locals 1

    invoke-static {p0}, Lcom/google/android/gms/auth/api/signin/a;->c(Landroid/content/Context;)Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static synthetic j0(Lcom/google/android/gms/tasks/Task;)V
    .locals 0

    invoke-static {p0}, Lorg/uoyabause/android/Yabause;->signInSilently$lambda$11(Lcom/google/android/gms/tasks/Task;)V

    return-void
.end method

.method public static synthetic k0(Lorg/uoyabause/android/Yabause;)V
    .locals 0

    invoke-static {p0}, Lorg/uoyabause/android/Yabause;->onNavigationItemSelected$lambda$25$lambda$24(Lorg/uoyabause/android/Yabause;)V

    return-void
.end method

.method public static synthetic l0(Lorg/uoyabause/android/Yabause;Landroid/widget/CompoundButton;Z)V
    .locals 0

    invoke-static {p0, p1, p2}, Lorg/uoyabause/android/Yabause;->onCreate$lambda$7(Lorg/uoyabause/android/Yabause;Landroid/widget/CompoundButton;Z)V

    return-void
.end method

.method public static synthetic m0(Lorg/uoyabause/android/Yabause;Landroid/content/Intent;)V
    .locals 0

    invoke-static {p0, p1}, Lorg/uoyabause/android/Yabause;->onNewRecord$lambda$38$lambda$37$lambda$36(Lorg/uoyabause/android/Yabause;Landroid/content/Intent;)V

    return-void
.end method

.method public static synthetic n0(Lorg/uoyabause/android/Yabause;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-static {p0, p1, p2}, Lorg/uoyabause/android/Yabause;->onCreateDialog$lambda$26(Lorg/uoyabause/android/Yabause;Landroid/content/DialogInterface;I)V

    return-void
.end method

.method public static synthetic o0(Lorg/uoyabause/android/Yabause;Ljava/lang/String;)V
    .locals 0

    invoke-static {p0, p1}, Lorg/uoyabause/android/Yabause;->errorMsg$lambda$35(Lorg/uoyabause/android/Yabause;Ljava/lang/String;)V

    return-void
.end method

.method private static final onCreate$lambda$10$lambda$9(Lorg/uoyabause/android/Yabause;Lf8/c;Landroid/view/MenuItem;)Z
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "$it"

    invoke-static {p1, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "<anonymous parameter 0>"

    invoke-static {p2, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p2, 0x1

    iput-boolean p2, p0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    invoke-static {p0}, Lcom/google/android/gms/auth/api/signin/a;->c(Landroid/content/Context;)Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {p0, v0}, Ld3/e;->a(Landroid/app/Activity;Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)Ld3/j;

    move-result-object v0

    invoke-virtual {p1}, Lf8/c;->a()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ld3/j;->getLeaderboardIntent(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance v0, Lorg/uoyabause/android/p1;

    invoke-direct {v0, p0}, Lorg/uoyabause/android/p1;-><init>(Lorg/uoyabause/android/Yabause;)V

    invoke-virtual {p1, v0}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    :cond_0
    return p2
.end method

.method private static final onCreate$lambda$10$lambda$9$lambda$8(Lorg/uoyabause/android/Yabause;Landroid/content/Intent;)V
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "intent"

    invoke-static {p1, v0}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    iget v0, p0, Lorg/uoyabause/android/Yabause;->MENU_ID_LEADERBOARD:I

    invoke-virtual {p0, p1, v0}, Landroidx/activity/j;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method private static final onCreate$lambda$7(Lorg/uoyabause/android/Yabause;Landroid/widget/CompoundButton;Z)V
    .locals 4

    const-string p1, "this$0"

    invoke-static {p0, p1}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const p1, 0x7f0a03b6

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/d;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const-string v0, "null cannot be cast to non-null type org.uoyabause.android.YabausePad"

    invoke-static {p1, v0}, LS6/l;->c(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, Lorg/uoyabause/android/YabausePad;

    const/4 v0, 0x0

    const-string v1, "padManager"

    const/4 v2, 0x0

    sget-object v2, Lx7/ozMM/rDZVPqMyeYXm;->dgQqMfhKEmEucC:Ljava/lang/String;

    if-eqz p2, :cond_1

    iget-object p2, p0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez p2, :cond_0

    invoke-static {v1}, LS6/l;->p(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    move-object v0, p2

    :goto_0
    const/4 p2, 0x1

    invoke-virtual {v0, p2}, Lorg/uoyabause/android/x0;->r(I)V

    sget-object v0, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {v0, p2}, Lorg/uoyabause/android/YabauseRunnable$a;->X(I)V

    invoke-virtual {p1, p2}, Lorg/uoyabause/android/YabausePad;->setPadMode(I)V

    invoke-static {p0, v2}, LK1/b;->g(Landroid/content/Context;Ljava/lang/String;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, v2, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_2

    :cond_1
    sget-object p2, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    const/4 v3, 0x0

    invoke-virtual {p2, v3}, Lorg/uoyabause/android/YabauseRunnable$a;->X(I)V

    iget-object p2, p0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez p2, :cond_2

    invoke-static {v1}, LS6/l;->p(Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    move-object v0, p2

    :goto_1
    invoke-virtual {v0, v3}, Lorg/uoyabause/android/x0;->r(I)V

    invoke-virtual {p1, v3}, Lorg/uoyabause/android/YabausePad;->setPadMode(I)V

    invoke-static {p0, v2}, LK1/b;->g(Landroid/content/Context;Ljava/lang/String;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :goto_2
    return-void
.end method

.method private static final onCreateDialog$lambda$26(Lorg/uoyabause/android/Yabause;Landroid/content/DialogInterface;I)V
    .locals 0

    const-string p1, "this$0"

    invoke-static {p0, p1}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method private static final onCreateDialog$lambda$27(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method private static final onNavigationItemSelected$lambda$25(Lorg/uoyabause/android/Yabause;)V
    .locals 11

    const-string v0, "this$0"

    invoke-static {p0, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0}, Landroidx/preference/k;->b(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "pref_auto_state_save"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_4

    sget-object v0, Lorg/uoyabause/android/M1;->m:Lorg/uoyabause/android/M1$g;

    invoke-virtual {v0}, Lorg/uoyabause/android/M1$g;->e()Lorg/uoyabause/android/M1;

    move-result-object v1

    invoke-virtual {v1}, Lorg/uoyabause/android/M1;->z()Ljava/lang/String;

    move-result-object v1

    sget-object v3, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {v3}, Lorg/uoyabause/android/YabauseRunnable$a;->m()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    new-instance v5, Ljava/io/File;

    invoke-virtual {v0}, Lorg/uoyabause/android/M1$g;->e()Lorg/uoyabause/android/M1;

    move-result-object v0

    invoke-virtual {v0}, Lorg/uoyabause/android/M1;->z()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v5, v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    :goto_0
    if-eqz v5, :cond_1

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {v5}, Ljava/io/File;->mkdir()Z

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Lorg/uoyabause/android/YabauseRunnable$a;->G(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    const/4 v9, 0x6

    const/4 v10, 0x0

    const-string v6, "."

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v5, v0

    invoke-static/range {v5 .. v10}, La7/g;->Y(Ljava/lang/CharSequence;Ljava/lang/String;IZILjava/lang/Object;)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_2

    invoke-virtual {v0, v2, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    const-string v2, "this as java.lang.String\u2026ing(startIndex, endIndex)"

    invoke-static {v0, v2}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ".png"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Lorg/uoyabause/android/YabauseRunnable$a;->I(Ljava/lang/String;)I

    :cond_3
    sget-object v0, Lorg/uoyabause/android/Y0;->u0:Lorg/uoyabause/android/Y0$a;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/uoyabause/android/Y0$a;->a(Ljava/lang/String;)V

    :cond_4
    sget-object v0, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {v0}, Lorg/uoyabause/android/YabauseRunnable$a;->d()V

    new-instance v0, Lorg/uoyabause/android/q1;

    invoke-direct {v0, p0}, Lorg/uoyabause/android/q1;-><init>(Lorg/uoyabause/android/Yabause;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static final onNavigationItemSelected$lambda$25$lambda$24(Lorg/uoyabause/android/Yabause;)V
    .locals 4

    const-string v0, "this$0"

    invoke-static {p0, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->mParcelFileDescriptor:Landroid/os/ParcelFileDescriptor;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V

    :cond_0
    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->subFileDescripters:Ljava/util/List;

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v1}, Landroid/os/ParcelFileDescriptor;->close()V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->subFileDescripters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    iget-wide v2, p0, Lorg/uoyabause/android/Yabause;->startTime:J

    sub-long/2addr v0, v2

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    const-string v3, "playTime"

    invoke-virtual {v2, v3, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const/4 v0, -0x1

    invoke-virtual {p0, v0, v2}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result p0

    invoke-static {p0}, Landroid/os/Process;->killProcess(I)V

    return-void
.end method

.method private static final onNewRecord$lambda$38(Lorg/uoyabause/android/Yabause;Ljava/lang/String;)V
    .locals 3

    const-string v0, "this$0"

    invoke-static {p0, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "$leaderBoardId"

    invoke-static {p1, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->drawerLayout:Landroidx/drawerlayout/widget/DrawerLayout;

    if-nez v0, :cond_0

    const-string v0, "drawerLayout"

    invoke-static {v0}, LS6/l;->p(Ljava/lang/String;)V

    const/4 v0, 0x0

    :cond_0
    const-string v1, "Congratulations for the New Record!"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/google/android/material/snackbar/Snackbar;->k0(Landroid/view/View;Ljava/lang/CharSequence;I)Lcom/google/android/material/snackbar/Snackbar;

    move-result-object v0

    const-string v1, "make(this.drawerLayout,\n\u2026    Snackbar.LENGTH_LONG)"

    invoke-static {v0, v1}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lorg/uoyabause/android/h1;

    invoke-direct {v1, p0, p1}, Lorg/uoyabause/android/h1;-><init>(Lorg/uoyabause/android/Yabause;Ljava/lang/String;)V

    const-string p0, "Check Leader board"

    invoke-virtual {v0, p0, v1}, Lcom/google/android/material/snackbar/Snackbar;->m0(Ljava/lang/CharSequence;Landroid/view/View$OnClickListener;)Lcom/google/android/material/snackbar/Snackbar;

    invoke-virtual {v0}, Lcom/google/android/material/snackbar/Snackbar;->V()V

    return-void
.end method

.method private static final onNewRecord$lambda$38$lambda$37(Lorg/uoyabause/android/Yabause;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    const-string p2, "this$0"

    invoke-static {p0, p2}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const-string p2, "$leaderBoardId"

    invoke-static {p1, p2}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0}, Lcom/google/android/gms/auth/api/signin/a;->c(Landroid/content/Context;)Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-static {p0, p2}, Ld3/e;->a(Landroid/app/Activity;Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)Ld3/j;

    move-result-object p2

    invoke-interface {p2, p1}, Ld3/j;->getLeaderboardIntent(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    new-instance p2, Lorg/uoyabause/android/s1;

    invoke-direct {p2, p0}, Lorg/uoyabause/android/s1;-><init>(Lorg/uoyabause/android/Yabause;)V

    invoke-virtual {p1, p2}, Lcom/google/android/gms/tasks/Task;->addOnSuccessListener(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/android/gms/tasks/Task;

    :cond_0
    return-void
.end method

.method private static final onNewRecord$lambda$38$lambda$37$lambda$36(Lorg/uoyabause/android/Yabause;Landroid/content/Intent;)V
    .locals 1

    const-string v0, "this$0"

    invoke-static {p0, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "intent"

    invoke-static {p1, v0}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x3

    invoke-virtual {p0, p1, v0}, Landroidx/activity/j;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method

.method public static synthetic p0(Lorg/uoyabause/android/Yabause;)V
    .locals 0

    invoke-static {p0}, Lorg/uoyabause/android/Yabause;->onNavigationItemSelected$lambda$25(Lorg/uoyabause/android/Yabause;)V

    return-void
.end method

.method private final readPreferences(Ljava/lang/String;)V
    .locals 12

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-static {p0, p1}, Lorg/uoyabause/android/e0;->a(Landroid/content/Context;Ljava/lang/String;)V

    const/4 v4, 0x4

    const/4 v5, 0x0

    const-string v1, " "

    const-string v2, "-"

    const/4 v3, 0x0

    move-object v0, p1

    invoke-static/range {v0 .. v5}, La7/g;->z(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, LK1/b;->g(Landroid/content/Context;Ljava/lang/String;)Landroid/content/SharedPreferences;

    move-result-object p1

    sget-object v0, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    const-string v1, "pref_rotate_screen"

    const/4 v2, 0x0

    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/uoyabause/android/YabauseRunnable$a;->k(I)V

    const-string v1, "pref_fps"

    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/uoyabause/android/YabauseRunnable$a;->i(I)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "enable FPS "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v3, "Yabause"

    invoke-static {v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v1, "pref_frameskip"

    const/4 v4, 0x1

    invoke-interface {p1, v1, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/uoyabause/android/YabauseRunnable$a;->j(I)V

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "enable enableFrameskip "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v1, "pref_aspect_rate"

    const-string v5, "0"

    invoke-interface {p1, v1, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v6, 0x0

    if-eqz v1, :cond_1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_0

    :cond_1
    move-object v1, v6

    :goto_0
    invoke-static {v1}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/uoyabause/android/YabauseRunnable$a;->J(I)V

    const-string v1, "pref_resolution"

    invoke-interface {p1, v1, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_1

    :cond_2
    move-object v1, v6

    :goto_1
    invoke-static {v1}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/uoyabause/android/YabauseRunnable$a;->Q(I)V

    const-string v1, "pref_rbg_resolution"

    invoke-interface {p1, v1, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_2

    :cond_3
    move-object v1, v6

    :goto_2
    invoke-static {v1}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/uoyabause/android/YabauseRunnable$a;->P(I)V

    const-string v1, "pref_frameLimit"

    invoke-interface {p1, v1, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_3

    :cond_4
    move-object v1, v6

    :goto_3
    invoke-static {v1}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-static {v1}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/uoyabause/android/YabauseRunnable$a;->N(I)V

    invoke-static {p0}, Landroidx/preference/k;->b(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const-string v7, "pref_extend_internal_memory"

    invoke-interface {v1, v7, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    invoke-virtual {v0, v7}, Lorg/uoyabause/android/YabauseRunnable$a;->h(I)V

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "enable Extended Memory "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v3, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "pref_cpu"

    const-string v8, "3"

    invoke-interface {v1, v7, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_5

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    goto :goto_4

    :cond_5
    move-object v7, v6

    :goto_4
    const-string v8, "os.arch"

    invoke-static {v8}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, LS6/l;->b(Ljava/lang/Object;)V

    const-string v9, "64"

    const/4 v10, 0x2

    invoke-static {v8, v9, v2, v10, v6}, La7/g;->I(Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZILjava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_7

    if-nez v7, :cond_6

    goto :goto_5

    :cond_6
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v8

    if-ne v8, v10, :cond_7

    const/4 v7, 0x3

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    :cond_7
    :goto_5
    invoke-static {v7}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-virtual {v0, v8}, Lorg/uoyabause/android/YabauseRunnable$a;->K(I)V

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "cpu "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v3, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "pref_use_cpu_affinity"

    invoke-interface {v1, v7, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    invoke-virtual {v0, v7}, Lorg/uoyabause/android/YabauseRunnable$a;->U(I)V

    const-string v7, "pref_use_sh2_cache"

    invoke-interface {v1, v7, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    invoke-virtual {v0, v7}, Lorg/uoyabause/android/YabauseRunnable$a;->V(I)V

    const-string v7, "pref_filter"

    invoke-interface {v1, v7, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_8

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    goto :goto_6

    :cond_8
    move-object v7, v6

    :goto_6
    invoke-static {v7}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-virtual {v0, v8}, Lorg/uoyabause/android/YabauseRunnable$a;->M(I)V

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "setFilter "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v3, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "pref_audio"

    invoke-interface {v1, v7, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    if-eqz v7, :cond_9

    iget-object v8, p0, Lorg/uoyabause/android/Yabause;->audio:Lorg/uoyabause/android/F1;

    if-eqz v8, :cond_a

    invoke-virtual {v8, v10}, Lorg/uoyabause/android/F1;->b(I)V

    goto :goto_7

    :cond_9
    iget-object v8, p0, Lorg/uoyabause/android/Yabause;->audio:Lorg/uoyabause/android/F1;

    if-eqz v8, :cond_a

    invoke-virtual {v8, v10}, Lorg/uoyabause/android/F1;->a(I)V

    :cond_a
    :goto_7
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Audio "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v3, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "pref_bios"

    const-string v8, ""

    invoke-interface {v1, v7, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_b

    sget-object v8, Lorg/uoyabause/android/M1;->m:Lorg/uoyabause/android/M1$g;

    invoke-virtual {v8}, Lorg/uoyabause/android/M1$g;->e()Lorg/uoyabause/android/M1;

    move-result-object v8

    invoke-virtual {v8, v7}, Lorg/uoyabause/android/M1;->o(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lorg/uoyabause/android/Yabause;->biosPath:Ljava/lang/String;

    goto :goto_8

    :cond_b
    iput-object v8, p0, Lorg/uoyabause/android/Yabause;->biosPath:Ljava/lang/String;

    :goto_8
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "bios "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v3, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "pref_cart"

    const-string v8, "7"

    invoke-interface {v1, v7, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_c

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    iput v8, p0, Lorg/uoyabause/android/Yabause;->cartridgeType:I

    goto :goto_9

    :cond_c
    const/4 v8, 0x7

    iput v8, p0, Lorg/uoyabause/android/Yabause;->cartridgeType:I

    :goto_9
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "cart "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v3, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "activity"

    invoke-virtual {p0, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    const-string v8, "null cannot be cast to non-null type android.app.ActivityManager"

    invoke-static {v7, v8}, LS6/l;->c(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v7, Landroid/app/ActivityManager;

    invoke-virtual {v7}, Landroid/app/ActivityManager;->getDeviceConfigurationInfo()Landroid/content/pm/ConfigurationInfo;

    move-result-object v7

    iget v7, v7, Landroid/content/pm/ConfigurationInfo;->reqGlEsVersion:I

    const/high16 v8, 0x30000

    if-lt v7, v8, :cond_d

    move v7, v4

    goto :goto_a

    :cond_d
    move v7, v2

    :goto_a
    const-string v8, "pref_video"

    const-string v9, "1"

    if-eqz v7, :cond_e

    invoke-interface {v1, v8, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto :goto_b

    :cond_e
    const-string v7, "2"

    invoke-interface {v1, v8, v7}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    :goto_b
    invoke-static {v7}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    if-lez v8, :cond_f

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    iput v8, p0, Lorg/uoyabause/android/Yabause;->videoInterface:I

    goto :goto_c

    :cond_f
    const/4 v8, -0x1

    iput v8, p0, Lorg/uoyabause/android/Yabause;->videoInterface:I

    :goto_c
    iget v8, p0, Lorg/uoyabause/android/Yabause;->videoInterface:I

    const/4 v11, 0x4

    if-ne v8, v11, :cond_10

    invoke-virtual {v0, v10}, Lorg/uoyabause/android/YabauseRunnable$a;->O(I)V

    const-string p1, "setPolygonGenerationMode 2"

    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0, v4}, Lorg/uoyabause/android/YabauseRunnable$a;->g(I)V

    goto :goto_e

    :cond_10
    const-string v4, "pref_polygon_generation"

    invoke-interface {p1, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_11

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    goto :goto_d

    :cond_11
    move-object v4, v6

    :goto_d
    invoke-static {v4}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v0, v5}, Lorg/uoyabause/android/YabauseRunnable$a;->O(I)V

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "setPolygonGenerationMode "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v4, "pref_use_compute_shader"

    invoke-interface {p1, v4, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    invoke-virtual {v0, p1}, Lorg/uoyabause/android/YabauseRunnable$a;->g(I)V

    :goto_e
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "video "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lorg/uoyabause/android/Yabause;->gamePath:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getGamePath "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lorg/uoyabause/android/Yabause;->getMemoryPath()Ljava/lang/String;

    move-result-object p1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getMemoryPath "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lorg/uoyabause/android/Yabause;->getCartridgePath()Ljava/lang/String;

    move-result-object p1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getCartridgePath "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string p1, "pref_sound_engine"

    invoke-interface {v1, p1, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_12

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_f

    :cond_12
    move-object p1, v6

    :goto_f
    invoke-static {p1}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-static {p1}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v0, v2}, Lorg/uoyabause/android/YabauseRunnable$a;->T(I)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "setSoundEngine "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string p1, "pref_scsp_sync_per_frame"

    invoke-interface {v1, p1, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_13

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_10

    :cond_13
    move-object p1, v6

    :goto_10
    invoke-static {p1}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-static {p1}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v0, p1}, Lorg/uoyabause/android/YabauseRunnable$a;->R(I)V

    const-string p1, "pref_cpu_sync_per_line"

    invoke-interface {v1, p1, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_14

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    goto :goto_11

    :cond_14
    move-object p1, v6

    :goto_11
    invoke-static {p1}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-static {p1}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v0, p1}, Lorg/uoyabause/android/YabauseRunnable$a;->L(I)V

    const-string p1, "scsp_time_sync_mode"

    invoke-interface {v1, p1, v9}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_15

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    :cond_15
    invoke-static {v6}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-static {v6}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v0, p1}, Lorg/uoyabause/android/YabauseRunnable$a;->S(I)V

    invoke-virtual {p0}, Lorg/uoyabause/android/Yabause;->updateInputDevice()V

    return-void
.end method

.method private static final setLoadStateObserver$lambda$20(Le6/p;)V
    .locals 4

    const-string v0, "emitter"

    invoke-static {p0, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {}, Lcom/google/firebase/auth/FirebaseAuth;->getInstance()Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object v0

    const-string v1, "getInstance()"

    invoke-static {v0, v1}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/google/firebase/auth/FirebaseAuth;->g()Lcom/google/firebase/auth/o;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/Exception;

    const-string v1, "not login"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {p0, v0}, Le6/e;->onError(Ljava/lang/Throwable;)V

    return-void

    :cond_0
    sget-object v2, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {v2}, Lorg/uoyabause/android/YabauseRunnable$a;->m()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/google/firebase/storage/f;->f()Lcom/google/firebase/storage/f;

    move-result-object v3

    invoke-static {v3, v1}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/google/firebase/storage/f;->m()Lcom/google/firebase/storage/l;

    move-result-object v1

    const-string v3, "storage.reference"

    invoke-static {v1, v3}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/google/firebase/auth/o;->H2()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/google/firebase/storage/l;->a(Ljava/lang/String;)Lcom/google/firebase/storage/l;

    move-result-object v0

    const/4 v1, 0x0

    sget-object v1, Ln6/YD/JCyklmEWtIo;->wZzWQj:Ljava/lang/String;

    invoke-static {v0, v1}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "state"

    invoke-virtual {v0, v1}, Lcom/google/firebase/storage/l;->a(Ljava/lang/String;)Lcom/google/firebase/storage/l;

    move-result-object v0

    const-string v1, "base.child(\"state\")"

    invoke-static {v0, v1}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz v2, :cond_1

    invoke-virtual {v0, v2}, Lcom/google/firebase/storage/l;->a(Ljava/lang/String;)Lcom/google/firebase/storage/l;

    move-result-object v0

    const-string v1, "backup.child(current_gamecode)"

    invoke-static {v0, v1}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    :try_start_0
    const-string v1, "currentstate"

    const-string v2, "bin.z"

    invoke-static {v1, v2}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/storage/l;->h(Ljava/io/File;)Lcom/google/firebase/storage/e;

    move-result-object v0

    new-instance v2, Lorg/uoyabause/android/f1;

    invoke-direct {v2, v1, p0}, Lorg/uoyabause/android/f1;-><init>(Ljava/io/File;Le6/p;)V

    invoke-virtual {v0, v2}, Lcom/google/firebase/storage/A;->u(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/firebase/storage/A;

    move-result-object v0

    new-instance v2, Lorg/uoyabause/android/g1;

    invoke-direct {v2, v1, p0}, Lorg/uoyabause/android/g1;-><init>(Ljava/io/File;Le6/p;)V

    invoke-virtual {v0, v2}, Lcom/google/firebase/storage/A;->p(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/firebase/storage/A;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-interface {p0, v0}, Le6/e;->onError(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    return-void
.end method

.method private static final setLoadStateObserver$lambda$20$lambda$18(Ljava/io/File;Le6/p;Lcom/google/firebase/storage/e$a;)V
    .locals 1

    const-string p2, "$emitter"

    invoke-static {p1, p2}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result p2

    if-eqz p2, :cond_0

    sget-object p2, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lorg/uoyabause/android/YabauseRunnable$a;->x(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    goto :goto_0

    :catch_0
    move-exception p0

    goto :goto_1

    :cond_0
    :goto_0
    const-string p0, "OK"

    invoke-interface {p1, p0}, Le6/e;->c(Ljava/lang/Object;)V

    invoke-interface {p1}, Le6/e;->a()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :goto_1
    invoke-interface {p1, p0}, Le6/e;->onError(Ljava/lang/Throwable;)V

    return-void
.end method

.method private static final setLoadStateObserver$lambda$20$lambda$19(Ljava/io/File;Le6/p;Ljava/lang/Exception;)V
    .locals 1

    const-string v0, "$emitter"

    invoke-static {p1, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "exception"

    invoke-static {p2, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    invoke-interface {p1, p2}, Le6/e;->onError(Ljava/lang/Throwable;)V

    return-void
.end method

.method private static final setSaveStateObserver$lambda$17(Le6/p;)V
    .locals 7

    const-string v0, "emitter"

    invoke-static {p0, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {}, Lcom/google/firebase/auth/FirebaseAuth;->getInstance()Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object v0

    const-string v1, "getInstance()"

    invoke-static {v0, v1}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/google/firebase/auth/FirebaseAuth;->g()Lcom/google/firebase/auth/o;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/Exception;

    const-string v1, "not login"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {p0, v0}, Le6/e;->onError(Ljava/lang/Throwable;)V

    return-void

    :cond_0
    sget-object v2, Lorg/uoyabause/android/M1;->m:Lorg/uoyabause/android/M1$g;

    invoke-virtual {v2}, Lorg/uoyabause/android/M1$g;->e()Lorg/uoyabause/android/M1;

    move-result-object v3

    invoke-virtual {v3}, Lorg/uoyabause/android/M1;->z()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {v4}, Lorg/uoyabause/android/YabauseRunnable$a;->m()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_3

    new-instance v6, Ljava/io/File;

    invoke-virtual {v2}, Lorg/uoyabause/android/M1$g;->e()Lorg/uoyabause/android/M1;

    move-result-object v2

    invoke-virtual {v2}, Lorg/uoyabause/android/M1;->z()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v6, v2, v5}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {v6}, Ljava/io/File;->mkdir()Z

    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Lorg/uoyabause/android/YabauseRunnable$a;->H(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-static {v2, v3}, LS6/l;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    invoke-static {}, Lcom/google/firebase/storage/f;->f()Lcom/google/firebase/storage/f;

    move-result-object v3

    invoke-static {v3, v1}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/google/firebase/storage/f;->m()Lcom/google/firebase/storage/l;

    move-result-object v1

    const-string v3, "storage.reference"

    invoke-static {v1, v3}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/google/firebase/auth/o;->H2()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/google/firebase/storage/l;->a(Ljava/lang/String;)Lcom/google/firebase/storage/l;

    move-result-object v0

    const-string v1, "storage_ref.child(user.uid)"

    invoke-static {v0, v1}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "state"

    invoke-virtual {v0, v1}, Lcom/google/firebase/storage/l;->a(Ljava/lang/String;)Lcom/google/firebase/storage/l;

    move-result-object v0

    const-string v1, "base.child(\"state\")"

    invoke-static {v0, v1}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0, v5}, Lcom/google/firebase/storage/l;->a(Ljava/lang/String;)Lcom/google/firebase/storage/l;

    move-result-object v0

    const-string v1, "backup.child(current_gamecode)"

    invoke-static {v0, v1}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz v2, :cond_2

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    :goto_0
    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/firebase/storage/l;->p(Landroid/net/Uri;)Lcom/google/firebase/storage/I;

    move-result-object v0

    const-string v1, "fileref.putFile(file)"

    invoke-static {v0, v1}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v1, Lorg/uoyabause/android/d1;

    invoke-direct {v1, v2, p0}, Lorg/uoyabause/android/d1;-><init>(Ljava/lang/String;Le6/p;)V

    invoke-virtual {v0, v1}, Lcom/google/firebase/storage/A;->p(Lcom/google/android/gms/tasks/OnFailureListener;)Lcom/google/firebase/storage/A;

    move-result-object v0

    new-instance v1, Lorg/uoyabause/android/Yabause$f;

    invoke-direct {v1, v2, p0}, Lorg/uoyabause/android/Yabause$f;-><init>(Ljava/lang/String;Le6/p;)V

    new-instance p0, Lorg/uoyabause/android/e1;

    invoke-direct {p0, v1}, Lorg/uoyabause/android/e1;-><init>(LR6/l;)V

    invoke-virtual {v0, p0}, Lcom/google/firebase/storage/A;->u(Lcom/google/android/gms/tasks/OnSuccessListener;)Lcom/google/firebase/storage/A;

    :cond_3
    return-void
.end method

.method private static final setSaveStateObserver$lambda$17$lambda$15(Ljava/lang/String;Le6/p;Ljava/lang/Exception;)V
    .locals 1

    const-string v0, "$emitter"

    invoke-static {p1, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "exception"

    invoke-static {p2, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    if-eqz p0, :cond_0

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_1

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    :cond_1
    invoke-interface {p1, p2}, Le6/e;->onError(Ljava/lang/Throwable;)V

    return-void
.end method

.method private static final setSaveStateObserver$lambda$17$lambda$16(LR6/l;Ljava/lang/Object;)V
    .locals 1

    const-string v0, "$tmp0"

    invoke-static {p0, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p0, p1}, LR6/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private static final showAutoStateLoadDialog$lambda$0(Ljava/io/File;Ljava/lang/String;)Z
    .locals 3

    const-string p0, "name"

    invoke-static {p1, p0}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p0, 0x2

    const/4 v0, 0x0

    const-string v1, ".yss"

    const/4 v2, 0x0

    invoke-static {p1, v1, v2, p0, v0}, La7/g;->q(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method private static final showAutoStateLoadDialog$lambda$2(Ljava/io/File;Landroidx/appcompat/app/c;Landroid/view/View;)V
    .locals 0

    const-string p2, "$dialog"

    invoke-static {p1, p2}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object p2, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Lorg/uoyabause/android/YabauseRunnable$a;->w(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroidx/appcompat/app/s;->dismiss()V

    return-void
.end method

.method private static final showAutoStateLoadDialog$lambda$3(Ljava/io/File;Landroidx/appcompat/app/c;Landroid/view/View;)V
    .locals 0

    const-string p2, "$dialog"

    invoke-static {p1, p2}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object p2, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Lorg/uoyabause/android/YabauseRunnable$a;->w(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroidx/appcompat/app/s;->dismiss()V

    return-void
.end method

.method private static final showAutoStateLoadDialog$lambda$4(Landroid/widget/Button;Landroid/view/View;Landroid/widget/Button;Landroidx/appcompat/app/c;Landroid/content/DialogInterface;)V
    .locals 1

    const-string p4, "$dialog"

    invoke-static {p3, p4}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p4

    new-instance v0, Lorg/uoyabause/android/Yabause$g;

    invoke-direct {v0, p0, p1, p2, p3}, Lorg/uoyabause/android/Yabause$g;-><init>(Landroid/widget/Button;Landroid/view/View;Landroid/widget/Button;Landroidx/appcompat/app/c;)V

    invoke-virtual {p4, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    return-void
.end method

.method private final showInitFailedDialog(Ljava/lang/String;)V
    .locals 2

    new-instance v0, Landroidx/appcompat/app/c$a;

    invoke-direct {v0, p0}, Landroidx/appcompat/app/c$a;-><init>(Landroid/content/Context;)V

    const v1, 0x7f1300bf

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/c$a;->u(Ljava/lang/CharSequence;)Landroidx/appcompat/app/c$a;

    invoke-virtual {v0, p1}, Landroidx/appcompat/app/c$a;->h(Ljava/lang/CharSequence;)Landroidx/appcompat/app/c$a;

    const-string v1, "Yabause"

    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-instance p1, Lorg/uoyabause/android/w1;

    invoke-direct {p1, p0}, Lorg/uoyabause/android/w1;-><init>(Lorg/uoyabause/android/Yabause;)V

    const v1, 0x7f130229

    invoke-virtual {v0, v1, p1}, Landroidx/appcompat/app/c$a;->p(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/c$a;

    new-instance p1, Lorg/uoyabause/android/x1;

    invoke-direct {p1, p0}, Lorg/uoyabause/android/x1;-><init>(Lorg/uoyabause/android/Yabause;)V

    invoke-virtual {v0, p1}, Landroidx/appcompat/app/c$a;->m(Landroid/content/DialogInterface$OnCancelListener;)Landroidx/appcompat/app/c$a;

    invoke-virtual {v0}, Landroidx/appcompat/app/c$a;->w()Landroidx/appcompat/app/c;

    return-void
.end method

.method private static final showInitFailedDialog$lambda$5(Lorg/uoyabause/android/Yabause;Landroid/content/DialogInterface;I)V
    .locals 0

    const-string p1, "this$0"

    invoke-static {p0, p1}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method private static final showInitFailedDialog$lambda$6(Lorg/uoyabause/android/Yabause;Landroid/content/DialogInterface;)V
    .locals 0

    const/4 p1, 0x0

    sget-object p1, Ln6/YD/JCyklmEWtIo;->enZBJqNU:Ljava/lang/String;

    invoke-static {p0, p1}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method private final signInSilently()V
    .locals 2

    const-string v0, "Yabause"

    const-string v1, "signInSilently()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->googleSignInClient:Lcom/google/android/gms/auth/api/signin/b;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/google/android/gms/auth/api/signin/b;->f()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Lorg/uoyabause/android/i1;

    invoke-direct {v1}, Lorg/uoyabause/android/i1;-><init>()V

    invoke-virtual {v0, p0, v1}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Landroid/app/Activity;Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    :cond_0
    return-void
.end method

.method private static final signInSilently$lambda$11(Lcom/google/android/gms/tasks/Task;)V
    .locals 2

    const/4 v0, 0x0

    sget-object v0, Lcom/google/common/collect/NAMW/KfzoMwVGs;->RGFmjn:Ljava/lang/String;

    invoke-static {p0, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v0

    const-string v1, "Yabause"

    if-eqz v0, :cond_0

    const-string p0, "signInSilently(): success"

    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    const-string v0, "signInSilently(): failure"

    invoke-virtual {p0}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p0

    invoke-static {v1, v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method private final toggleMenu()V
    .locals 8

    iget-boolean v0, p0, Lorg/uoyabause/android/Yabause;->menu_showing:Z

    const v1, 0x800003

    const/4 v2, 0x0

    const-string v3, "drawerLayout"

    const/4 v4, 0x1

    if-ne v0, v4, :cond_3

    invoke-static {p0}, Landroidx/preference/k;->b(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const v5, 0x7f0a01cd

    invoke-virtual {p0, v5}, Landroidx/appcompat/app/d;->findViewById(I)Landroid/view/View;

    move-result-object v5

    if-nez v5, :cond_0

    goto :goto_0

    :cond_0
    const-string v6, "pref_pad_trans"

    const v7, 0x3f333333    # 0.7f

    invoke-interface {v0, v6, v7}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v0

    invoke-virtual {v5, v0}, Landroid/view/View;->setAlpha(F)V

    :goto_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/uoyabause/android/Yabause;->menu_showing:Z

    const v0, 0x7f0a03b7

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/d;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const-string v5, "null cannot be cast to non-null type android.view.View"

    invoke-static {v0, v5}, LS6/l;->c(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    sget-object v0, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {v0}, Lorg/uoyabause/android/YabauseRunnable$a;->F()V

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->audio:Lorg/uoyabause/android/F1;

    if-eqz v0, :cond_1

    invoke-virtual {v0, v4}, Lorg/uoyabause/android/F1;->b(I)V

    :cond_1
    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->drawerLayout:Landroidx/drawerlayout/widget/DrawerLayout;

    if-nez v0, :cond_2

    invoke-static {v3}, LS6/l;->p(Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    move-object v2, v0

    :goto_1
    invoke-virtual {v2, v1}, Landroidx/drawerlayout/widget/DrawerLayout;->d(I)V

    goto :goto_3

    :cond_3
    iput-boolean v4, p0, Lorg/uoyabause/android/Yabause;->menu_showing:Z

    sget-object v0, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {v0}, Lorg/uoyabause/android/YabauseRunnable$a;->A()V

    iget-object v5, p0, Lorg/uoyabause/android/Yabause;->audio:Lorg/uoyabause/android/F1;

    if-eqz v5, :cond_4

    invoke-virtual {v5, v4}, Lorg/uoyabause/android/F1;->a(I)V

    :cond_4
    const v4, 0x7f0a023e

    invoke-virtual {p0, v4}, Landroidx/appcompat/app/d;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    if-eqz v4, :cond_5

    invoke-virtual {v0}, Lorg/uoyabause/android/YabauseRunnable$a;->q()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_5
    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->drawerLayout:Landroidx/drawerlayout/widget/DrawerLayout;

    if-nez v0, :cond_6

    invoke-static {v3}, LS6/l;->p(Ljava/lang/String;)V

    goto :goto_2

    :cond_6
    move-object v2, v0

    :goto_2
    invoke-virtual {v2, v1}, Landroidx/drawerlayout/widget/DrawerLayout;->K(I)V

    :goto_3
    return-void
.end method


# virtual methods
.method public final cancelReportCurrentGame()V
    .locals 3

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->scope:Lc7/J;

    invoke-interface {v0}, Lc7/J;->A()LJ6/g;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {v0, v1, v2, v1}, Lc7/x0;->f(LJ6/g;Ljava/util/concurrent/CancellationException;ILjava/lang/Object;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    sget-object v0, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {v0}, Lorg/uoyabause/android/YabauseRunnable$a;->F()V

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->audio:Lorg/uoyabause/android/F1;

    if-eqz v0, :cond_0

    invoke-virtual {v0, v2}, Lorg/uoyabause/android/F1;->b(I)V

    :cond_0
    return-void
.end method

.method public final cancelStateLoad()V
    .locals 2

    iget-boolean v0, p0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    iput-boolean v0, p0, Lorg/uoyabause/android/Yabause;->menu_showing:Z

    const v0, 0x7f0a03b7

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/d;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const-string v1, "null cannot be cast to non-null type android.view.View"

    invoke-static {v0, v1}, LS6/l;->c(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    sget-object v0, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {v0}, Lorg/uoyabause/android/YabauseRunnable$a;->F()V

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->audio:Lorg/uoyabause/android/F1;

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/uoyabause/android/F1;->b(I)V

    :cond_0
    return-void
.end method

.method public final dismissDialog()V
    .locals 5

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->progressBar:Landroid/view/View;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "progressBar"

    invoke-static {v0}, LS6/l;->p(Ljava/lang/String;)V

    move-object v0, v1

    :cond_0
    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    iget v0, p0, Lorg/uoyabause/android/Yabause;->_report_status:I

    const/4 v2, -0x3

    const-string v3, "drawerLayout"

    const/4 v4, -0x1

    if-eq v0, v2, :cond_9

    const/4 v2, -0x2

    if-eq v0, v2, :cond_7

    if-eq v0, v4, :cond_5

    if-eqz v0, :cond_3

    const/4 v2, 0x1

    if-eq v0, v2, :cond_1

    goto/16 :goto_5

    :cond_1
    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->drawerLayout:Landroidx/drawerlayout/widget/DrawerLayout;

    if-nez v0, :cond_2

    invoke-static {v3}, LS6/l;->p(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    move-object v1, v0

    :goto_0
    const-string v0, "Success to send your report. Thank you for your collaboration."

    invoke-static {v1, v0, v4}, Lcom/google/android/material/snackbar/Snackbar;->k0(Landroid/view/View;Ljava/lang/CharSequence;I)Lcom/google/android/material/snackbar/Snackbar;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/material/snackbar/Snackbar;->V()V

    goto :goto_5

    :cond_3
    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->drawerLayout:Landroidx/drawerlayout/widget/DrawerLayout;

    if-nez v0, :cond_4

    invoke-static {v3}, LS6/l;->p(Ljava/lang/String;)V

    goto :goto_1

    :cond_4
    move-object v1, v0

    :goto_1
    const-string v0, "Fail to send your report. internal error"

    invoke-static {v1, v0, v4}, Lcom/google/android/material/snackbar/Snackbar;->k0(Landroid/view/View;Ljava/lang/CharSequence;I)Lcom/google/android/material/snackbar/Snackbar;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/material/snackbar/Snackbar;->V()V

    goto :goto_5

    :cond_5
    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->drawerLayout:Landroidx/drawerlayout/widget/DrawerLayout;

    if-nez v0, :cond_6

    invoke-static {v3}, LS6/l;->p(Ljava/lang/String;)V

    goto :goto_2

    :cond_6
    move-object v1, v0

    :goto_2
    const-string v0, "Fail to send your report. You\'ve sent a report for same game, same device and same vesion."

    invoke-static {v1, v0, v4}, Lcom/google/android/material/snackbar/Snackbar;->k0(Landroid/view/View;Ljava/lang/CharSequence;I)Lcom/google/android/material/snackbar/Snackbar;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/material/snackbar/Snackbar;->V()V

    goto :goto_5

    :cond_7
    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->drawerLayout:Landroidx/drawerlayout/widget/DrawerLayout;

    if-nez v0, :cond_8

    invoke-static {v3}, LS6/l;->p(Ljava/lang/String;)V

    goto :goto_3

    :cond_8
    move-object v1, v0

    :goto_3
    const-string v0, "Fail to send your report. Server is down."

    invoke-static {v1, v0, v4}, Lcom/google/android/material/snackbar/Snackbar;->k0(Landroid/view/View;Ljava/lang/CharSequence;I)Lcom/google/android/material/snackbar/Snackbar;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/material/snackbar/Snackbar;->V()V

    goto :goto_5

    :cond_9
    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->drawerLayout:Landroidx/drawerlayout/widget/DrawerLayout;

    if-nez v0, :cond_a

    invoke-static {v3}, LS6/l;->p(Ljava/lang/String;)V

    goto :goto_4

    :cond_a
    move-object v1, v0

    :goto_4
    const-string v0, "Fail to send your report. Authorizing is failed."

    invoke-static {v1, v0, v4}, Lcom/google/android/material/snackbar/Snackbar;->k0(Landroid/view/View;Ljava/lang/CharSequence;I)Lcom/google/android/material/snackbar/Snackbar;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/material/snackbar/Snackbar;->V()V

    :goto_5
    invoke-direct {p0}, Lorg/uoyabause/android/Yabause;->toggleMenu()V

    return-void
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 5

    const-string v0, "event"

    invoke-static {p1, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    const/4 v2, 0x4

    const/4 v3, 0x1

    if-ne v1, v2, :cond_7

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_6

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result p1

    if-nez p1, :cond_6

    invoke-virtual {p0}, Landroidx/fragment/app/j;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object p1

    sget-object v0, Lorg/uoyabause/android/k0;->z0:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroidx/fragment/app/w;->h0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object p1

    check-cast p1, Lorg/uoyabause/android/k0;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lorg/uoyabause/android/k0;->M2()V

    return v3

    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/j;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object p1

    const-string v0, "StateListFragment"

    invoke-virtual {p1, v0}, Landroidx/fragment/app/w;->h0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object p1

    const v0, 0x7f0a03b7

    const-string v1, "supportFragmentManager.beginTransaction()"

    const/4 v2, 0x0

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Landroidx/fragment/app/j;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v4

    invoke-virtual {v4}, Landroidx/fragment/app/w;->o()Landroidx/fragment/app/F;

    move-result-object v4

    invoke-static {v4, v1}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Landroidx/fragment/app/F;->p(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/F;

    invoke-virtual {v4}, Landroidx/fragment/app/F;->j()I

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/d;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/view/View;->setActivated(Z)V

    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    iput-boolean v2, p0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    iput-boolean v2, p0, Lorg/uoyabause/android/Yabause;->menu_showing:Z

    sget-object p1, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {p1}, Lorg/uoyabause/android/YabauseRunnable$a;->F()V

    iget-object p1, p0, Lorg/uoyabause/android/Yabause;->audio:Lorg/uoyabause/android/F1;

    if-eqz p1, :cond_1

    invoke-virtual {p1, v3}, Lorg/uoyabause/android/F1;->b(I)V

    :cond_1
    return v3

    :cond_2
    invoke-virtual {p0}, Landroidx/fragment/app/j;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object p1

    const-string v4, "TabBackupFragment"

    invoke-virtual {p1, v4}, Landroidx/fragment/app/w;->h0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object p1

    if-eqz p1, :cond_4

    invoke-virtual {p0}, Landroidx/fragment/app/j;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v4

    invoke-virtual {v4}, Landroidx/fragment/app/w;->o()Landroidx/fragment/app/F;

    move-result-object v4

    invoke-static {v4, v1}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Landroidx/fragment/app/F;->p(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/F;

    invoke-virtual {v4}, Landroidx/fragment/app/F;->j()I

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/d;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, v3}, Landroid/view/View;->setActivated(Z)V

    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    iput-boolean v2, p0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    iput-boolean v2, p0, Lorg/uoyabause/android/Yabause;->menu_showing:Z

    sget-object p1, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {p1}, Lorg/uoyabause/android/YabauseRunnable$a;->F()V

    iget-object p1, p0, Lorg/uoyabause/android/Yabause;->audio:Lorg/uoyabause/android/F1;

    if-eqz p1, :cond_3

    invoke-virtual {p1, v3}, Lorg/uoyabause/android/F1;->b(I)V

    :cond_3
    return v3

    :cond_4
    invoke-virtual {p0}, Landroidx/fragment/app/j;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object p1

    const-string v0, "PadTestFragment"

    invoke-virtual {p1, v0}, Landroidx/fragment/app/w;->h0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object p1

    check-cast p1, Lorg/uoyabause/android/C0;

    if-eqz p1, :cond_5

    invoke-virtual {p1}, Lorg/uoyabause/android/C0;->w2()V

    return v3

    :cond_5
    invoke-direct {p0}, Lorg/uoyabause/android/Yabause;->toggleMenu()V

    :cond_6
    return v3

    :cond_7
    iget-boolean v2, p0, Lorg/uoyabause/android/Yabause;->menu_showing:Z

    if-eqz v2, :cond_8

    invoke-super {p0, p1}, Landroidx/appcompat/app/d;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1

    :cond_8
    iget-boolean v2, p0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    if-eqz v2, :cond_9

    invoke-super {p0, p1}, Landroidx/appcompat/app/d;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1

    :cond_9
    const/4 v2, 0x0

    const-string v4, "padManager"

    if-ne v0, v3, :cond_c

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v0, :cond_a

    invoke-static {v4}, LS6/l;->p(Ljava/lang/String;)V

    goto :goto_0

    :cond_a
    move-object v2, v0

    :goto_0
    invoke-virtual {v2, v1, p1}, Lorg/uoyabause/android/x0;->q(ILandroid/view/KeyEvent;)I

    move-result v0

    sget-object v1, Lorg/uoyabause/android/x0;->d:Lorg/uoyabause/android/x0$a;

    invoke-virtual {v1}, Lorg/uoyabause/android/x0$a;->d()I

    move-result v2

    if-ne v0, v2, :cond_b

    invoke-direct {p0}, Lorg/uoyabause/android/Yabause;->toggleMenu()V

    :cond_b
    invoke-virtual {v1}, Lorg/uoyabause/android/x0$a;->b()I

    move-result v1

    if-eq v0, v1, :cond_e

    return v3

    :cond_c
    if-nez v0, :cond_e

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_e

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v0, :cond_d

    invoke-static {v4}, LS6/l;->p(Ljava/lang/String;)V

    goto :goto_1

    :cond_d
    move-object v2, v0

    :goto_1
    invoke-virtual {v2, v1, p1}, Lorg/uoyabause/android/x0;->p(ILandroid/view/KeyEvent;)I

    move-result v0

    sget-object v1, Lorg/uoyabause/android/x0;->d:Lorg/uoyabause/android/x0$a;

    invoke-virtual {v1}, Lorg/uoyabause/android/x0$a;->b()I

    move-result v1

    if-eq v0, v1, :cond_e

    return v3

    :cond_e
    invoke-super {p0, p1}, Landroidx/appcompat/app/d;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public final doReportCurrentGame(ILjava/lang/String;Z)V
    .locals 9

    const-string v0, "Yabause"

    new-instance v5, Lorg/uoyabause/android/Yabause$b;

    invoke-direct {v5, p0}, Lorg/uoyabause/android/Yabause$b;-><init>(Lorg/uoyabause/android/Yabause;)V

    iput p1, v5, Lorg/uoyabause/android/Yabause$b;->a:I

    iput-object p2, v5, Lorg/uoyabause/android/Yabause$b;->b:Ljava/lang/String;

    iput-boolean p3, v5, Lorg/uoyabause/android/Yabause$b;->c:Z

    const/4 p1, 0x0

    iput p1, p0, Lorg/uoyabause/android/Yabause;->_report_status:I

    sget-object p2, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {p2}, Lorg/uoyabause/android/YabauseRunnable$a;->r()Ljava/lang/String;

    move-result-object p3

    if-nez p3, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lorg/uoyabause/android/Yabause;->showDialog()V

    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "_yyyy_MM_dd_HH_mm_ss"

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    sget-object v3, Lorg/uoyabause/android/M1;->m:Lorg/uoyabause/android/M1$g;

    invoke-virtual {v3}, Lorg/uoyabause/android/M1$g;->e()Lorg/uoyabause/android/M1;

    move-result-object v4

    invoke-virtual {v4}, Lorg/uoyabause/android/M1;->x()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2}, Lorg/uoyabause/android/YabauseRunnable$a;->m()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ".zip"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3}, Lorg/uoyabause/android/M1$g;->e()Lorg/uoyabause/android/M1;

    move-result-object v1

    invoke-virtual {v1}, Lorg/uoyabause/android/M1;->x()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "screenshot.png"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2, v6}, Lorg/uoyabause/android/YabauseRunnable$a;->I(Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lorg/uoyabause/android/Yabause;->dismissDialog()V

    return-void

    :cond_1
    invoke-virtual {v3}, Lorg/uoyabause/android/M1$g;->e()Lorg/uoyabause/android/M1;

    move-result-object v1

    invoke-virtual {v1}, Lorg/uoyabause/android/M1;->z()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Lorg/uoyabause/android/YabauseRunnable$a;->m()Ljava/lang/String;

    move-result-object v2

    const/4 v7, 0x0

    if-eqz v2, :cond_2

    new-instance v8, Ljava/io/File;

    invoke-virtual {v3}, Lorg/uoyabause/android/M1$g;->e()Lorg/uoyabause/android/M1;

    move-result-object v3

    invoke-virtual {v3}, Lorg/uoyabause/android/M1;->z()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v8, v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    move-object v8, v7

    :goto_0
    if-eqz v8, :cond_3

    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_3

    invoke-virtual {v8}, Ljava/io/File;->mkdir()Z

    :cond_3
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Lorg/uoyabause/android/YabauseRunnable$a;->G(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_4

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    goto :goto_1

    :cond_4
    move-object v1, v7

    :goto_1
    filled-new-array {v1}, [Ljava/io/File;

    move-result-object p2

    :try_start_0
    new-instance v1, Ljava/util/zip/ZipOutputStream;

    new-instance v2, Ljava/io/BufferedOutputStream;

    new-instance v3, Ljava/io/FileOutputStream;

    new-instance v8, Ljava/io/File;

    invoke-direct {v8, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v8}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v1, v2}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-direct {p0, v1, p2}, Lorg/uoyabause/android/Yabause;->createZip(Ljava/util/zip/ZipOutputStream;[Ljava/io/File;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {v1}, LG7/h;->a(Ljava/io/Closeable;)V

    aget-object p1, p2, p1

    invoke-static {p1}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    :try_start_2
    new-instance p1, Lorg/uoyabause/android/f;

    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2, p3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    move-object v1, p1

    move-object v2, p0

    move-object v3, v6

    move-object v6, p2

    invoke-direct/range {v1 .. v6}, Lorg/uoyabause/android/f;-><init>(Lorg/uoyabause/android/Yabause;Ljava/lang/String;Ljava/lang/String;Lorg/uoyabause/android/Yabause$b;Lorg/json/JSONObject;)V

    const-string p2, "https://www.uoyabause.org/api/"

    iget-object v1, p0, Lorg/uoyabause/android/Yabause;->scope:Lc7/J;

    new-instance v4, Lorg/uoyabause/android/Yabause$c;

    invoke-direct {v4, p1, p2, v7}, Lorg/uoyabause/android/Yabause$c;-><init>(Lorg/uoyabause/android/f;Ljava/lang/String;LJ6/d;)V

    const/4 v5, 0x3

    const/4 v6, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static/range {v1 .. v6}, Lc7/i;->d(Lc7/J;LJ6/g;Lc7/L;LR6/p;ILjava/lang/Object;)Lc7/u0;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    return-void

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lorg/uoyabause/android/Yabause;->dismissDialog()V

    return-void

    :catchall_0
    move-exception p1

    move-object v7, v1

    goto :goto_3

    :catch_1
    move-exception p1

    move-object v7, v1

    goto :goto_2

    :catchall_1
    move-exception p1

    goto :goto_3

    :catch_2
    move-exception p1

    :goto_2
    :try_start_3
    invoke-virtual {p1}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lorg/uoyabause/android/Yabause;->dismissDialog()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    invoke-static {v7}, LG7/h;->a(Ljava/io/Closeable;)V

    return-void

    :goto_3
    invoke-static {v7}, LG7/h;->a(Ljava/io/Closeable;)V

    throw p1
.end method

.method public final errorMsg(Ljava/lang/String;)V
    .locals 2

    const-string v0, "msg"

    invoke-static {p1, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "errorMsg "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Yabause"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lorg/uoyabause/android/l1;

    invoke-direct {v0, p0, p1}, Lorg/uoyabause/android/l1;-><init>(Lorg/uoyabause/android/Yabause;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public fileSelected(Ljava/io/File;)V
    .locals 0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/uoyabause/android/Yabause;->gamePath:Ljava/lang/String;

    sget-object p1, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {p1}, Lorg/uoyabause/android/YabauseRunnable$a;->b()V

    :cond_0
    return-void
.end method

.method public final getBiosPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->biosPath:Ljava/lang/String;

    return-object v0
.end method

.method public final getCartridgePath()Ljava/lang/String;
    .locals 3

    sget-object v0, Lorg/uoyabause/android/M1;->m:Lorg/uoyabause/android/M1$g;

    invoke-virtual {v0}, Lorg/uoyabause/android/M1$g;->e()Lorg/uoyabause/android/M1;

    move-result-object v0

    sget-object v1, Lorg/uoyabause/android/r;->a:Lorg/uoyabause/android/r;

    iget v2, p0, Lorg/uoyabause/android/Yabause;->cartridgeType:I

    invoke-virtual {v1, v2}, Lorg/uoyabause/android/r;->a(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/uoyabause/android/M1;->p(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getCartridgeType()I
    .locals 1

    iget v0, p0, Lorg/uoyabause/android/Yabause;->cartridgeType:I

    return v0
.end method

.method public final getCheat_codes()[Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->cheat_codes:[Ljava/lang/String;

    return-object v0
.end method

.method public final getCurrentDocumentUri()Landroid/net/Uri;
    .locals 1

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->currentDocumentUri:Landroid/net/Uri;

    return-object v0
.end method

.method public final getCurrentGame()Lf8/a;
    .locals 1

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->currentGame:Lf8/a;

    return-object v0
.end method

.method public final getFileDescriptorPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    :cond_0
    const-string v1, "UTF-8"

    invoke-static {p1, v1}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v1, "decode(fileName, \"UTF-8\")"

    invoke-static {p1, v1}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v1, p0, Lorg/uoyabause/android/Yabause;->currentDocumentUri:Landroid/net/Uri;

    if-nez v1, :cond_1

    return-object v0

    :cond_1
    sget-object v1, Lorg/uoyabause/android/YabauseApplication;->c:Lorg/uoyabause/android/YabauseApplication$a;

    invoke-virtual {v1}, Lorg/uoyabause/android/YabauseApplication$a;->b()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lorg/uoyabause/android/Yabause;->currentDocumentUri:Landroid/net/Uri;

    invoke-static {v2}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-static {v1, v2}, LT/a;->b(Landroid/content/Context;Landroid/net/Uri;)LT/a;

    move-result-object v1

    if-nez v1, :cond_2

    return-object v0

    :cond_2
    invoke-virtual {v1, p1}, LT/a;->a(Ljava/lang/String;)LT/a;

    move-result-object p1

    if-nez p1, :cond_3

    return-object v0

    :cond_3
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {p1}, LT/a;->d()Landroid/net/Uri;

    move-result-object p1

    const-string v2, "r"

    invoke-virtual {v1, p1, v2}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object p1

    if-eqz p1, :cond_4

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->subFileDescripters:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->getFd()I

    move-result p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/proc/self/fd/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_4
    return-object v0
.end method

.method public final getGamePath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->gamePath:Ljava/lang/String;

    return-object v0
.end method

.method public final getLoginEmitter()Le6/p;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Le6/p;"
        }
    .end annotation

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->loginEmitter:Le6/p;

    return-object v0
.end method

.method public final getMParcelFileDescriptor()Landroid/os/ParcelFileDescriptor;
    .locals 1

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->mParcelFileDescriptor:Landroid/os/ParcelFileDescriptor;

    return-object v0
.end method

.method public final getMemoryPath()Ljava/lang/String;
    .locals 2

    sget-object v0, Lorg/uoyabause/android/M1;->m:Lorg/uoyabause/android/M1$g;

    invoke-virtual {v0}, Lorg/uoyabause/android/M1$g;->e()Lorg/uoyabause/android/M1;

    move-result-object v0

    const-string v1, "memory.ram"

    invoke-virtual {v0, v1}, Lorg/uoyabause/android/M1;->u(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getPlayer2InputDevice()I
    .locals 1

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v0, :cond_0

    const-string v0, "padManager"

    invoke-static {v0}, LS6/l;->p(Ljava/lang/String;)V

    const/4 v0, 0x0

    :cond_0
    invoke-virtual {v0}, Lorg/uoyabause/android/x0;->l()I

    move-result v0

    return v0
.end method

.method public final getScope()Lc7/J;
    .locals 1

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->scope:Lc7/J;

    return-object v0
.end method

.method public final getShaderPath()Ljava/lang/String;
    .locals 1

    sget-object v0, Lorg/uoyabause/android/M1;->m:Lorg/uoyabause/android/M1$g;

    invoke-virtual {v0}, Lorg/uoyabause/android/M1$g;->e()Lorg/uoyabause/android/M1;

    move-result-object v0

    invoke-virtual {v0}, Lorg/uoyabause/android/M1;->y()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getSubFileDescripters()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/os/ParcelFileDescriptor;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->subFileDescripters:Ljava/util/List;

    return-object v0
.end method

.method public final getTestPath()Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->testCase:Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    sget-object v0, Lorg/uoyabause/android/M1;->m:Lorg/uoyabause/android/M1$g;

    invoke-virtual {v0}, Lorg/uoyabause/android/M1$g;->e()Lorg/uoyabause/android/M1;

    move-result-object v0

    invoke-virtual {v0}, Lorg/uoyabause/android/M1;->v()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lorg/uoyabause/android/Yabause;->testCase:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public final getVideoInterface()I
    .locals 1

    iget v0, p0, Lorg/uoyabause/android/Yabause;->videoInterface:I

    return v0
.end method

.method public final loadState(Ljava/lang/String;)V
    .locals 3

    sget-object v0, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {v0, p1}, Lorg/uoyabause/android/YabauseRunnable$a;->w(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroidx/fragment/app/j;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object p1

    const-string v1, "StateListFragment"

    invoke-virtual {p1, v1}, Landroidx/fragment/app/w;->h0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Landroidx/fragment/app/j;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/fragment/app/w;->o()Landroidx/fragment/app/F;

    move-result-object v1

    const-string v2, "supportFragmentManager.beginTransaction()"

    invoke-static {v1, v2}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Landroidx/fragment/app/F;->p(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/F;

    invoke-virtual {v1}, Landroidx/fragment/app/F;->j()I

    :cond_0
    iget-boolean p1, p0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    if-eqz p1, :cond_1

    const/4 p1, 0x0

    iput-boolean p1, p0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    iput-boolean p1, p0, Lorg/uoyabause/android/Yabause;->menu_showing:Z

    const p1, 0x7f0a03b7

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/d;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const-string v1, "null cannot be cast to non-null type android.view.View"

    invoke-static {p1, v1}, LS6/l;->c(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    invoke-virtual {v0}, Lorg/uoyabause/android/YabauseRunnable$a;->F()V

    iget-object p1, p0, Lorg/uoyabause/android/Yabause;->audio:Lorg/uoyabause/android/F1;

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lorg/uoyabause/android/F1;->b(I)V

    :cond_1
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 5

    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/j;->onActivityResult(IILandroid/content/Intent;)V

    iget v0, p0, Lorg/uoyabause/android/Yabause;->OPEN_FILE:I

    const/4 v1, -0x1

    if-ne p1, v0, :cond_5

    const-string p1, "Failed to Open file"

    const/4 v0, 0x0

    const-string v2, "drawerLayout"

    if-ne p2, v1, :cond_3

    if-eqz p3, :cond_3

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p2

    if-eqz p2, :cond_3

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v3

    invoke-static {v3}, LS6/l;->b(Ljava/lang/Object;)V

    const-string v4, "r"

    invoke-virtual {p2, v3, v4}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object p2

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Landroid/os/ParcelFileDescriptor;->getFd()I

    move-result p1

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/proc/self/fd/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ";"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/uoyabause/android/Yabause;->gamePath:Ljava/lang/String;

    iget-object p1, p0, Lorg/uoyabause/android/Yabause;->mParcelFileDescriptor:Landroid/os/ParcelFileDescriptor;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->close()V

    :cond_0
    iput-object p2, p0, Lorg/uoyabause/android/Yabause;->mParcelFileDescriptor:Landroid/os/ParcelFileDescriptor;

    goto :goto_2

    :cond_1
    iget-object p2, p0, Lorg/uoyabause/android/Yabause;->drawerLayout:Landroidx/drawerlayout/widget/DrawerLayout;

    if-nez p2, :cond_2

    invoke-static {v2}, LS6/l;->p(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    move-object v0, p2

    :goto_0
    invoke-static {v0, p1, v1}, Lcom/google/android/material/snackbar/Snackbar;->k0(Landroid/view/View;Ljava/lang/CharSequence;I)Lcom/google/android/material/snackbar/Snackbar;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/material/snackbar/Snackbar;->V()V

    goto :goto_2

    :cond_3
    iget-object p2, p0, Lorg/uoyabause/android/Yabause;->drawerLayout:Landroidx/drawerlayout/widget/DrawerLayout;

    if-nez p2, :cond_4

    invoke-static {v2}, LS6/l;->p(Ljava/lang/String;)V

    goto :goto_1

    :cond_4
    move-object v0, p2

    :goto_1
    invoke-static {v0, p1, v1}, Lcom/google/android/material/snackbar/Snackbar;->k0(Landroid/view/View;Ljava/lang/CharSequence;I)Lcom/google/android/material/snackbar/Snackbar;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/material/snackbar/Snackbar;->V()V

    :goto_2
    sget-object p1, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {p1}, Lorg/uoyabause/android/YabauseRunnable$a;->b()V

    goto :goto_3

    :cond_5
    iget v0, p0, Lorg/uoyabause/android/Yabause;->MENU_ID_LEADERBOARD:I

    const/4 v2, 0x0

    if-ne p1, v0, :cond_6

    iput-boolean v2, p0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    invoke-direct {p0}, Lorg/uoyabause/android/Yabause;->toggleMenu()V

    goto :goto_3

    :cond_6
    const/4 v0, 0x1

    if-ne p1, v0, :cond_7

    iput-boolean v2, p0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    invoke-direct {p0}, Lorg/uoyabause/android/Yabause;->toggleMenu()V

    goto :goto_3

    :cond_7
    iget v0, p0, Lorg/uoyabause/android/Yabause;->returnCodeSignIn:I

    if-ne p1, v0, :cond_9

    if-ne p1, v0, :cond_9

    invoke-static {p3}, Lw1/e;->i(Landroid/content/Intent;)Lw1/e;

    move-result-object p1

    if-ne p2, v1, :cond_8

    invoke-static {}, Lcom/google/firebase/auth/FirebaseAuth;->getInstance()Lcom/google/firebase/auth/FirebaseAuth;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/firebase/auth/FirebaseAuth;->g()Lcom/google/firebase/auth/o;

    move-result-object p1

    iget-object p2, p0, Lorg/uoyabause/android/Yabause;->loginEmitter:Le6/p;

    if-eqz p2, :cond_9

    invoke-static {p2}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-static {p1}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-interface {p2, p1}, Le6/e;->c(Ljava/lang/Object;)V

    iget-object p1, p0, Lorg/uoyabause/android/Yabause;->loginEmitter:Le6/p;

    invoke-static {p1}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-interface {p1}, Le6/e;->a()V

    goto :goto_3

    :cond_8
    iget-object p2, p0, Lorg/uoyabause/android/Yabause;->loginEmitter:Le6/p;

    if-eqz p2, :cond_9

    invoke-static {p2}, LS6/l;->b(Ljava/lang/Object;)V

    new-instance p3, Ljava/lang/Exception;

    invoke-static {p1}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lw1/e;->l()Lcom/firebase/ui/auth/FirebaseUiException;

    move-result-object p1

    invoke-static {p1}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-virtual {p1}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p3, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-interface {p2, p3}, Le6/e;->onError(Ljava/lang/Throwable;)V

    :cond_9
    :goto_3
    return-void
.end method

.method public onBackPressed()V
    .locals 2

    invoke-virtual {p0}, Landroidx/fragment/app/j;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    const-string v1, "PadTestFragment"

    invoke-virtual {v0, v1}, Landroidx/fragment/app/w;->h0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lorg/uoyabause/android/C0;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/uoyabause/android/C0;->w2()V

    :cond_0
    invoke-virtual {p0}, Landroidx/fragment/app/j;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    sget-object v1, Lorg/uoyabause/android/k0;->z0:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroidx/fragment/app/w;->h0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lorg/uoyabause/android/k0;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lorg/uoyabause/android/k0;->M2()V

    :cond_1
    return-void
.end method

.method public final onBackupWrite([B[B)V
    .locals 4

    const-string v0, "before"

    invoke-static {p1, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "after"

    invoke-static {p2, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    const-class v0, Lorg/uoyabause/android/Yabause;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    array-length v1, p1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onBackupWrite "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->currentGame:Lf8/a;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2}, Lf8/a;->c([B[B)V

    :cond_0
    return-void
.end method

.method public onCancel()V
    .locals 3

    invoke-virtual {p0}, Landroidx/fragment/app/j;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    const-string v1, "PadTestFragment"

    invoke-virtual {v0, v1}, Landroidx/fragment/app/w;->h0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lorg/uoyabause/android/C0;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroidx/fragment/app/j;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/fragment/app/w;->o()Landroidx/fragment/app/F;

    move-result-object v1

    const-string v2, "supportFragmentManager.beginTransaction()"

    invoke-static {v1, v2}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Landroidx/fragment/app/F;->p(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/F;

    invoke-virtual {v1}, Landroidx/fragment/app/F;->j()I

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    invoke-direct {p0}, Lorg/uoyabause/android/Yabause;->toggleMenu()V

    return-void
.end method

.method public onCancel(I)V
    .locals 0

    const/4 p1, 0x0

    iput-boolean p1, p0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    invoke-direct {p0}, Lorg/uoyabause/android/Yabause;->toggleMenu()V

    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    const-string v0, "_newConfig"

    invoke-static {p1, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    iget v0, p1, Landroid/content/res/Configuration;->orientation:I

    invoke-virtual {p0, v0}, Lorg/uoyabause/android/Yabause;->updateViewLayout(I)V

    invoke-super {p0, p1}, Landroidx/appcompat/app/d;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    invoke-super {p0, p1}, Landroidx/fragment/app/j;->onCreate(Landroid/os/Bundle;)V
    invoke-direct {p0}, Lorg/uoyabause/android/Yabause;->getYabaPath()Ljava/lang/String;
    move-result-object v0
    new-instance v1, Ljava/io/File;
    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z
    move-result v1
    if-eqz v1, :cond_continue
    #invoke-direct {p0}, Lorg/uoyabause/android/Yabause;->startRetroArch()V
    const-string v2, "Yabause"
    invoke-direct {p0, v2}, Lorg/uoyabause/android/Yabause;->logQuick(Ljava/lang/String;)V
    invoke-virtual {p0}, Lorg/uoyabause/android/Yabause;->finish()V
    return-void

    :cond_continue
    const-string v2, "Yabause"
    invoke-direct {p0, v2}, Lorg/uoyabause/android/Yabause;->logQuick(Ljava/lang/String;)V
    invoke-direct {p0, p1}, Lorg/uoyabause/android/Yabause;->onCreate2(Landroid/os/Bundle;)V
    return-void
.end method

.method public onCreate2(Landroid/os/Bundle;)V
    .locals 19

    move-object/from16 v1, p0

    #invoke-super/range {p0 .. p1}, Landroidx/fragment/app/j;->onCreate(Landroid/os/Bundle;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    iput-wide v2, v1, Lorg/uoyabause/android/Yabause;->startTime:J

    new-instance v0, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$a;

    sget-object v2, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;->w:Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;

    invoke-direct {v0, v2}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$a;-><init>(Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;)V

    invoke-virtual {v0}, Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions$a;->a()Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/google/android/gms/auth/api/signin/a;->a(Landroid/app/Activity;Lcom/google/android/gms/auth/api/signin/GoogleSignInOptions;)Lcom/google/android/gms/auth/api/signin/b;

    move-result-object v0

    iput-object v0, v1, Lorg/uoyabause/android/Yabause;->googleSignInClient:Lcom/google/android/gms/auth/api/signin/b;

    invoke-static/range {p0 .. p0}, Landroidx/preference/k;->b(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v2, "pref_landscape"

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    const/4 v4, -0x1

    const/4 v5, 0x1

    if-ne v2, v5, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    move v2, v4

    :goto_0
    invoke-virtual {v1, v2}, Landroid/app/Activity;->setRequestedOrientation(I)V

    const-string v2, "input"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    const-string v6, "null cannot be cast to non-null type android.hardware.input.InputManager"

    invoke-static {v2, v6}, LS6/l;->c(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v2, Landroid/hardware/input/InputManager;

    iput-object v2, v1, Lorg/uoyabause/android/Yabause;->inputManager:Landroid/hardware/input/InputManager;

    invoke-static {}, Ljava/lang/System;->gc()V

    invoke-static/range {p0 .. p0}, Lcom/google/firebase/analytics/FirebaseAnalytics;->getInstance(Landroid/content/Context;)Lcom/google/firebase/analytics/FirebaseAnalytics;

    move-result-object v2

    iput-object v2, v1, Lorg/uoyabause/android/Yabause;->firebaseAnalytics:Lcom/google/firebase/analytics/FirebaseAnalytics;

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v2

    const-string v6, "null cannot be cast to non-null type org.uoyabause.android.YabauseApplication"

    invoke-static {v2, v6}, LS6/l;->c(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v2, Lorg/uoyabause/android/YabauseApplication;

    invoke-virtual {v2}, Lorg/uoyabause/android/YabauseApplication;->b()Lx2/k;

    move-result-object v2

    iput-object v2, v1, Lorg/uoyabause/android/Yabause;->tracker:Lx2/k;

    const v2, 0x7f0d00b9

    invoke-virtual {v1, v2}, Landroidx/appcompat/app/d;->setContentView(I)V

    const v2, 0x7f0a01fc

    invoke-virtual {v1, v2}, Landroidx/appcompat/app/d;->findViewById(I)Landroid/view/View;

    move-result-object v2

    const-string v6, "findViewById(R.id.llProgressBar)"

    invoke-static {v2, v6}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v2, v1, Lorg/uoyabause/android/Yabause;->progressBar:Landroid/view/View;

    const/4 v6, 0x0

    if-nez v2, :cond_1

    const-string v2, "progressBar"

    invoke-static {v2}, LS6/l;->p(Ljava/lang/String;)V

    move-object v2, v6

    :cond_1
    const/16 v7, 0x8

    invoke-virtual {v2, v7}, Landroid/view/View;->setVisibility(I)V

    const v2, 0x7f0a02a8

    invoke-virtual {v1, v2}, Landroidx/appcompat/app/d;->findViewById(I)Landroid/view/View;

    move-result-object v2

    const-string v8, "findViewById(R.id.pbText)"

    invoke-static {v2, v8}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v1, Lorg/uoyabause/android/Yabause;->progressMessage:Landroid/widget/TextView;

    sget-object v2, Lorg/uoyabause/android/x0;->d:Lorg/uoyabause/android/x0$a;

    invoke-virtual {v2}, Lorg/uoyabause/android/x0$a;->c()Lorg/uoyabause/android/x0;

    move-result-object v2

    invoke-static {v2}, LS6/l;->b(Ljava/lang/Object;)V

    iput-object v2, v1, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    const-string v8, "padManager"

    if-nez v2, :cond_2

    invoke-static {v8}, LS6/l;->p(Ljava/lang/String;)V

    move-object v2, v6

    :cond_2
    invoke-virtual {v2}, Lorg/uoyabause/android/x0;->n()V

    iget-object v2, v1, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v2, :cond_3

    invoke-static {v8}, LS6/l;->p(Ljava/lang/String;)V

    move-object v2, v6

    :cond_3
    invoke-virtual {v2, v1}, Lorg/uoyabause/android/x0;->v(Lorg/uoyabause/android/x0$b;)V

    const v2, 0x7f0a0375

    invoke-virtual {v1, v2}, Landroidx/appcompat/app/d;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroidx/appcompat/widget/SwitchCompat;

    const-string v8, "pref_analog_pad"

    invoke-static {v1, v8}, LK1/b;->g(Landroid/content/Context;Ljava/lang/String;)Landroid/content/SharedPreferences;

    move-result-object v9

    invoke-interface {v9, v8, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    invoke-virtual {v2, v8}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    const v8, 0x7f0a01cd

    invoke-virtual {v1, v8}, Landroidx/appcompat/app/d;->findViewById(I)Landroid/view/View;

    move-result-object v8

    if-nez v8, :cond_4

    goto :goto_1

    :cond_4
    const-string v9, "pref_pad_trans"

    const v10, 0x3f333333    # 0.7f

    invoke-interface {v0, v9, v10}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v9

    invoke-virtual {v8, v9}, Landroid/view/View;->setAlpha(F)V

    :goto_1
    const-string v9, "pref_show_analog_switch"

    invoke-interface {v0, v9, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v9

    if-eqz v9, :cond_5

    invoke-virtual {v8, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_2

    :cond_5
    invoke-virtual {v8, v7}, Landroid/view/View;->setVisibility(I)V

    :goto_2
    new-instance v7, Lorg/uoyabause/android/t1;

    invoke-direct {v7, v1}, Lorg/uoyabause/android/t1;-><init>(Lorg/uoyabause/android/Yabause;)V

    invoke-virtual {v2, v7}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x1c

    if-lt v2, v7, :cond_6

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v7

    const/4 v8, 0x2

    invoke-static {v7, v8}, Lcom/google/android/gms/ads/internal/util/X0;->a(Landroid/view/WindowManager$LayoutParams;I)V

    :cond_6
    const-string v7, "pref_immersive_mode"

    invoke-interface {v0, v7, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    if-eqz v7, :cond_8

    const/16 v7, 0x1e

    if-lt v2, v7, :cond_7

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-static {v2}, Landroidx/core/view/a1;->a(Landroid/view/Window;)Landroid/view/WindowInsetsController;

    move-result-object v2

    if-eqz v2, :cond_8

    invoke-static {}, Landroidx/core/view/S0;->a()I

    move-result v7

    invoke-static {v2, v7}, Lorg/uoyabause/android/c1;->a(Landroid/view/WindowInsetsController;I)V

    goto :goto_3

    :cond_7
    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/16 v7, 0x400

    invoke-virtual {v2, v7, v7}, Landroid/view/Window;->setFlags(II)V

    :cond_8
    :goto_3
    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/16 v7, 0x80

    invoke-virtual {v2, v7}, Landroid/view/Window;->addFlags(I)V

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/app/d;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f060024

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getColor(I)I

    move-result v7

    invoke-virtual {v2, v7}, Landroid/view/Window;->setNavigationBarColor(I)V

    const v2, 0x7f0a012d

    invoke-virtual {v1, v2}, Landroidx/appcompat/app/d;->findViewById(I)Landroid/view/View;

    move-result-object v2

    const-string v7, "null cannot be cast to non-null type androidx.drawerlayout.widget.DrawerLayout"

    invoke-static {v2, v7}, LS6/l;->c(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v2, Landroidx/drawerlayout/widget/DrawerLayout;

    iput-object v2, v1, Lorg/uoyabause/android/Yabause;->drawerLayout:Landroidx/drawerlayout/widget/DrawerLayout;

    invoke-virtual/range {p0 .. p0}, Landroidx/appcompat/app/d;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v2, v2, Landroid/content/res/Configuration;->orientation:I

    invoke-virtual {v1, v2}, Lorg/uoyabause/android/Yabause;->updateViewLayout(I)V

    const v2, 0x7f0a026a

    invoke-virtual {v1, v2}, Landroidx/appcompat/app/d;->findViewById(I)Landroid/view/View;

    move-result-object v2

    const-string v7, "null cannot be cast to non-null type com.google.android.material.navigation.NavigationView"

    invoke-static {v2, v7}, LS6/l;->c(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v2, Lcom/google/android/material/navigation/NavigationView;

    invoke-virtual {v2, v1}, Lcom/google/android/material/navigation/NavigationView;->setNavigationItemSelectedListener(Lcom/google/android/material/navigation/NavigationView$d;)V

    invoke-virtual {v2}, Lcom/google/android/material/navigation/NavigationView;->getMenu()Landroid/view/Menu;

    move-result-object v7

    const-string v8, "navigationView.menu"

    invoke-static {v7, v8}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    const v9, 0x7f0a02cb

    invoke-interface {v7, v9}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v9

    if-eqz v9, :cond_9

    invoke-interface {v9, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_9
    const v9, 0x7f0a02b1

    invoke-interface {v7, v9}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v7

    if-eqz v7, :cond_a

    invoke-interface {v7, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_a
    new-instance v7, Lorg/uoyabause/android/Yabause$d;

    invoke-direct {v7, v1}, Lorg/uoyabause/android/Yabause$d;-><init>(Lorg/uoyabause/android/Yabause;)V

    iget-object v9, v1, Lorg/uoyabause/android/Yabause;->drawerLayout:Landroidx/drawerlayout/widget/DrawerLayout;

    if-nez v9, :cond_b

    const-string v9, "drawerLayout"

    invoke-static {v9}, LS6/l;->p(Ljava/lang/String;)V

    move-object v9, v6

    :cond_b
    invoke-virtual {v9, v7}, Landroidx/drawerlayout/widget/DrawerLayout;->a(Landroidx/drawerlayout/widget/DrawerLayout$e;)V

    invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v9

    const-string v10, "Yabause"

    if-eqz v9, :cond_d

    invoke-virtual {v9}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_4
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_d

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    invoke-virtual {v9, v12}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    if-eqz v13, :cond_c

    invoke-virtual {v9, v12}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    goto :goto_5

    :cond_c
    const-string v13, "NULL"

    :goto_5
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v12, " : "

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v10, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_4

    :cond_d
    const-string v9, "org.uoyabause.android.FileName"

    invoke-virtual {v7, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v11, ""

    if-eqz v9, :cond_e

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v12

    if-lez v12, :cond_e

    sget-object v12, Lorg/uoyabause/android/M1;->m:Lorg/uoyabause/android/M1$g;

    invoke-virtual {v12}, Lorg/uoyabause/android/M1$g;->e()Lorg/uoyabause/android/M1;

    move-result-object v12

    invoke-virtual {v12, v9}, Lorg/uoyabause/android/M1;->s(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iput-object v9, v1, Lorg/uoyabause/android/Yabause;->gamePath:Ljava/lang/String;

    goto :goto_6

    :cond_e
    iput-object v11, v1, Lorg/uoyabause/android/Yabause;->gamePath:Ljava/lang/String;

    :goto_6
    const-string v9, "org.uoyabause.android.FileNameEx"

    invoke-virtual {v7, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    if-eqz v9, :cond_f

    iput-object v9, v1, Lorg/uoyabause/android/Yabause;->gamePath:Ljava/lang/String;

    :cond_f
    const-string v9, "org.uoyabause.android.FileNameUri"

    invoke-virtual {v7, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    if-eqz v15, :cond_13

    const/16 v16, 0x2

    const/16 v17, 0x0

    const-string v13, "%2F"

    const/4 v14, 0x0

    const/16 v18, 0x1

    move-object v12, v15

    move-object v3, v15

    move/from16 v15, v18

    invoke-static/range {v12 .. v17}, La7/g;->Y(Ljava/lang/CharSequence;Ljava/lang/String;IZILjava/lang/Object;)I

    move-result v12

    add-int/lit8 v12, v12, 0x3

    invoke-virtual {v3, v12}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v12

    const-string v13, "this as java.lang.String).substring(startIndex)"

    invoke-static {v12, v13}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    :try_start_0
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v13

    const-string v14, "r"

    invoke-virtual {v13, v3, v14}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object v13

    iput-object v13, v1, Lorg/uoyabause/android/Yabause;->mParcelFileDescriptor:Landroid/os/ParcelFileDescriptor;

    if-eqz v13, :cond_11

    if-eqz v13, :cond_10

    invoke-virtual {v13}, Landroid/os/ParcelFileDescriptor;->getFd()I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    goto :goto_7

    :catch_0
    move-exception v0

    goto :goto_9

    :cond_10
    move-object v13, v6

    :goto_7
    if-eqz v13, :cond_11

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "/proc/self/fd/"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v15, ";"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_8

    :cond_11
    move v3, v4

    move-object v12, v11

    :goto_8
    invoke-static {v12, v11}, LS6/l;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_12

    const v0, 0x7f1300bc

    filled-new-array {v12}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "getString(R.string.fail_to_open, apath)"

    invoke-static {v0, v2}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v1, v0}, Lorg/uoyabause/android/Yabause;->showInitFailedDialog(Ljava/lang/String;)V

    return-void

    :cond_12
    iput-object v12, v1, Lorg/uoyabause/android/Yabause;->gamePath:Ljava/lang/String;

    goto :goto_a

    :goto_9
    invoke-virtual {v0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v0

    filled-new-array {v3, v0}, [Ljava/lang/Object;

    move-result-object v0

    const v2, 0x7f1300bd

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "getString(R.string.fail_\u2026 uri, e.localizedMessage)"

    invoke-static {v0, v2}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v1, v0}, Lorg/uoyabause/android/Yabause;->showInitFailedDialog(Ljava/lang/String;)V

    return-void

    :cond_13
    move v3, v4

    :goto_a
    const-string v12, "org.uoyabause.android.FileDir"

    invoke-virtual {v7, v12}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    if-eqz v12, :cond_14

    invoke-static {v12}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v12

    iput-object v12, v1, Lorg/uoyabause/android/Yabause;->currentDocumentUri:Landroid/net/Uri;

    goto :goto_b

    :cond_14
    iput-object v6, v1, Lorg/uoyabause/android/Yabause;->currentDocumentUri:Landroid/net/Uri;

    :goto_b
    iget-object v12, v1, Lorg/uoyabause/android/Yabause;->gamePath:Ljava/lang/String;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "File is "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v10, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v10, v1, Lorg/uoyabause/android/Yabause;->gamePath:Ljava/lang/String;

    invoke-static {v10, v11}, LS6/l;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_15

    const v0, 0x7f130213

    invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const-string v2, "getString(R.string.no_game_file_is_selected)"

    invoke-static {v0, v2}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v1, v0}, Lorg/uoyabause/android/Yabause;->showInitFailedDialog(Ljava/lang/String;)V

    return-void

    :cond_15
    if-ne v3, v4, :cond_16

    new-instance v3, Ljava/io/File;

    iget-object v4, v1, Lorg/uoyabause/android/Yabause;->gamePath:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    :try_start_1
    new-instance v4, Ljava/io/FileReader;

    invoke-direct {v4, v3}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    new-instance v3, Ljava/io/BufferedReader;

    invoke-direct {v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    const/4 v4, 0x4

    new-array v4, v4, [C

    const/4 v10, 0x0

    invoke-virtual {v3, v4, v10, v5}, Ljava/io/BufferedReader;->read([CII)I

    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_10

    :catch_1
    move-exception v0

    goto :goto_c

    :catch_2
    move-exception v0

    goto :goto_d

    :catch_3
    move-exception v0

    goto :goto_e

    :catch_4
    move-exception v0

    goto :goto_f

    :goto_c
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v2, 0x7f130236

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "getString(R.string.other_file_error, e.message)"

    invoke-static {v0, v2}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v1, v0}, Lorg/uoyabause/android/Yabause;->showInitFailedDialog(Ljava/lang/String;)V

    return-void

    :goto_d
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v2, 0x7f130253

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "getString(R.string.read_\u2026ission_denied, e.message)"

    invoke-static {v0, v2}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v1, v0}, Lorg/uoyabause/android/Yabause;->showInitFailedDialog(Ljava/lang/String;)V

    return-void

    :goto_e
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v2, 0x7f130140

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "getString(R.string.i_o_error_occurred, e.message)"

    invoke-static {v0, v2}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v1, v0}, Lorg/uoyabause/android/Yabause;->showInitFailedDialog(Ljava/lang/String;)V

    return-void

    :goto_f
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v2, 0x7f1300c4

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "getString(R.string.file_not_found, e.message)"

    invoke-static {v0, v2}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v1, v0}, Lorg/uoyabause/android/Yabause;->showInitFailedDialog(Ljava/lang/String;)V

    return-void

    :cond_16
    :goto_10
    const-string v3, "org.uoyabause.android.gamecode"

    invoke-virtual {v7, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_18

    sget-object v4, Lorg/uoyabause/android/YabauseApplication;->c:Lorg/uoyabause/android/YabauseApplication$a;

    invoke-virtual {v4}, Lorg/uoyabause/android/YabauseApplication$a;->b()Landroid/content/Context;

    move-result-object v4

    const-class v5, Lorg/uoyabause/android/GameInfoDatabase;

    const-string v10, "main-database"

    invoke-static {v4, v5, v10}, Ls0/p;->a(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)Ls0/q$a;

    move-result-object v4

    invoke-virtual {v4}, Ls0/q$a;->c()Ls0/q$a;

    move-result-object v4

    invoke-virtual {v4}, Ls0/q$a;->d()Ls0/q;

    move-result-object v4

    check-cast v4, Lorg/uoyabause/android/GameInfoDatabase;

    invoke-virtual {v4}, Lorg/uoyabause/android/GameInfoDatabase;->D()Lorg/uoyabause/android/H;

    move-result-object v4

    invoke-virtual {v7, v9}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_18

    invoke-interface {v4, v5}, Lorg/uoyabause/android/H;->e(Ljava/lang/String;)Lorg/uoyabause/android/G;

    move-result-object v3

    if-eqz v3, :cond_17

    invoke-virtual {v3}, Lorg/uoyabause/android/G;->m()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3}, Lorg/uoyabause/android/G;->i()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    iput-object v3, v1, Lorg/uoyabause/android/Yabause;->currentDocumentUri:Landroid/net/Uri;

    move-object v3, v4

    goto :goto_11

    :cond_17
    const-string v3, "You need add this game to game list before launch it."

    invoke-direct {v1, v3}, Lorg/uoyabause/android/Yabause;->showInitFailedDialog(Ljava/lang/String;)V

    move-object v3, v6

    :cond_18
    :goto_11
    const-string v4, "TestCase"

    invoke-virtual {v7, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v1, Lorg/uoyabause/android/Yabause;->testCase:Ljava/lang/String;

    new-instance v4, Lorg/uoyabause/android/F1;

    invoke-direct {v4, v1}, Lorg/uoyabause/android/F1;-><init>(Landroid/app/Activity;)V

    iput-object v4, v1, Lorg/uoyabause/android/Yabause;->audio:Lorg/uoyabause/android/F1;

    iput-object v6, v1, Lorg/uoyabause/android/Yabause;->currentGame:Lf8/a;

    if-eqz v3, :cond_1b

    invoke-direct {v1, v3}, Lorg/uoyabause/android/Yabause;->readPreferences(Ljava/lang/String;)V

    const-string v4, "GS-9170"

    invoke-static {v3, v4}, LS6/l;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_19

    const-string v4, "MK-81800"

    invoke-static {v3, v4}, LS6/l;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1b

    :cond_19
    new-instance v3, Lf8/d;

    invoke-direct {v3}, Lf8/d;-><init>()V

    invoke-virtual {v3, v1}, Lf8/a;->e(Lf8/b;)V

    invoke-virtual {v2}, Lcom/google/android/material/navigation/NavigationView;->getMenu()Landroid/view/Menu;

    move-result-object v4

    invoke-static {v4, v8}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    iget v5, v1, Lorg/uoyabause/android/Yabause;->MENU_ID_LEADERBOARD:I

    const-string v6, "Leader Board"

    const/4 v7, 0x0

    invoke-interface {v4, v7, v5, v7, v6}, Landroid/view/Menu;->addSubMenu(IIILjava/lang/CharSequence;)Landroid/view/SubMenu;

    move-result-object v4

    invoke-virtual {v3}, Lf8/a;->a()Ljava/util/List;

    move-result-object v5

    if-eqz v5, :cond_1a

    check-cast v5, Ljava/lang/Iterable;

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_12
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1a

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lf8/c;

    invoke-virtual {v6}, Lf8/c;->b()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v4, v7}, Landroid/view/Menu;->add(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object v7

    const v8, 0x7f080089

    invoke-interface {v7, v8}, Landroid/view/MenuItem;->setIcon(I)Landroid/view/MenuItem;

    new-instance v8, Lorg/uoyabause/android/u1;

    invoke-direct {v8, v1, v6}, Lorg/uoyabause/android/u1;-><init>(Lorg/uoyabause/android/Yabause;Lf8/c;)V

    invoke-interface {v7, v8}, Landroid/view/MenuItem;->setOnMenuItemClickListener(Landroid/view/MenuItem$OnMenuItemClickListener;)Landroid/view/MenuItem;

    goto :goto_12

    :cond_1a
    iput-object v3, v1, Lorg/uoyabause/android/Yabause;->currentGame:Lf8/a;

    :cond_1b
    iget-object v3, v1, Lorg/uoyabause/android/Yabause;->currentGame:Lf8/a;

    if-eqz v3, :cond_1c

    sget-object v2, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {v2}, Lorg/uoyabause/android/YabauseRunnable$a;->f()I

    :goto_13
    const/4 v2, 0x0

    goto :goto_14

    :cond_1c
    invoke-virtual {v2}, Lcom/google/android/material/navigation/NavigationView;->getMenu()Landroid/view/Menu;

    move-result-object v2

    iget v3, v1, Lorg/uoyabause/android/Yabause;->MENU_ID_LEADERBOARD:I

    invoke-interface {v2, v3}, Landroid/view/Menu;->removeItem(I)V

    goto :goto_13

    :goto_14
    iput-boolean v2, v1, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    new-instance v2, Lorg/uoyabause/android/YabauseRunnable;

    invoke-direct {v2, v1}, Lorg/uoyabause/android/YabauseRunnable;-><init>(Lorg/uoyabause/android/Yabause;)V

    iput-object v2, v1, Lorg/uoyabause/android/Yabause;->yabauseThread:Lorg/uoyabause/android/YabauseRunnable;

    invoke-virtual {v2}, Lorg/uoyabause/android/YabauseRunnable;->b()Z

    move-result v2

    if-nez v2, :cond_1d

    const v0, 0x7f1300bb

    invoke-virtual {v1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const-string v2, "getString(R.string.fail_to_initialize_emulator)"

    invoke-static {v0, v2}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v1, v0}, Lorg/uoyabause/android/Yabause;->showInitFailedDialog(Ljava/lang/String;)V

    return-void

    :cond_1d
    const-string v2, "pref_auto_state_save"

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1e

    invoke-virtual/range {p0 .. p0}, Lorg/uoyabause/android/Yabause;->showAutoStateLoadDialog()V

    :cond_1e
    return-void
.end method

.method public onCreateDialog(ILandroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2

    const-string p1, "args"

    invoke-static {p2, p1}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance p1, Landroidx/appcompat/app/c$a;

    invoke-direct {p1, p0}, Landroidx/appcompat/app/c$a;-><init>(Landroid/content/Context;)V

    const-string v0, "message"

    invoke-virtual {p2, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroidx/appcompat/app/c$a;->h(Ljava/lang/CharSequence;)Landroidx/appcompat/app/c$a;

    move-result-object p2

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroidx/appcompat/app/c$a;->d(Z)Landroidx/appcompat/app/c$a;

    move-result-object p2

    new-instance v0, Lorg/uoyabause/android/m1;

    invoke-direct {v0, p0}, Lorg/uoyabause/android/m1;-><init>(Lorg/uoyabause/android/Yabause;)V

    const v1, 0x7f1300b1

    invoke-virtual {p2, v1, v0}, Landroidx/appcompat/app/c$a;->j(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/c$a;

    move-result-object p2

    new-instance v0, Lorg/uoyabause/android/n1;

    invoke-direct {v0}, Lorg/uoyabause/android/n1;-><init>()V

    const v1, 0x7f130142

    invoke-virtual {p2, v1, v0}, Landroidx/appcompat/app/c$a;->p(ILandroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/c$a;

    invoke-virtual {p1}, Landroidx/appcompat/app/c$a;->a()Landroidx/appcompat/app/c;

    move-result-object p1

    return-object p1
.end method

.method public onDestroy()V
    .locals 4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    iget-wide v2, p0, Lorg/uoyabause/android/Yabause;->startTime:J

    sub-long/2addr v0, v2

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    const-string v3, "playTime"

    invoke-virtual {v2, v3, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const/4 v0, -0x1

    invoke-virtual {p0, v0, v2}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    const-string v0, "Yabause"

    const-string v1, "this is the end..."

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->yabauseThread:Lorg/uoyabause/android/YabauseRunnable;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/uoyabause/android/YabauseRunnable;->a()V

    :cond_0
    invoke-super {p0}, Landroidx/appcompat/app/d;->onDestroy()V

    return-void
.end method

.method public onDeviceUpdated(I)V
    .locals 0

    return-void
.end method

.method public onFinish()V
    .locals 5

    invoke-virtual {p0}, Landroidx/fragment/app/j;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    const-string v1, "PadTestFragment"

    invoke-virtual {v0, v1}, Landroidx/fragment/app/w;->h0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lorg/uoyabause/android/C0;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Landroidx/fragment/app/j;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/fragment/app/w;->o()Landroidx/fragment/app/F;

    move-result-object v2

    const-string v3, "supportFragmentManager.beginTransaction()"

    invoke-static {v2, v3}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Landroidx/fragment/app/F;->p(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/F;

    invoke-virtual {v2}, Landroidx/fragment/app/F;->j()I

    const v0, 0x7f0a03b6

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/d;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const-string v2, "null cannot be cast to non-null type org.uoyabause.android.YabausePad"

    invoke-static {v0, v2}, LS6/l;->c(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lorg/uoyabause/android/YabausePad;

    invoke-virtual {v0}, Lorg/uoyabause/android/YabausePad;->o()V

    const v0, 0x7f0a0375

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/d;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/SwitchCompat;

    const-string v2, "pref_analog_pad"

    invoke-static {p0, v2}, LK1/b;->g(Landroid/content/Context;Ljava/lang/String;)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    invoke-virtual {v0, v2}, Landroidx/appcompat/widget/SwitchCompat;->setChecked(Z)V

    invoke-static {p0}, Landroidx/preference/k;->b(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const v2, 0x7f0a01cd

    invoke-virtual {p0, v2}, Landroidx/appcompat/app/d;->findViewById(I)Landroid/view/View;

    move-result-object v2

    if-nez v2, :cond_0

    goto :goto_0

    :cond_0
    const-string v3, "pref_pad_trans"

    const v4, 0x3f333333    # 0.7f

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setAlpha(F)V

    :goto_0
    const-string v3, "pref_show_analog_switch"

    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    :cond_1
    const/16 v0, 0x8

    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_2
    :goto_1
    iput-boolean v1, p0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    invoke-direct {p0}, Lorg/uoyabause/android/Yabause;->toggleMenu()V

    return-void
.end method

.method public onFinishInputSetting()V
    .locals 1

    invoke-virtual {p0}, Lorg/uoyabause/android/Yabause;->updateInputDevice()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    invoke-direct {p0}, Lorg/uoyabause/android/Yabause;->toggleMenu()V

    return-void
.end method

.method public final onFinishReport()V
    .locals 0

    return-void
.end method

.method public onGenericMotionEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    const-string v0, "event"

    invoke-static {p1, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    iget-boolean v0, p0, Lorg/uoyabause/android/Yabause;->menu_showing:Z

    if-eqz v0, :cond_0

    invoke-super {p0, p1}, Landroid/app/Activity;->onGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    :cond_0
    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v0, :cond_1

    const-string v0, "padManager"

    invoke-static {v0}, LS6/l;->p(Ljava/lang/String;)V

    const/4 v0, 0x0

    :cond_1
    invoke-virtual {v0, p1}, Lorg/uoyabause/android/x0;->o(Landroid/view/MotionEvent;)I

    move-result v0

    if-eqz v0, :cond_2

    const/4 p1, 0x1

    goto :goto_0

    :cond_2
    invoke-super {p0, p1}, Landroid/app/Activity;->onGenericMotionEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    :goto_0
    return p1
.end method

.method public onInputDeviceAdded(I)V
    .locals 0

    invoke-virtual {p0}, Lorg/uoyabause/android/Yabause;->updateInputDevice()V

    return-void
.end method

.method public onInputDeviceChanged(I)V
    .locals 0

    return-void
.end method

.method public onInputDeviceRemoved(I)V
    .locals 0

    invoke-virtual {p0}, Lorg/uoyabause/android/Yabause;->updateInputDevice()V

    return-void
.end method

.method public onNavigationItemSelected(Landroid/view/MenuItem;)Z
    .locals 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const-string v2, "item"

    invoke-static {v1, v2}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface/range {p1 .. p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    invoke-interface/range {p1 .. p1}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "item_id"

    const-string v6, "MENU"

    invoke-virtual {v3, v5, v6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "item_name"

    invoke-virtual {v3, v5, v4}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v4, v0, Lorg/uoyabause/android/Yabause;->firebaseAnalytics:Lcom/google/firebase/analytics/FirebaseAnalytics;

    invoke-static {v4}, LS6/l;->b(Ljava/lang/Object;)V

    const-string v5, "select_content"

    invoke-virtual {v4, v5, v3}, Lcom/google/firebase/analytics/FirebaseAnalytics;->a(Ljava/lang/String;Landroid/os/Bundle;)V

    const-string v3, "TabBackupFragment"

    const-string v4, "InputDevice"

    const-string v5, "InputSettings"

    const-string v6, "pref_analog_pad"

    const-string v7, "drawerLayout"

    const v8, 0x7f0a0159

    const v9, 0x7f01001d

    const v10, 0x7f01001c

    const-string v11, "supportFragmentManager.beginTransaction()"

    const/4 v12, -0x1

    const-string v13, "padManager"

    const/4 v15, 0x0

    const/4 v14, 0x1

    sparse-switch v2, :sswitch_data_0

    goto/16 :goto_5

    :sswitch_0
    sget-object v1, Lorg/uoyabause/android/M1;->m:Lorg/uoyabause/android/M1$g;

    invoke-virtual {v1}, Lorg/uoyabause/android/M1$g;->e()Lorg/uoyabause/android/M1;

    move-result-object v2

    invoke-virtual {v2}, Lorg/uoyabause/android/M1;->z()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {v3}, Lorg/uoyabause/android/YabauseRunnable$a;->m()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    new-instance v5, Ljava/io/File;

    invoke-virtual {v1}, Lorg/uoyabause/android/M1$g;->e()Lorg/uoyabause/android/M1;

    move-result-object v1

    invoke-virtual {v1}, Lorg/uoyabause/android/M1;->z()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v5, v1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    :goto_0
    if-eqz v5, :cond_1

    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-virtual {v5}, Ljava/io/File;->mkdir()Z

    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Lorg/uoyabause/android/YabauseRunnable$a;->G(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v5, "Failed to save the current state"

    if-eqz v1, :cond_6

    const/16 v20, 0x6

    const/16 v21, 0x0

    const-string v17, "."

    const/16 v18, 0x0

    const/16 v19, 0x0

    move-object/from16 v16, v1

    invoke-static/range {v16 .. v21}, La7/g;->Y(Ljava/lang/CharSequence;Ljava/lang/String;IZILjava/lang/Object;)I

    move-result v6

    if-eq v6, v12, :cond_2

    invoke-virtual {v1, v15, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    const-string v6, "this as java.lang.String\u2026ing(startIndex, endIndex)"

    invoke-static {v1, v6}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    :cond_2
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, ".png"

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Lorg/uoyabause/android/YabauseRunnable$a;->I(Ljava/lang/String;)I

    move-result v3

    if-eqz v3, :cond_4

    iget-object v1, v0, Lorg/uoyabause/android/Yabause;->drawerLayout:Landroidx/drawerlayout/widget/DrawerLayout;

    if-nez v1, :cond_3

    invoke-static {v7}, LS6/l;->p(Ljava/lang/String;)V

    const/4 v1, 0x0

    :cond_3
    invoke-static {v1, v5, v12}, Lcom/google/android/material/snackbar/Snackbar;->k0(Landroid/view/View;Ljava/lang/CharSequence;I)Lcom/google/android/material/snackbar/Snackbar;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/material/snackbar/Snackbar;->V()V

    goto :goto_1

    :cond_4
    iget-object v3, v0, Lorg/uoyabause/android/Yabause;->drawerLayout:Landroidx/drawerlayout/widget/DrawerLayout;

    if-nez v3, :cond_5

    invoke-static {v7}, LS6/l;->p(Ljava/lang/String;)V

    const/4 v3, 0x0

    :cond_5
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Current state is saved as "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v1, v15}, Lcom/google/android/material/snackbar/Snackbar;->k0(Landroid/view/View;Ljava/lang/CharSequence;I)Lcom/google/android/material/snackbar/Snackbar;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/material/snackbar/Snackbar;->V()V

    goto :goto_1

    :cond_6
    iget-object v1, v0, Lorg/uoyabause/android/Yabause;->drawerLayout:Landroidx/drawerlayout/widget/DrawerLayout;

    if-nez v1, :cond_7

    invoke-static {v7}, LS6/l;->p(Ljava/lang/String;)V

    const/4 v1, 0x0

    :cond_7
    invoke-static {v1, v5, v12}, Lcom/google/android/material/snackbar/Snackbar;->k0(Landroid/view/View;Ljava/lang/CharSequence;I)Lcom/google/android/material/snackbar/Snackbar;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/android/material/snackbar/Snackbar;->V()V

    :goto_1
    sget-object v1, Lorg/uoyabause/android/Y0;->u0:Lorg/uoyabause/android/Y0$a;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/uoyabause/android/Y0$a;->a(Ljava/lang/String;)V

    goto/16 :goto_5

    :sswitch_1
    sget-object v1, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {v1}, Lorg/uoyabause/android/YabauseRunnable$a;->E()V

    goto/16 :goto_5

    :sswitch_2
    invoke-virtual/range {p0 .. p0}, Lorg/uoyabause/android/Yabause;->startReport()V

    goto/16 :goto_5

    :sswitch_3
    invoke-static {v0, v6}, LK1/b;->g(Landroid/content/Context;Ljava/lang/String;)Landroid/content/SharedPreferences;

    move-result-object v2

    const-string v3, "pref_analog_pad2"

    invoke-interface {v2, v3, v15}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_9

    invoke-interface {v1, v15}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    iget-object v1, v0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v1, :cond_8

    invoke-static {v13}, LS6/l;->p(Ljava/lang/String;)V

    const/4 v1, 0x0

    :cond_8
    invoke-virtual {v1, v15}, Lorg/uoyabause/android/x0;->s(I)V

    sget-object v1, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {v1, v15}, Lorg/uoyabause/android/YabauseRunnable$a;->Y(I)V

    goto :goto_2

    :cond_9
    invoke-interface {v1, v14}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    iget-object v1, v0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v1, :cond_a

    invoke-static {v13}, LS6/l;->p(Ljava/lang/String;)V

    const/4 v1, 0x0

    :cond_a
    invoke-virtual {v1, v14}, Lorg/uoyabause/android/x0;->s(I)V

    sget-object v1, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {v1, v14}, Lorg/uoyabause/android/YabauseRunnable$a;->Y(I)V

    move v15, v14

    :goto_2
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, v3, v15}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-direct/range {p0 .. p0}, Lorg/uoyabause/android/Yabause;->toggleMenu()V

    goto/16 :goto_5

    :sswitch_4
    const v2, 0x7f0a03b6

    invoke-virtual {v0, v2}, Landroidx/appcompat/app/d;->findViewById(I)Landroid/view/View;

    move-result-object v2

    const-string v3, "null cannot be cast to non-null type org.uoyabause.android.YabausePad"

    invoke-static {v2, v3}, LS6/l;->c(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v2, Lorg/uoyabause/android/YabausePad;

    invoke-static {v0, v6}, LK1/b;->g(Landroid/content/Context;Ljava/lang/String;)Landroid/content/SharedPreferences;

    move-result-object v3

    invoke-interface {v3, v6, v15}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_c

    invoke-interface {v1, v15}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    iget-object v1, v0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v1, :cond_b

    invoke-static {v13}, LS6/l;->p(Ljava/lang/String;)V

    const/4 v1, 0x0

    :cond_b
    invoke-virtual {v1, v15}, Lorg/uoyabause/android/x0;->r(I)V

    sget-object v1, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {v1, v15}, Lorg/uoyabause/android/YabauseRunnable$a;->X(I)V

    invoke-virtual {v2, v15}, Lorg/uoyabause/android/YabausePad;->setPadMode(I)V

    goto :goto_3

    :cond_c
    invoke-interface {v1, v14}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    iget-object v1, v0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v1, :cond_d

    invoke-static {v13}, LS6/l;->p(Ljava/lang/String;)V

    const/4 v1, 0x0

    :cond_d
    invoke-virtual {v1, v14}, Lorg/uoyabause/android/x0;->r(I)V

    sget-object v1, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {v1, v14}, Lorg/uoyabause/android/YabauseRunnable$a;->X(I)V

    invoke-virtual {v2, v14}, Lorg/uoyabause/android/YabausePad;->setPadMode(I)V

    move v15, v14

    :goto_3
    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1, v6, v15}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-direct/range {p0 .. p0}, Lorg/uoyabause/android/Yabause;->toggleMenu()V

    goto/16 :goto_5

    :sswitch_5
    iput-boolean v14, v0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    iget-object v1, v0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v1, :cond_e

    invoke-static {v13}, LS6/l;->p(Ljava/lang/String;)V

    const/4 v1, 0x0

    :cond_e
    invoke-virtual {v1}, Lorg/uoyabause/android/x0;->l()I

    move-result v1

    if-eq v1, v12, :cond_18

    new-instance v1, Lorg/uoyabause/android/n0;

    invoke-direct {v1}, Lorg/uoyabause/android/n0;-><init>()V

    const-string v2, "keymap_player2"

    invoke-virtual {v1, v14, v2}, Lorg/uoyabause/android/n0;->K2(ILjava/lang/String;)V

    invoke-virtual {v1, v0}, Lorg/uoyabause/android/n0;->J2(Lorg/uoyabause/android/o0;)V

    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/j;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v2

    invoke-virtual {v1, v2, v5}, Landroidx/fragment/app/e;->G2(Landroidx/fragment/app/w;Ljava/lang/String;)V

    goto/16 :goto_5

    :sswitch_6
    iput-boolean v14, v0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    iget-object v1, v0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v1, :cond_f

    invoke-static {v13}, LS6/l;->p(Ljava/lang/String;)V

    const/4 v1, 0x0

    :cond_f
    invoke-virtual {v1}, Lorg/uoyabause/android/x0;->k()I

    move-result v1

    if-ne v1, v12, :cond_10

    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/j;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/fragment/app/w;->o()Landroidx/fragment/app/F;

    move-result-object v1

    invoke-static {v1, v11}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v2, Lorg/uoyabause/android/C0;->v0:Lorg/uoyabause/android/C0$a;

    invoke-virtual {v2}, Lorg/uoyabause/android/C0$a;->a()Lorg/uoyabause/android/C0;

    move-result-object v2

    invoke-virtual {v2, v0}, Lorg/uoyabause/android/C0;->z2(Lorg/uoyabause/android/C0$b;)V

    invoke-virtual {v1, v10, v9}, Landroidx/fragment/app/F;->s(II)Landroidx/fragment/app/F;

    const-string v3, "PadTestFragment"

    invoke-virtual {v1, v8, v2, v3}, Landroidx/fragment/app/F;->r(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/F;

    invoke-virtual {v1, v2}, Landroidx/fragment/app/F;->w(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/F;

    invoke-virtual {v1}, Landroidx/fragment/app/F;->j()I

    goto/16 :goto_5

    :cond_10
    new-instance v1, Lorg/uoyabause/android/n0;

    invoke-direct {v1}, Lorg/uoyabause/android/n0;-><init>()V

    const-string v2, "keymap"

    invoke-virtual {v1, v15, v2}, Lorg/uoyabause/android/n0;->K2(ILjava/lang/String;)V

    invoke-virtual {v1, v0}, Lorg/uoyabause/android/n0;->J2(Lorg/uoyabause/android/o0;)V

    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/j;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v2

    invoke-virtual {v1, v2, v5}, Landroidx/fragment/app/e;->G2(Landroidx/fragment/app/w;Ljava/lang/String;)V

    goto/16 :goto_5

    :sswitch_7
    iput-boolean v14, v0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    new-instance v1, Lorg/uoyabause/android/H0;

    invoke-direct {v1}, Lorg/uoyabause/android/H0;-><init>()V

    invoke-virtual {v1, v14}, Lorg/uoyabause/android/H0;->M2(I)V

    invoke-virtual {v1, v0}, Lorg/uoyabause/android/H0;->L2(Lorg/uoyabause/android/H0$b;)V

    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/j;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v2

    invoke-virtual {v1, v2, v4}, Landroidx/fragment/app/e;->G2(Landroidx/fragment/app/w;Ljava/lang/String;)V

    goto/16 :goto_5

    :sswitch_8
    iput-boolean v14, v0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    new-instance v1, Lorg/uoyabause/android/H0;

    invoke-direct {v1}, Lorg/uoyabause/android/H0;-><init>()V

    invoke-virtual {v1, v15}, Lorg/uoyabause/android/H0;->M2(I)V

    invoke-virtual {v1, v0}, Lorg/uoyabause/android/H0;->L2(Lorg/uoyabause/android/H0$b;)V

    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/j;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v2

    invoke-virtual {v1, v2, v4}, Landroidx/fragment/app/e;->G2(Landroidx/fragment/app/w;Ljava/lang/String;)V

    goto/16 :goto_5

    :sswitch_9
    iput-boolean v14, v0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/j;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/fragment/app/w;->o()Landroidx/fragment/app/F;

    move-result-object v1

    invoke-static {v1, v11}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v2, Lc8/p;->p0:Lc8/p$a;

    invoke-virtual {v2}, Lc8/p$a;->a()Lc8/p;

    move-result-object v2

    invoke-virtual {v1, v10, v9}, Landroidx/fragment/app/F;->s(II)Landroidx/fragment/app/F;

    invoke-virtual {v1, v8, v2, v3}, Landroidx/fragment/app/F;->r(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/F;

    invoke-virtual {v1, v2}, Landroidx/fragment/app/F;->w(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/F;

    invoke-virtual {v1}, Landroidx/fragment/app/F;->j()I

    goto/16 :goto_5

    :sswitch_a
    iput-boolean v14, v0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/j;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/fragment/app/w;->o()Landroidx/fragment/app/F;

    move-result-object v1

    invoke-static {v1, v11}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v2, Le8/t;->q0:Le8/t$a;

    sget-object v4, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {v4}, Lorg/uoyabause/android/YabauseRunnable$a;->m()Ljava/lang/String;

    move-result-object v4

    iget-object v5, v0, Lorg/uoyabause/android/Yabause;->cheat_codes:[Ljava/lang/String;

    invoke-virtual {v2, v4, v5}, Le8/t$a;->a(Ljava/lang/String;[Ljava/lang/String;)Le8/t;

    move-result-object v2

    invoke-virtual {v1, v10, v9}, Landroidx/fragment/app/F;->s(II)Landroidx/fragment/app/F;

    invoke-virtual {v1, v8, v2, v3}, Landroidx/fragment/app/F;->r(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/F;

    invoke-virtual {v1, v2}, Landroidx/fragment/app/F;->w(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/F;

    invoke-virtual {v1}, Landroidx/fragment/app/F;->j()I

    goto/16 :goto_5

    :sswitch_b
    iput-boolean v14, v0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/j;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/fragment/app/w;->o()Landroidx/fragment/app/F;

    move-result-object v1

    invoke-static {v1, v11}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    sget-object v2, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {v2}, Lorg/uoyabause/android/YabauseRunnable$a;->m()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_12

    iput-boolean v15, v0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    invoke-virtual {v2}, Lorg/uoyabause/android/YabauseRunnable$a;->F()V

    iget-object v1, v0, Lorg/uoyabause/android/Yabause;->audio:Lorg/uoyabause/android/F1;

    if-eqz v1, :cond_11

    invoke-virtual {v1, v14}, Lorg/uoyabause/android/F1;->b(I)V

    :cond_11
    return v14

    :cond_12
    new-instance v2, Lorg/uoyabause/android/k0;

    invoke-direct {v2, v3}, Lorg/uoyabause/android/k0;-><init>(Ljava/lang/String;)V

    new-instance v3, Lorg/uoyabause/android/Yabause$e;

    invoke-direct {v3, v0, v2}, Lorg/uoyabause/android/Yabause$e;-><init>(Lorg/uoyabause/android/Yabause;Lorg/uoyabause/android/k0;)V

    invoke-virtual {v2, v3}, Lorg/uoyabause/android/k0;->O2(Le6/s;)V

    invoke-virtual {v1, v10, v9}, Landroidx/fragment/app/F;->s(II)Landroidx/fragment/app/F;

    sget-object v3, Lorg/uoyabause/android/k0;->z0:Ljava/lang/String;

    invoke-virtual {v1, v8, v2, v3}, Landroidx/fragment/app/F;->r(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/F;

    invoke-virtual {v1}, Landroidx/fragment/app/F;->j()I

    goto/16 :goto_5

    :sswitch_c
    sget-object v1, Lorg/uoyabause/android/M1;->m:Lorg/uoyabause/android/M1$g;

    invoke-virtual {v1}, Lorg/uoyabause/android/M1$g;->e()Lorg/uoyabause/android/M1;

    move-result-object v1

    invoke-virtual {v1}, Lorg/uoyabause/android/M1;->z()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {v2}, Lorg/uoyabause/android/YabauseRunnable$a;->m()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-boolean v14, v0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/j;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/fragment/app/w;->o()Landroidx/fragment/app/F;

    move-result-object v2

    invoke-static {v2, v11}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v3, Lorg/uoyabause/android/Y0;

    invoke-direct {v3}, Lorg/uoyabause/android/Y0;-><init>()V

    invoke-virtual {v3, v1}, Lorg/uoyabause/android/Y0;->B2(Ljava/lang/String;)V

    invoke-virtual {v2, v10, v9}, Landroidx/fragment/app/F;->s(II)Landroidx/fragment/app/F;

    const-string v1, "StateListFragment"

    invoke-virtual {v2, v8, v3, v1}, Landroidx/fragment/app/F;->r(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/F;

    invoke-virtual {v2, v3}, Landroidx/fragment/app/F;->w(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/F;

    invoke-virtual {v2}, Landroidx/fragment/app/F;->j()I

    goto/16 :goto_5

    :sswitch_d
    iget-object v1, v0, Lorg/uoyabause/android/Yabause;->progressMessage:Landroid/widget/TextView;

    if-nez v1, :cond_13

    const-string v1, "progressMessage"

    invoke-static {v1}, LS6/l;->p(Ljava/lang/String;)V

    const/4 v1, 0x0

    :cond_13
    const-string v2, "Exiting..."

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Lorg/uoyabause/android/Yabause;->progressBar:Landroid/view/View;

    if-nez v1, :cond_14

    const-string v1, "progressBar"

    invoke-static {v1}, LS6/l;->p(Ljava/lang/String;)V

    const/4 v1, 0x0

    :cond_14
    invoke-virtual {v1, v15}, Landroid/view/View;->setVisibility(I)V

    iput-boolean v14, v0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lorg/uoyabause/android/j1;

    invoke-direct {v2, v0}, Lorg/uoyabause/android/j1;-><init>(Lorg/uoyabause/android/Yabause;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    goto :goto_5

    :sswitch_e
    iget-object v2, v0, Lorg/uoyabause/android/Yabause;->trayState:Lorg/uoyabause/android/Z0;

    sget-object v3, Lorg/uoyabause/android/Z0;->b:Lorg/uoyabause/android/Z0;

    if-ne v2, v3, :cond_15

    sget-object v2, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {v2}, Lorg/uoyabause/android/YabauseRunnable$a;->z()V

    const v2, 0x7f130069

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    sget-object v1, Lorg/uoyabause/android/Z0;->a:Lorg/uoyabause/android/Z0;

    iput-object v1, v0, Lorg/uoyabause/android/Yabause;->trayState:Lorg/uoyabause/android/Z0;

    goto :goto_5

    :cond_15
    const v2, 0x7f130230

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    iput-object v3, v0, Lorg/uoyabause/android/Yabause;->trayState:Lorg/uoyabause/android/Z0;

    iget-object v1, v0, Lorg/uoyabause/android/Yabause;->gamePath:Ljava/lang/String;

    if-eqz v1, :cond_16

    new-instance v1, Ljava/io/File;

    iget-object v2, v0, Lorg/uoyabause/android/Yabause;->gamePath:Ljava/lang/String;

    invoke-static {v2}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, LS6/l;->b(Ljava/lang/Object;)V

    goto :goto_4

    :cond_16
    sget-object v1, Lorg/uoyabause/android/M1;->m:Lorg/uoyabause/android/M1$g;

    invoke-virtual {v1}, Lorg/uoyabause/android/M1$g;->e()Lorg/uoyabause/android/M1;

    move-result-object v1

    invoke-virtual {v1}, Lorg/uoyabause/android/M1;->r()Ljava/lang/String;

    move-result-object v1

    :goto_4
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1d

    if-lt v2, v3, :cond_17

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v2, "android.intent.category.OPENABLE"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "*/*"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    iget v2, v0, Lorg/uoyabause/android/Yabause;->OPEN_FILE:I

    invoke-virtual {v0, v1, v2}, Landroidx/activity/j;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_5

    :cond_17
    new-instance v2, Lorg/uoyabause/android/D;

    invoke-direct {v2, v0, v1}, Lorg/uoyabause/android/D;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Lorg/uoyabause/android/D;->f(Lorg/uoyabause/android/D$c;)V

    invoke-virtual {v2}, Lorg/uoyabause/android/D;->q()V

    :cond_18
    :goto_5
    iget-object v1, v0, Lorg/uoyabause/android/Yabause;->drawerLayout:Landroidx/drawerlayout/widget/DrawerLayout;

    if-nez v1, :cond_19

    invoke-static {v7}, LS6/l;->p(Ljava/lang/String;)V

    const/4 v1, 0x0

    :cond_19
    const v2, 0x800003

    invoke-virtual {v1, v2}, Landroidx/drawerlayout/widget/DrawerLayout;->d(I)V

    return v14

    nop

    :sswitch_data_0
    .sparse-switch
        0x7f0a00ab -> :sswitch_e
        0x7f0a0155 -> :sswitch_d
        0x7f0a01fd -> :sswitch_c
        0x7f0a0230 -> :sswitch_b
        0x7f0a0231 -> :sswitch_a
        0x7f0a0232 -> :sswitch_9
        0x7f0a0236 -> :sswitch_8
        0x7f0a0237 -> :sswitch_7
        0x7f0a0238 -> :sswitch_6
        0x7f0a0239 -> :sswitch_5
        0x7f0a0299 -> :sswitch_4
        0x7f0a029a -> :sswitch_3
        0x7f0a02cf -> :sswitch_2
        0x7f0a02d7 -> :sswitch_1
        0x7f0a02e7 -> :sswitch_0
    .end sparse-switch
.end method

.method public onNewRecord(Ljava/lang/String;)V
    .locals 1

    const-string v0, "leaderBoardId"

    invoke-static {p1, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lorg/uoyabause/android/o1;

    invoke-direct {v0, p0, p1}, Lorg/uoyabause/android/o1;-><init>(Lorg/uoyabause/android/Yabause;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onPause()V
    .locals 3

    invoke-super {p0}, Landroidx/fragment/app/j;->onPause()V

    sget-object v0, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {v0}, Lorg/uoyabause/android/YabauseRunnable$a;->A()V

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->audio:Lorg/uoyabause/android/F1;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    invoke-virtual {v0, v1}, Lorg/uoyabause/android/F1;->a(I)V

    :cond_0
    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->inputManager:Landroid/hardware/input/InputManager;

    invoke-static {v0}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-virtual {v0, p0}, Landroid/hardware/input/InputManager;->unregisterInputDeviceListener(Landroid/hardware/input/InputManager$InputDeviceListener;)V

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->scope:Lc7/J;

    invoke-interface {v0}, Lc7/J;->A()LJ6/g;

    move-result-object v0

    const/4 v2, 0x0

    invoke-static {v0, v2, v1, v2}, Lc7/x0;->f(LJ6/g;Ljava/util/concurrent/CancellationException;ILjava/lang/Object;)V

    return-void
.end method

.method public onResume()V
    .locals 2

    invoke-super {p0}, Landroidx/fragment/app/j;->onResume()V

    invoke-direct {p0}, Lorg/uoyabause/android/Yabause;->signInSilently()V

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->tracker:Lx2/k;

    if-eqz v0, :cond_0

    invoke-static {v0}, LS6/l;->b(Ljava/lang/Object;)V

    const-string v1, "Yabause"

    invoke-virtual {v0, v1}, Lx2/k;->t(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->tracker:Lx2/k;

    invoke-static {v0}, LS6/l;->b(Ljava/lang/Object;)V

    new-instance v1, Lx2/h;

    invoke-direct {v1}, Lx2/h;-><init>()V

    invoke-virtual {v1}, Lx2/g;->a()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lx2/k;->o(Ljava/util/Map;)V

    :cond_0
    iget-boolean v0, p0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->audio:Lorg/uoyabause/android/F1;

    if-eqz v0, :cond_1

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/uoyabause/android/F1;->b(I)V

    :cond_1
    sget-object v0, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {v0}, Lorg/uoyabause/android/YabauseRunnable$a;->F()V

    :cond_2
    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->inputManager:Landroid/hardware/input/InputManager;

    invoke-static {v0}, LS6/l;->b(Ljava/lang/Object;)V

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Landroid/hardware/input/InputManager;->registerInputDeviceListener(Landroid/hardware/input/InputManager$InputDeviceListener;Landroid/os/Handler;)V

    return-void
.end method

.method public onSelected(ILjava/lang/String;Ljava/lang/String;)V
    .locals 10

    const v0, 0x7f0a03b6

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/d;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const-string v1, "null cannot be cast to non-null type org.uoyabause.android.YabausePad"

    invoke-static {v0, v1}, LS6/l;->c(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Lorg/uoyabause/android/YabausePad;

    const v1, 0x7f0a026a

    invoke-virtual {p0, v1}, Landroidx/appcompat/app/d;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const-string v2, "null cannot be cast to non-null type com.google.android.material.navigation.NavigationView"

    invoke-static {v1, v2}, LS6/l;->c(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Lcom/google/android/material/navigation/NavigationView;

    invoke-virtual {v1}, Lcom/google/android/material/navigation/NavigationView;->getMenu()Landroid/view/Menu;

    move-result-object v1

    const-string v2, "navigationView.menu"

    invoke-static {v1, v2}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    const v2, 0x7f0a0236

    invoke-interface {v1, v2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    const v3, 0x7f0a0237

    invoke-interface {v1, v3}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    sget-object v3, Lorg/uoyabause/android/x0;->d:Lorg/uoyabause/android/x0$a;

    invoke-virtual {v3}, Lorg/uoyabause/android/x0$a;->e()Lorg/uoyabause/android/x0;

    move-result-object v3

    invoke-static {v3}, LS6/l;->b(Ljava/lang/Object;)V

    iput-object v3, p0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    const-string v4, "padManager"

    const/4 v5, 0x0

    if-nez v3, :cond_0

    invoke-static {v4}, LS6/l;->p(Ljava/lang/String;)V

    move-object v3, v5

    :cond_0
    invoke-virtual {v3, p0}, Lorg/uoyabause/android/x0;->v(Lorg/uoyabause/android/x0$b;)V

    iget-object v3, p0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v3, :cond_1

    invoke-static {v4}, LS6/l;->p(Ljava/lang/String;)V

    move-object v3, v5

    :cond_1
    invoke-virtual {v3}, Lorg/uoyabause/android/x0;->h()I

    move-result v3

    const-string v6, "drawerLayout"

    const-string v7, "Yabause"

    const/4 v8, 0x0

    const/4 v9, 0x1

    if-lez v3, :cond_7

    const-string v3, "-1"

    invoke-static {p3, v3}, LS6/l;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    if-eqz p1, :cond_4

    if-eq p1, v9, :cond_2

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez p1, :cond_3

    invoke-static {v4}, LS6/l;->p(Ljava/lang/String;)V

    move-object p1, v5

    :cond_3
    invoke-virtual {p1, p3}, Lorg/uoyabause/android/x0;->u(Ljava/lang/String;)V

    invoke-interface {v1, p2}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    goto :goto_0

    :cond_4
    const-string p1, "ScreenPad Disable"

    invoke-static {v7, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v0, v8}, Lorg/uoyabause/android/YabausePad;->k(Z)V

    iget-object p1, p0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez p1, :cond_5

    invoke-static {v4}, LS6/l;->p(Ljava/lang/String;)V

    move-object p1, v5

    :cond_5
    invoke-virtual {p1, p3}, Lorg/uoyabause/android/x0;->t(Ljava/lang/String;)V

    invoke-interface {v2, p2}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    :goto_0
    iget-object p1, p0, Lorg/uoyabause/android/Yabause;->drawerLayout:Landroidx/drawerlayout/widget/DrawerLayout;

    if-nez p1, :cond_6

    invoke-static {v6}, LS6/l;->p(Ljava/lang/String;)V

    goto :goto_1

    :cond_6
    move-object v5, p1

    :goto_1
    invoke-virtual {v5, v8}, Landroidx/drawerlayout/widget/DrawerLayout;->setDrawerLockMode(I)V

    goto :goto_3

    :cond_7
    if-eqz p1, :cond_a

    if-eq p1, v9, :cond_8

    goto :goto_3

    :cond_8
    iget-object p1, p0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez p1, :cond_9

    invoke-static {v4}, LS6/l;->p(Ljava/lang/String;)V

    move-object p1, v5

    :cond_9
    invoke-virtual {p1, v5}, Lorg/uoyabause/android/x0;->u(Ljava/lang/String;)V

    const-string p1, "Disconnected"

    invoke-interface {v1, p1}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    goto :goto_3

    :cond_a
    invoke-virtual {v0}, Lorg/uoyabause/android/YabausePad;->o()V

    invoke-virtual {v0, v9}, Lorg/uoyabause/android/YabausePad;->k(Z)V

    const p1, 0x7f13022d

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v2, p1}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    const-string p1, "ScreenPad Enable"

    invoke-static {v7, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez p1, :cond_b

    invoke-static {v4}, LS6/l;->p(Ljava/lang/String;)V

    move-object p1, v5

    :cond_b
    invoke-virtual {p1, v5}, Lorg/uoyabause/android/x0;->t(Ljava/lang/String;)V

    iget-object p1, p0, Lorg/uoyabause/android/Yabause;->drawerLayout:Landroidx/drawerlayout/widget/DrawerLayout;

    if-nez p1, :cond_c

    invoke-static {v6}, LS6/l;->p(Ljava/lang/String;)V

    goto :goto_2

    :cond_c
    move-object v5, p1

    :goto_2
    invoke-virtual {v5, v9}, Landroidx/drawerlayout/widget/DrawerLayout;->setDrawerLockMode(I)V

    :goto_3
    invoke-virtual {p0}, Lorg/uoyabause/android/Yabause;->updateInputDevice()V

    iput-boolean v8, p0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    invoke-direct {p0}, Lorg/uoyabause/android/Yabause;->toggleMenu()V

    return-void
.end method

.method public onStop()V
    .locals 3

    invoke-static {p0}, Landroidx/preference/k;->b(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "pref_auto_state_save"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    invoke-super {p0}, Landroidx/appcompat/app/d;->onStop()V

    return-void
.end method

.method public onTrimMemory(I)V
    .locals 0

    invoke-super {p0, p1}, Landroidx/activity/j;->onTrimMemory(I)V

    return-void
.end method

.method public onUpdateAnalogDpad(Z)V
    .locals 1

    invoke-static {p0}, Landroidx/preference/k;->b(Landroid/content/Context;)Landroid/content/SharedPreferences;

    const v0, 0x7f0a01cd

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/d;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_0
    const/16 p1, 0x8

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    :goto_0
    return-void
.end method

.method public onUpdateTransparency(F)V
    .locals 1

    const v0, 0x7f0a01cd

    invoke-virtual {p0, v0}, Landroidx/appcompat/app/d;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    :goto_0
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 1

    invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Landroidx/fragment/app/j;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object p1

    const v0, 0x7f0a0159

    invoke-virtual {p1, v0}, Landroidx/fragment/app/w;->g0(I)Landroidx/fragment/app/Fragment;

    move-result-object p1

    if-nez p1, :cond_0

    invoke-virtual {p0}, Landroidx/appcompat/app/d;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    invoke-virtual {p0, p1}, Lorg/uoyabause/android/Yabause;->updateViewLayout(I)V

    :cond_0
    return-void
.end method

.method public final setCheat_codes([Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lorg/uoyabause/android/Yabause;->cheat_codes:[Ljava/lang/String;

    return-void
.end method

.method public final setCurrentDocumentUri(Landroid/net/Uri;)V
    .locals 0

    iput-object p1, p0, Lorg/uoyabause/android/Yabause;->currentDocumentUri:Landroid/net/Uri;

    return-void
.end method

.method public final setCurrentGame(Lf8/a;)V
    .locals 0

    iput-object p1, p0, Lorg/uoyabause/android/Yabause;->currentGame:Lf8/a;

    return-void
.end method

.method public final setLoadStateObserver(Le6/s;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Le6/s;",
            ")V"
        }
    .end annotation

    const-string v0, "loadStateObserver"

    invoke-static {p1, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lorg/uoyabause/android/v1;

    invoke-direct {v0}, Lorg/uoyabause/android/v1;-><init>()V

    invoke-static {v0}, Le6/o;->h(Le6/q;)Le6/o;

    move-result-object v0

    invoke-static {}, LC6/a;->a()Le6/t;

    move-result-object v1

    invoke-virtual {v0, v1}, Le6/o;->t(Le6/t;)Le6/o;

    move-result-object v0

    invoke-static {}, Lg6/a;->a()Le6/t;

    move-result-object v1

    invoke-virtual {v0, v1}, Le6/o;->o(Le6/t;)Le6/o;

    move-result-object v0

    invoke-virtual {v0, p1}, Le6/o;->d(Le6/s;)V

    return-void
.end method

.method public final setLoginEmitter(Le6/p;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Le6/p;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Lorg/uoyabause/android/Yabause;->loginEmitter:Le6/p;

    return-void
.end method

.method public final setMParcelFileDescriptor(Landroid/os/ParcelFileDescriptor;)V
    .locals 0

    iput-object p1, p0, Lorg/uoyabause/android/Yabause;->mParcelFileDescriptor:Landroid/os/ParcelFileDescriptor;

    return-void
.end method

.method public final setSaveStateObserver(Le6/s;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Le6/s;",
            ")V"
        }
    .end annotation

    const-string v0, "saveStateObserver"

    invoke-static {p1, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v0, Lorg/uoyabause/android/k1;

    invoke-direct {v0}, Lorg/uoyabause/android/k1;-><init>()V

    invoke-static {v0}, Le6/o;->h(Le6/q;)Le6/o;

    move-result-object v0

    invoke-static {}, LC6/a;->a()Le6/t;

    move-result-object v1

    invoke-virtual {v0, v1}, Le6/o;->t(Le6/t;)Le6/o;

    move-result-object v0

    invoke-static {}, Lg6/a;->a()Le6/t;

    move-result-object v1

    invoke-virtual {v0, v1}, Le6/o;->o(Le6/t;)Le6/o;

    move-result-object v0

    invoke-virtual {v0, p1}, Le6/o;->d(Le6/s;)V

    return-void
.end method

.method public final setSubFileDescripters(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/os/ParcelFileDescriptor;",
            ">;)V"
        }
    .end annotation

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, LS6/l;->e(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object p1, p0, Lorg/uoyabause/android/Yabause;->subFileDescripters:Ljava/util/List;

    return-void
.end method

.method public show()V
    .locals 2

    sget-object v0, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {v0}, Lorg/uoyabause/android/YabauseRunnable$a;->t()I

    move-result v1

    if-nez v1, :cond_0

    const-string v1, ""

    invoke-virtual {v0, v1}, Lorg/uoyabause/android/YabauseRunnable$a;->I(Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lorg/uoyabause/android/Yabause;->toggleMenu()V

    :goto_0
    return-void
.end method

.method public final showAutoStateLoadDialog()V
    .locals 11

    sget-object v0, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {v0}, Lorg/uoyabause/android/YabauseRunnable$a;->m()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    sget-object v1, Lorg/uoyabause/android/M1;->m:Lorg/uoyabause/android/M1$g;

    invoke-virtual {v1}, Lorg/uoyabause/android/M1$g;->e()Lorg/uoyabause/android/M1;

    move-result-object v1

    invoke-virtual {v1}, Lorg/uoyabause/android/M1;->z()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/String;

    invoke-static {v0, v2}, Lorg/uoyabause/android/a1;->a(Ljava/lang/String;[Ljava/lang/String;)Ljava/nio/file/Path;

    move-result-object v0

    invoke-static {v0}, LH7/c;->a(Ljava/nio/file/Path;)Ljava/io/File;

    move-result-object v0

    new-instance v2, Lorg/uoyabause/android/z1;

    invoke-direct {v2}, Lorg/uoyabause/android/z1;-><init>()V

    invoke-virtual {v0, v2}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_5

    array-length v2, v0

    const/4 v3, 0x0

    if-nez v2, :cond_1

    move-object v2, v3

    goto :goto_1

    :cond_1
    aget-object v2, v0, v1

    invoke-static {v0}, LG6/i;->w([Ljava/lang/Object;)I

    move-result v4

    if-nez v4, :cond_2

    goto :goto_1

    :cond_2
    invoke-virtual {v2}, Ljava/io/File;->lastModified()J

    move-result-wide v5

    new-instance v7, LX6/f;

    const/4 v8, 0x1

    invoke-direct {v7, v8, v4}, LX6/f;-><init>(II)V

    invoke-virtual {v7}, LX6/d;->e()LG6/F;

    move-result-object v4

    :cond_3
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-virtual {v4}, LG6/F;->b()I

    move-result v7

    aget-object v7, v0, v7

    invoke-virtual {v7}, Ljava/io/File;->lastModified()J

    move-result-wide v8

    cmp-long v10, v5, v8

    if-gez v10, :cond_3

    move-object v2, v7

    move-wide v5, v8

    goto :goto_0

    :cond_4
    :goto_1
    if-eqz v2, :cond_5

    new-instance v0, Landroidx/appcompat/app/c$a;

    invoke-direct {v0, p0}, Landroidx/appcompat/app/c$a;-><init>(Landroid/content/Context;)V

    const v4, 0x7f130035

    invoke-virtual {v0, v4}, Landroidx/appcompat/app/c$a;->t(I)Landroidx/appcompat/app/c$a;

    const v4, 0x7f130034

    invoke-virtual {v0, v4}, Landroidx/appcompat/app/c$a;->g(I)Landroidx/appcompat/app/c$a;

    invoke-virtual {p0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v4

    const-string v5, "layoutInflater"

    invoke-static {v4, v5}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    const v5, 0x7f0d00fc

    invoke-virtual {v4, v5, v3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/c$a;->v(Landroid/view/View;)Landroidx/appcompat/app/c$a;

    invoke-virtual {v0}, Landroidx/appcompat/app/c$a;->a()Landroidx/appcompat/app/c;

    move-result-object v0

    const-string v3, "builder.create()"

    invoke-static {v0, v3}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    const v3, 0x7f0a02c3

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    new-instance v4, Lorg/uoyabause/android/A1;

    invoke-direct {v4, v2, v0}, Lorg/uoyabause/android/A1;-><init>(Ljava/io/File;Landroidx/appcompat/app/c;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v4, 0x7f0a02c5

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Button;

    new-instance v5, Lorg/uoyabause/android/B1;

    invoke-direct {v5, v2, v0}, Lorg/uoyabause/android/B1;-><init>(Ljava/io/File;Landroidx/appcompat/app/c;)V

    invoke-virtual {v4, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v2, Lorg/uoyabause/android/C1;

    invoke-direct {v2, v3, v1, v4, v0}, Lorg/uoyabause/android/C1;-><init>(Landroid/widget/Button;Landroid/view/View;Landroid/widget/Button;Landroidx/appcompat/app/c;)V

    invoke-virtual {v0, v2}, Landroid/app/Dialog;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    :cond_5
    return-void
.end method

.method public final showDialog()V
    .locals 3

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->progressMessage:Landroid/widget/TextView;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "progressMessage"

    invoke-static {v0}, LS6/l;->p(Ljava/lang/String;)V

    move-object v0, v1

    :cond_0
    const-string v2, "Sending..."

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lorg/uoyabause/android/Yabause;->progressBar:Landroid/view/View;

    if-nez v0, :cond_1

    const-string v0, "progressBar"

    invoke-static {v0}, LS6/l;->p(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    move-object v1, v0

    :goto_0
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    return-void
.end method

.method public final startReport()V
    .locals 3

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    new-instance v0, Lorg/uoyabause/android/D0;

    invoke-direct {v0}, Lorg/uoyabause/android/D0;-><init>()V

    invoke-virtual {p0}, Landroidx/fragment/app/j;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v1

    const-string v2, "Report"

    invoke-virtual {v0, v1, v2}, Landroidx/fragment/app/e;->G2(Landroidx/fragment/app/w;Ljava/lang/String;)V

    return-void
.end method

.method public final updateCheatCode([Ljava/lang/String;)V
    .locals 10

    iput-object p1, p0, Lorg/uoyabause/android/Yabause;->cheat_codes:[Ljava/lang/String;

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz p1, :cond_7

    array-length v3, p1

    if-nez v3, :cond_0

    goto/16 :goto_6

    :cond_0
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    array-length v4, p1

    move v5, v2

    :goto_0
    if-ge v5, v4, :cond_6

    aget-object v6, p1, v5

    if-eqz v6, :cond_3

    new-instance v7, La7/f;

    const-string v8, "\n"

    invoke-direct {v7, v8}, La7/f;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v6, v2}, La7/f;->d(Ljava/lang/CharSequence;I)Ljava/util/List;

    move-result-object v6

    if-eqz v6, :cond_3

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_2

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v7

    invoke-interface {v6, v7}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v7

    :goto_1
    invoke-interface {v7}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v7}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-interface {v8}, Ljava/lang/CharSequence;->length()I

    move-result v8

    if-nez v8, :cond_1

    goto :goto_1

    :cond_1
    check-cast v6, Ljava/lang/Iterable;

    invoke-interface {v7}, Ljava/util/ListIterator;->nextIndex()I

    move-result v7

    add-int/2addr v7, v1

    invoke-static {v6, v7}, LG6/p;->g0(Ljava/lang/Iterable;I)Ljava/util/List;

    move-result-object v6

    goto :goto_2

    :cond_2
    invoke-static {}, LG6/p;->j()Ljava/util/List;

    move-result-object v6

    :goto_2
    if-eqz v6, :cond_3

    check-cast v6, Ljava/util/Collection;

    new-array v7, v2, [Ljava/lang/String;

    invoke-interface {v6, v7}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/String;

    goto :goto_3

    :cond_3
    move-object v6, v0

    :goto_3
    if-eqz v6, :cond_4

    invoke-static {v6}, LG6/i;->v([Ljava/lang/Object;)LX6/f;

    move-result-object v7

    goto :goto_4

    :cond_4
    move-object v7, v0

    :goto_4
    invoke-static {v7}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-virtual {v7}, LX6/d;->b()I

    move-result v8

    invoke-virtual {v7}, LX6/d;->c()I

    move-result v7

    if-gt v8, v7, :cond_5

    :goto_5
    aget-object v9, v6, v8

    invoke-virtual {v3, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-eq v8, v7, :cond_5

    add-int/lit8 v8, v8, 0x1

    goto :goto_5

    :cond_5
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_6
    sget-object p1, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    new-array v0, v2, [Ljava/lang/String;

    invoke-interface {v3, v0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    invoke-virtual {p1, v0}, Lorg/uoyabause/android/YabauseRunnable$a;->a0([Ljava/lang/String;)V

    goto :goto_7

    :cond_7
    :goto_6
    sget-object p1, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {p1, v0}, Lorg/uoyabause/android/YabauseRunnable$a;->a0([Ljava/lang/String;)V

    :goto_7
    iget-boolean p1, p0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    if-eqz p1, :cond_8

    iput-boolean v2, p0, Lorg/uoyabause/android/Yabause;->waitingResult:Z

    iput-boolean v2, p0, Lorg/uoyabause/android/Yabause;->menu_showing:Z

    const p1, 0x7f0a03b7

    invoke-virtual {p0, p1}, Landroidx/appcompat/app/d;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const-string v0, "null cannot be cast to non-null type android.view.View"

    invoke-static {p1, v0}, LS6/l;->c(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    sget-object p1, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {p1}, Lorg/uoyabause/android/YabauseRunnable$a;->F()V

    iget-object p1, p0, Lorg/uoyabause/android/Yabause;->audio:Lorg/uoyabause/android/F1;

    if-eqz p1, :cond_8

    invoke-virtual {p1, v1}, Lorg/uoyabause/android/F1;->b(I)V

    :cond_8
    return-void
.end method

.method public final updateInputDevice()V
    .locals 16

    move-object/from16 v0, p0

    invoke-static/range {p0 .. p0}, Landroidx/preference/k;->b(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const v2, 0x7f0a026a

    invoke-virtual {v0, v2}, Landroidx/appcompat/app/d;->findViewById(I)Landroid/view/View;

    move-result-object v2

    const-string v3, "null cannot be cast to non-null type com.google.android.material.navigation.NavigationView"

    invoke-static {v2, v3}, LS6/l;->c(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v2, Lcom/google/android/material/navigation/NavigationView;

    invoke-virtual {v2}, Lcom/google/android/material/navigation/NavigationView;->getMenu()Landroid/view/Menu;

    move-result-object v2

    const-string v3, "navigationView.menu"

    invoke-static {v2, v3}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    const v3, 0x7f0a0236

    invoke-interface {v2, v3}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    const v4, 0x7f0a03b6

    invoke-virtual {v0, v4}, Landroidx/appcompat/app/d;->findViewById(I)Landroid/view/View;

    move-result-object v5

    const-string v6, "null cannot be cast to non-null type org.uoyabause.android.YabausePad"

    invoke-static {v5, v6}, LS6/l;->c(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v5, Lorg/uoyabause/android/YabausePad;

    const-string v7, "pref_player1_inputdevice"

    const/4 v8, 0x0

    sget-object v8, Lcom/google/firebase/crashlytics/ndk/DJGE/GDsDgxXVixT;->avDcPbgjyhw:Ljava/lang/String;

    invoke-interface {v1, v7, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    sget-object v10, Lorg/uoyabause/android/x0;->d:Lorg/uoyabause/android/x0$a;

    invoke-virtual {v10}, Lorg/uoyabause/android/x0$a;->e()Lorg/uoyabause/android/x0;

    move-result-object v10

    invoke-static {v10}, LS6/l;->b(Ljava/lang/Object;)V

    iput-object v10, v0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    const-string v11, "padManager"

    const/4 v12, 0x0

    if-nez v10, :cond_0

    invoke-static {v11}, LS6/l;->p(Ljava/lang/String;)V

    move-object v10, v12

    :cond_0
    invoke-virtual {v10, v0}, Lorg/uoyabause/android/x0;->v(Lorg/uoyabause/android/x0$b;)V

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "input "

    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    const-string v13, "Yabause"

    invoke-static {v13, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v9, v8}, LS6/l;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    const-string v14, "-1"

    const/4 v15, 0x0

    if-eqz v10, :cond_6

    iget-object v9, v0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v9, :cond_1

    invoke-static {v11}, LS6/l;->p(Ljava/lang/String;)V

    move-object v9, v12

    :cond_1
    invoke-virtual {v9}, Lorg/uoyabause/android/x0;->h()I

    move-result v9

    if-lez v9, :cond_5

    iget-object v9, v0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v9, :cond_2

    invoke-static {v11}, LS6/l;->p(Ljava/lang/String;)V

    move-object v9, v12

    :cond_2
    invoke-virtual {v9, v12}, Lorg/uoyabause/android/x0;->t(Ljava/lang/String;)V

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    iget-object v10, v0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v10, :cond_3

    invoke-static {v11}, LS6/l;->p(Ljava/lang/String;)V

    move-object v10, v12

    :cond_3
    invoke-virtual {v10, v15}, Lorg/uoyabause/android/x0;->i(I)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v9, v7, v10}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v9}, Landroid/content/SharedPreferences$Editor;->commit()Z

    iget-object v7, v0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v7, :cond_4

    invoke-static {v11}, LS6/l;->p(Ljava/lang/String;)V

    move-object v7, v12

    :cond_4
    invoke-virtual {v7, v15}, Lorg/uoyabause/android/x0;->i(I)Ljava/lang/String;

    move-result-object v7

    move-object v9, v7

    goto :goto_0

    :cond_5
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v9

    invoke-interface {v9, v7, v14}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v9}, Landroid/content/SharedPreferences$Editor;->commit()Z

    move-object v9, v14

    :cond_6
    :goto_0
    iget-object v7, v0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v7, :cond_7

    invoke-static {v11}, LS6/l;->p(Ljava/lang/String;)V

    move-object v7, v12

    :cond_7
    invoke-virtual {v7}, Lorg/uoyabause/android/x0;->h()I

    move-result v7

    const-string v10, "drawerLayout"

    const/4 v4, 0x1

    if-lez v7, :cond_f

    invoke-static {v9, v14}, LS6/l;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_f

    invoke-virtual {v5, v15}, Lorg/uoyabause/android/YabausePad;->k(Z)V

    const-string v5, "ScreenPad Disable"

    invoke-static {v13, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v5, v0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v5, :cond_8

    invoke-static {v11}, LS6/l;->p(Ljava/lang/String;)V

    move-object v5, v12

    :cond_8
    invoke-virtual {v5, v9}, Lorg/uoyabause/android/x0;->t(Ljava/lang/String;)V

    iget-object v5, v0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v5, :cond_9

    invoke-static {v11}, LS6/l;->p(Ljava/lang/String;)V

    move-object v5, v12

    :cond_9
    invoke-virtual {v5}, Lorg/uoyabause/android/x0;->h()I

    move-result v5

    move v7, v15

    :goto_1
    if-ge v7, v5, :cond_d

    iget-object v13, v0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v13, :cond_a

    invoke-static {v11}, LS6/l;->p(Ljava/lang/String;)V

    move-object v13, v12

    :cond_a
    invoke-virtual {v13, v7}, Lorg/uoyabause/android/x0;->i(I)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13, v9}, LS6/l;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_c

    iget-object v13, v0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v13, :cond_b

    invoke-static {v11}, LS6/l;->p(Ljava/lang/String;)V

    move-object v13, v12

    :cond_b
    invoke-virtual {v13, v7}, Lorg/uoyabause/android/x0;->j(I)Ljava/lang/String;

    move-result-object v13

    invoke-interface {v3, v13}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    :cond_c
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    :cond_d
    iget-object v3, v0, Lorg/uoyabause/android/Yabause;->drawerLayout:Landroidx/drawerlayout/widget/DrawerLayout;

    if-nez v3, :cond_e

    invoke-static {v10}, LS6/l;->p(Ljava/lang/String;)V

    move-object v3, v12

    :cond_e
    invoke-virtual {v3, v15}, Landroidx/drawerlayout/widget/DrawerLayout;->setDrawerLockMode(I)V

    goto :goto_2

    :cond_f
    invoke-virtual {v5, v4}, Lorg/uoyabause/android/YabausePad;->k(Z)V

    const-string v5, "ScreenPad Enable"

    invoke-static {v13, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v5, v0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v5, :cond_10

    invoke-static {v11}, LS6/l;->p(Ljava/lang/String;)V

    move-object v5, v12

    :cond_10
    invoke-virtual {v5, v12}, Lorg/uoyabause/android/x0;->t(Ljava/lang/String;)V

    const v5, 0x7f13022d

    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    iget-object v3, v0, Lorg/uoyabause/android/Yabause;->drawerLayout:Landroidx/drawerlayout/widget/DrawerLayout;

    if-nez v3, :cond_11

    invoke-static {v10}, LS6/l;->p(Ljava/lang/String;)V

    move-object v3, v12

    :cond_11
    invoke-virtual {v3, v4}, Landroidx/drawerlayout/widget/DrawerLayout;->setDrawerLockMode(I)V

    :goto_2
    const-string v3, "pref_player2_inputdevice"

    invoke-interface {v1, v3, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const v5, 0x7f0a0237

    invoke-interface {v2, v5}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v5

    iget-object v7, v0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v7, :cond_12

    invoke-static {v11}, LS6/l;->p(Ljava/lang/String;)V

    move-object v7, v12

    :cond_12
    invoke-virtual {v7, v12}, Lorg/uoyabause/android/x0;->u(Ljava/lang/String;)V

    const-string v7, "Disconnected"

    invoke-interface {v5, v7}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    const v7, 0x7f0a029a

    invoke-interface {v2, v7}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v10

    invoke-interface {v10, v15}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    const v10, 0x7f0a0239

    invoke-interface {v2, v10}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v13

    invoke-interface {v13, v15}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    invoke-static {v9, v8}, LS6/l;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_18

    invoke-static {v9, v14}, LS6/l;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_18

    iget-object v8, v0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v8, :cond_13

    invoke-static {v11}, LS6/l;->p(Ljava/lang/String;)V

    move-object v8, v12

    :cond_13
    invoke-virtual {v8}, Lorg/uoyabause/android/x0;->h()I

    move-result v8

    move v9, v15

    :goto_3
    if-ge v9, v8, :cond_18

    iget-object v13, v0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v13, :cond_14

    invoke-static {v11}, LS6/l;->p(Ljava/lang/String;)V

    move-object v13, v12

    :cond_14
    invoke-virtual {v13, v9}, Lorg/uoyabause/android/x0;->i(I)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13, v3}, LS6/l;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_17

    iget-object v13, v0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v13, :cond_15

    invoke-static {v11}, LS6/l;->p(Ljava/lang/String;)V

    move-object v13, v12

    :cond_15
    invoke-virtual {v13, v3}, Lorg/uoyabause/android/x0;->u(Ljava/lang/String;)V

    iget-object v13, v0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v13, :cond_16

    invoke-static {v11}, LS6/l;->p(Ljava/lang/String;)V

    move-object v13, v12

    :cond_16
    invoke-virtual {v13, v9}, Lorg/uoyabause/android/x0;->j(I)Ljava/lang/String;

    move-result-object v13

    invoke-interface {v5, v13}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    invoke-interface {v2, v7}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v13

    invoke-interface {v13, v4}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    invoke-interface {v2, v10}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v13

    invoke-interface {v13, v4}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_17
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    :cond_18
    const-string v3, "pref_analog_pad"

    invoke-static {v0, v3}, LK1/b;->g(Landroid/content/Context;Ljava/lang/String;)Landroid/content/SharedPreferences;

    move-result-object v5

    invoke-interface {v5, v3, v15}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    const v8, 0x7f0a03b6

    invoke-virtual {v0, v8}, Landroidx/appcompat/app/d;->findViewById(I)Landroid/view/View;

    move-result-object v8

    invoke-static {v8, v6}, LS6/l;->c(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v8, Lorg/uoyabause/android/YabausePad;

    if-eqz v3, :cond_1a

    iget-object v6, v0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v6, :cond_19

    invoke-static {v11}, LS6/l;->p(Ljava/lang/String;)V

    move-object v6, v12

    :cond_19
    invoke-virtual {v6, v4}, Lorg/uoyabause/android/x0;->r(I)V

    sget-object v6, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {v6, v4}, Lorg/uoyabause/android/YabauseRunnable$a;->X(I)V

    invoke-virtual {v8, v4}, Lorg/uoyabause/android/YabausePad;->setPadMode(I)V

    goto :goto_4

    :cond_1a
    iget-object v6, v0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v6, :cond_1b

    invoke-static {v11}, LS6/l;->p(Ljava/lang/String;)V

    move-object v6, v12

    :cond_1b
    invoke-virtual {v6, v15}, Lorg/uoyabause/android/x0;->r(I)V

    sget-object v6, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {v6, v15}, Lorg/uoyabause/android/YabauseRunnable$a;->X(I)V

    invoke-virtual {v8, v15}, Lorg/uoyabause/android/YabausePad;->setPadMode(I)V

    :goto_4
    const v6, 0x7f0a0299

    invoke-interface {v2, v6}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v6

    invoke-interface {v6, v3}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    const-string v3, "pref_analog_pad2"

    invoke-interface {v5, v3, v15}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_1d

    iget-object v5, v0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v5, :cond_1c

    invoke-static {v11}, LS6/l;->p(Ljava/lang/String;)V

    move-object v5, v12

    :cond_1c
    invoke-virtual {v5, v4}, Lorg/uoyabause/android/x0;->s(I)V

    sget-object v5, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {v5, v4}, Lorg/uoyabause/android/YabauseRunnable$a;->Y(I)V

    goto :goto_5

    :cond_1d
    iget-object v4, v0, Lorg/uoyabause/android/Yabause;->padManager:Lorg/uoyabause/android/x0;

    if-nez v4, :cond_1e

    invoke-static {v11}, LS6/l;->p(Ljava/lang/String;)V

    move-object v4, v12

    :cond_1e
    invoke-virtual {v4, v15}, Lorg/uoyabause/android/x0;->s(I)V

    sget-object v4, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-virtual {v4, v15}, Lorg/uoyabause/android/YabauseRunnable$a;->Y(I)V

    :goto_5
    invoke-interface {v2, v7}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    const-string v2, "scsp_time_sync_mode"

    const-string v3, "1"

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1f

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    :cond_1f
    sget-object v1, Lorg/uoyabause/android/YabauseRunnable;->c:Lorg/uoyabause/android/YabauseRunnable$a;

    invoke-static {v12}, LS6/l;->b(Ljava/lang/Object;)V

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v1, v2}, Lorg/uoyabause/android/YabauseRunnable$a;->S(I)V

    return-void
.end method

.method public final updateViewLayout(I)V
    .locals 8

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const v1, 0x7f060023

    invoke-static {p0, v1}, Landroidx/core/content/a;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/Window;->setStatusBarColor(I)V

    invoke-static {p0}, Landroidx/preference/k;->b(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "pref_immersive_mode"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_0

    const/16 v3, 0x1402

    goto :goto_0

    :cond_0
    move v3, v2

    :goto_0
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v4

    invoke-virtual {v4}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v4

    const-string v5, "window.decorView"

    invoke-static {v4, v5}, LS6/l;->d(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v5, 0x1

    const/16 v6, 0x1e

    const/4 v7, 0x2

    if-eq p1, v5, :cond_6

    if-eq p1, v7, :cond_1

    goto/16 :goto_3

    :cond_1
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p1, v6, :cond_5

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-static {p1}, Landroidx/core/view/a1;->a(Landroid/view/Window;)Landroid/view/WindowInsetsController;

    move-result-object p1

    if-nez p1, :cond_2

    goto :goto_1

    :cond_2
    invoke-static {p1, v7}, Lorg/uoyabause/android/b1;->a(Landroid/view/WindowInsetsController;I)V

    :goto_1
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-static {p1}, Landroidx/core/view/a1;->a(Landroid/view/Window;)Landroid/view/WindowInsetsController;

    move-result-object p1

    if-eqz p1, :cond_a

    invoke-static {}, Landroidx/core/view/S0;->a()I

    move-result v0

    invoke-static {}, Landroidx/core/view/T0;->a()I

    move-result v1

    or-int/2addr v0, v1

    invoke-static {p1, v0}, Lorg/uoyabause/android/c1;->a(Landroid/view/WindowInsetsController;I)V

    goto/16 :goto_3

    :cond_3
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-static {p1}, Landroidx/core/view/a1;->a(Landroid/view/Window;)Landroid/view/WindowInsetsController;

    move-result-object p1

    if-eqz p1, :cond_4

    invoke-static {}, Landroidx/core/view/S0;->a()I

    move-result v0

    invoke-static {}, Landroidx/core/view/T0;->a()I

    move-result v1

    or-int/2addr v0, v1

    invoke-static {p1, v0}, Lorg/uoyabause/android/c1;->a(Landroid/view/WindowInsetsController;I)V

    :cond_4
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-static {p1}, Landroidx/core/view/a1;->a(Landroid/view/Window;)Landroid/view/WindowInsetsController;

    move-result-object p1

    if-eqz p1, :cond_a

    invoke-static {}, Landroidx/core/view/T0;->a()I

    move-result v0

    invoke-static {p1, v0}, Landroidx/core/view/T;->a(Landroid/view/WindowInsetsController;I)V

    goto :goto_3

    :cond_5
    or-int/lit16 p1, v3, 0x1504

    invoke-virtual {v4, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    goto :goto_3

    :cond_6
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p1, v6, :cond_9

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-static {p1}, Landroidx/core/view/a1;->a(Landroid/view/Window;)Landroid/view/WindowInsetsController;

    move-result-object p1

    if-nez p1, :cond_7

    goto :goto_2

    :cond_7
    invoke-static {p1, v7}, Lorg/uoyabause/android/b1;->a(Landroid/view/WindowInsetsController;I)V

    :goto_2
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_8

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-static {p1}, Landroidx/core/view/a1;->a(Landroid/view/Window;)Landroid/view/WindowInsetsController;

    move-result-object p1

    if-eqz p1, :cond_a

    invoke-static {}, Landroidx/core/view/S0;->a()I

    move-result v0

    invoke-static {}, Landroidx/core/view/T0;->a()I

    move-result v1

    or-int/2addr v0, v1

    invoke-static {p1, v0}, Lorg/uoyabause/android/c1;->a(Landroid/view/WindowInsetsController;I)V

    goto :goto_3

    :cond_8
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-static {p1}, Landroidx/core/view/a1;->a(Landroid/view/Window;)Landroid/view/WindowInsetsController;

    move-result-object p1

    if-eqz p1, :cond_a

    invoke-static {}, Landroidx/core/view/S0;->a()I

    move-result v0

    invoke-static {}, Landroidx/core/view/T0;->a()I

    move-result v1

    or-int/2addr v0, v1

    invoke-static {p1, v0}, Landroidx/core/view/T;->a(Landroid/view/WindowInsetsController;I)V

    goto :goto_3

    :cond_9
    or-int/lit16 p1, v3, 0x100

    invoke-virtual {v4, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    :cond_a
    :goto_3
    return-void
.end method

#-------------------------------------------------------------------------------------------------
#invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

.method public static getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    .locals 14

    const/4 v10, 0x0

    const-string v11, "storage"

    invoke-virtual {p0, v11}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/os/storage/StorageManager;

    .local v7, "storageManager":Landroid/os/storage/StorageManager;
    :try_start_0
    sget v11, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v12, 0x18

    if-lt v11, v12, :cond_2

    invoke-virtual {v7}, Landroid/os/storage/StorageManager;->getStorageVolumes()Ljava/util/List;

    move-result-object v4

    .local v4, "list":Ljava/util/List;, "Ljava/util/List<Landroid/os/storage/StorageVolume;>;"
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-nez v11, :cond_1

    .end local v4    # "list":Ljava/util/List;, "Ljava/util/List<Landroid/os/storage/StorageVolume;>;"
    :goto_0
    const/4 v10, 0x0

    :goto_1
    return-object v10

    .restart local v4    # "list":Ljava/util/List;, "Ljava/util/List<Landroid/os/storage/StorageVolume;>;"
    :cond_1
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/os/storage/StorageVolume;

    .local v8, "volume":Landroid/os/storage/StorageVolume;
    invoke-virtual {v8}, Landroid/os/storage/StorageVolume;->isRemovable()Z

    move-result v11

    if-eqz v11, :cond_0

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    const-string v11, "getPath"

    const/4 v12, 0x0

    new-array v12, v12, [Ljava/lang/Class;

    invoke-virtual {v10, v11, v12}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .local v5, "method":Ljava/lang/reflect/Method;
    const/4 v10, 0x0

    new-array v10, v10, [Ljava/lang/Object;

    invoke-virtual {v5, v8, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    goto :goto_1

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

    .local v2, "getVolumePathsMethod":Ljava/lang/reflect/Method;
    const/4 v11, 0x1

    invoke-virtual {v2, v11}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    const/4 v11, 0x0

    new-array v11, v11, [Ljava/lang/Object;

    invoke-virtual {v2, v7, v11}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .local v3, "invokes":Ljava/lang/Object;
    move-object v0, v3

    check-cast v0, [Ljava/lang/String;

    move-object v9, v0

    .local v9, "volumePaths":[Ljava/lang/String;
    array-length v11, v9

    :goto_2
    if-lt v10, v11, :cond_3

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v10

    invoke-virtual {v10}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v10

    goto :goto_1

    :cond_3
    aget-object v6, v9, v10

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

    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    :cond_4
    move-object v10, v6

    goto :goto_1

    .end local v2    # "getVolumePathsMethod":Ljava/lang/reflect/Method;
    .end local v3    # "invokes":Ljava/lang/Object;
    .end local v6    # "path":Ljava/lang/String;
    .end local v9    # "volumePaths":[Ljava/lang/String;
    :catch_0
    move-exception v1

    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private getYabaPath()Ljava/lang/String;
    .locals 2

    invoke-static {p0}, Lorg/uoyabause/android/Yabause;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0 # sdcard
    const-string v1, "/RetroArch/yabaCore.cfg"
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0 # sdcard/RetroArch/yabaCore.cfg
    return-object v0
.end method

.method private getPreferredCoreName()Ljava/lang/String;
    .locals 4

    const-string v3, "mednafen_saturn_libretro_android.so"
    invoke-static {p0}, Lorg/uoyabause/android/Yabause;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0
    const-string v1, "/RetroArch/yabaCore.cfg"
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
    invoke-direct {p0}, Lorg/uoyabause/android/Yabause;->getRomString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "LIBRETRO"
    invoke-direct {p0}, Lorg/uoyabause/android/Yabause;->getLibRetroString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "LIBRETRO_SD"
    invoke-direct {p0}, Lorg/uoyabause/android/Yabause;->getLibRetroSDString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "CONFIGFILE"
    invoke-direct {p0}, Lorg/uoyabause/android/Yabause;->getConfigString()Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "SDCARD"
    const-string v2, "/sdcard"
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "EXTERNAL"
    invoke-static {p0}, Lorg/uoyabause/android/Yabause;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v2
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/high16 v1, 0x10000000
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Lorg/uoyabause/android/Yabause;->startActivity(Landroid/content/Intent;)V
    return-void
.end method

.method private getRomString()Ljava/lang/String;
    .locals 3

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
    move-result-object v0 # Intent

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;
    move-result-object v0 # Uri

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    #invoke-static {v1, v0}, Lpaulscode/android/mupen64plusae/util/FileUtil;->getFileName(Landroid/content/Context;Landroid/net/Uri;)Ljava/lang/String;
    #move-result-object v1 # Game Name

    invoke-static {p0}, Lorg/uoyabause/android/Yabause;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0 # sdcard

    const-string v2, "/roms/ss/"
    invoke-virtual {v0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2 # sdcard/roms/ss/
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2 # sdcard/roms/ss/game.ss
    return-object v2
.end method

.method private getLibRetroString()Ljava/lang/String;
    .locals 2
    const-string v0, "/data/user/0/com.retroarch.ra32/cores/"
    invoke-direct {p0}, Lorg/uoyabause/android/Yabause;->getPreferredCoreName()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0 # /data/user/0/com.retroarch.ra32/cores/coreName
    return-object v0
.end method

.method private getLibRetroSDString()Ljava/lang/String;
    .locals 2

    invoke-static {p0}, Lorg/uoyabause/android/Yabause;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0 # sdcard
    const-string v1, "/RetroArch/cores/"
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0 # sdcard/RetroArch/cores/
    invoke-direct {p0}, Lorg/uoyabause/android/Yabause;->getPreferredCoreName()Ljava/lang/String;
    move-result-object v1
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0 # sdcard/RetroArch/cores/coreName
    return-object v0
.end method

.method private getConfigString()Ljava/lang/String;
    .locals 2

    invoke-static {p0}, Lorg/uoyabause/android/Yabause;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0 # sdcard
    const-string v1, "/RetroArch/config.cfg"
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0 # sdcard/RetroArch/config.cfg
    return-object v0
.end method

.method private logQuick(Ljava/lang/String;)V
    .locals 4

    .prologue

    #invoke-static {p0}, Lorg/uoyabause/android/Yabause;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    #move-result-object v0
    const-string v0, "/storage/F164-AC9C"
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

