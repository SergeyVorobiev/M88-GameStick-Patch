.method private logQuick(Ljava/lang/String;)V
    .locals 4

    .prologue

    invoke-static {p0}, Lcom/junction/fire/gametemplate/GameTemplate;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0

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

.method private writeToLog(Ljava/lang/String;)V
    .locals 5

    .prologue

    invoke-static {p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0

    const-string v1, "/log.txt"
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v1 # Path

    const-string v2, "\n"
    invoke-virtual {p1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v2 # Message

    :try_start_0
    new-instance v3, Ljava/io/FileWriter;
    const/4 v4, 0x1  # append = true
    invoke-direct {v3, v1, v4}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;Z)V
    invoke-virtual {v3, v2}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V
    invoke-virtual {v3}, Ljava/io/FileWriter;->flush()V
    invoke-virtual {v3}, Ljava/io/FileWriter;->close()V
    :try_end_0

    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_all

    :catch_all
    return-void
.end method

.method private writeToLog2(Ljava/lang/String;)V
    .locals 5

    invoke-static {p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    move-result-wide v1

    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    const-string v0, "/log_"
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    const-string v0, ".txt"
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v0

    :try_start
    new-instance v1, Ljava/io/FileWriter;
    const/4 v2, 0x0
    invoke-direct {v1, v0, v2}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;Z)V
    invoke-virtual {v1, p1}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V
    invoke-virtual {v1}, Ljava/io/FileWriter;->flush()V
    invoke-virtual {v1}, Ljava/io/FileWriter;->close()V
    return-void

    :try_end
    .catch Ljava/lang/Exception; {:try_start .. :try_end} :catch
    :catch
    return-void
.end method

invoke-direct {p0, v4}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->logQuick(Ljava/lang/String;)V

.method private logQuick(Ljava/lang/String;)V
    .locals 4

    .prologue

    invoke-static {p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0

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

.method private checkRetroArch()V
    .locals 3

    .prologue
    invoke-virtual {p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->getPackageManager()Landroid/content/pm/PackageManager;
    move-result-object v0

    :try_start
    #const-string v1, "com.retroarch.aarch64"
    const-string v1, "com.retroarch.ra32"
    const/4 v2, 0x0
    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    const-string v0, "RETROARCH_PACKAGE_FOUND"
    invoke-direct {p0, v0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->logQuick(Ljava/lang/String;)V
    return-void
    :try_end
    .catch Ljava/lang/Throwable; {:try_start .. :try_end} :catch_all

    :catch_all
    const-string v0, "RETROARCH_PACKAGE_NOT_FOUND"
    invoke-direct {p0, v0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->logQuick(Ljava/lang/String;)V
    return-void
.end method

.method private logEcho(Ljava/lang/String;)V
    .locals 5

    .prologue

    # Get sd card path
    invoke-static {p0}, Lcom/emu/browser/retroactivity/RetroActivityFuture;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0

    const-string v1, "/log_shell.txt"
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0   # Full path to log_shell

    const/4 v1, 0x3
    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0
    const-string v3, "sh"
    aput-object v3, v1, v2

    const/4 v2, 0x1
    const-string v3, "-c"
    aput-object v3, v1, v2

    const/4 v2, 0x2
    new-instance v3, Ljava/lang/StringBuilder;
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
    const-string v4, "echo \""
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    const-string v4, "\" >> "
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    move-result-object v3
    aput-object v3, v1, v2

    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;
    move-result-object v0
    invoke-virtual {v0, v1}, Ljava/lang/Runtime;->exec([Ljava/lang/String;)Ljava/lang/Process;

    return-void
.end method

.method private logQuick(Ljava/lang/String;)V
    .locals 4

    invoke-static {p0}, Lpaulscode/android/mupen64plusae/SplashActivity;->getTfCardPath(Landroid/content/Context;)Ljava/lang/String;
    move-result-object v0

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